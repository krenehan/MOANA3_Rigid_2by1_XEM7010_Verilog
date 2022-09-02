`timescale 1ns / 1ps

// Scan FSM is responsible for scanning things in and out
module scan_fsm(        
        // global signals
        clk, 
        rst,
        
        // interface with command FSM
        cmd,
        cmd_cell_length,
        cmd_cell_address,
        cmd_cell_total,
        cmd_row,
        cmd_valid,        
        cmd_ready,

        // Primary scan chain signals
        scan_clkp,
        scan_clkn,
        scan_out,
        
        // Individual scan signals (activated for each row)
        scan_in,
        scan_enable,
        scan_update,        
        
        // Shared scan signals (activated when any row is activated)
        scan_in_shared,
        scan_enable_shared,
        scan_update_shared,
        
        // interface with block ram
        ram_clk,
        ram_addr,
        ram_bit_sel,
        ram_write_en,
        ram_data_in,
        ram_data_out
    );

	//------------------------------------------------------------------------
	// Parameters
	//------------------------------------------------------------------------    
    // Command        
    parameter CellBits                  = 8;                    // Number of bits of the number of cells
    parameter ScanRows                  = 16;                   // Total number of cell rows that this can control
    parameter ScanRowBits               = 4;                    // Number of bits within CellBits used for the cell row
	
    // Scan clock generation
    parameter ScanClkDiv                = 48;                   // Divide the scan clock by this
    parameter ScanClkCntWidth           = 10;                   // Width of the scan_clk_cnt counter (must be > log2(ScanClkDiv / 2)
    
    // Block RAM access parameters
    parameter AddressWidth              = 18;
    parameter AccessWidth               = 16;
    parameter AddressStart              = 64;                   // Offset address to address the shared BRAM data portion
    //------------------------------------------------------------------------    
    
	//------------------------------------------------------------------------
	// Constants
	//------------------------------------------------------------------------    
    localparam CmdBits                  = 1;
    localparam Cmd_ScanRead             = 1'b0;
    localparam Cmd_ScanWrite            = 1'b1;
	//------------------------------------------------------------------------    

	//------------------------------------------------------------------------    
    // Genvars
	//------------------------------------------------------------------------    
	genvar i;
    //------------------------------------------------------------------------    

	//------------------------------------------------------------------------
	// I/O
	//------------------------------------------------------------------------
	// Interface with host interface/buffer
    input wire                          clk;		            // input reference clock, should be the same as used to gen. data
    input wire                          rst;				    // global reset signal
    
    input wire  [CmdBits-1:0]           cmd;
    input wire  [AddressWidth-1:0]      cmd_cell_length;
    input wire  [CellBits-1:0]          cmd_cell_address;
    input wire  [CellBits-1:0]          cmd_cell_total;
    input wire  [ScanRowBits-1:0]       cmd_row;
    input wire                          cmd_valid;
    output reg                          cmd_ready;
    
   
    output wire                         scan_clkp;
    output wire                         scan_clkn; 
    input wire  [ScanRows-1:0]          scan_out;

    // Individual signals
    output reg  [ScanRows-1:0]          scan_in;
    output reg  [ScanRows-1:0]          scan_enable;
    output reg  [ScanRows-1:0]          scan_update;
    
    // Shared signals
    output reg                          scan_in_shared;
    output reg                          scan_enable_shared;
    output reg                          scan_update_shared;
    
    output wire                         ram_clk;
    output wire [AddressWidth-1:0]      ram_addr;
    output wire                         ram_bit_sel;
    output wire                         ram_write_en;
    output wire [AccessWidth-1:0]       ram_data_in;
    input wire  [AccessWidth-1:0]       ram_data_out;
	//------------------------------------------------------------------------

    //------------------------------------------------------------------------
	// Signals
	//------------------------------------------------------------------------
    reg                                 scan_clk_en;    
    wire                                scan_clkp_int;
    wire                                scan_clkn_int;
    
    wire        [ScanRows-1:0]          scan_in_int;
    wire                                scan_in_shared_int;
    
    reg         [ScanRows-1:0]          scan_enable_int;
    reg         [ScanRows-1:0]          scan_enable_ram;
    reg         [ScanRows-1:0]          scan_update_int;
    reg         [ScanRows-1:0]          scan_out_int;
    
    // Command interface registers
    reg         [CmdBits-1:0]           cmd_reg;
    reg         [AddressWidth-1:0]      cmd_cell_length_reg;
    reg         [CellBits-1:0]          cmd_cell_address_reg;
    reg         [CellBits-1:0]          cmd_cell_total_reg;    
    reg         [ScanRowBits-1:0]       cmd_row_reg;
    
    // Two length counters, one keeping track of what is currently being scanned,
    // the other one for keeping track of what address to read
    reg         [AddressWidth-1:0]      length_cnt;
    reg         [AddressWidth-1:0]      ram_length_cnt;
    // Cell number counter (synchronized with length_cnt, address_cnt, respectively)
    reg         [CellBits-1:0]          cell_cnt;
    reg         [CellBits-1:0]          ram_cell_cnt;
        
    wire                                ram_length_cnt_enable;
    wire                                ram_length_cnt_done;    
    wire                                length_cnt_enable;
    wire                                length_cnt_done;    

    wire                                cell_cnt_enable;
    wire                                cell_cnt_done;
    
    reg                                 scan_start_req; 
    reg                                 scan_start_ack;
    reg                                 scan_done_req; 
    reg                                 scan_done_ack;
	
    wire                                scan_start;
    reg                                 scan_start_delay;
    
    wire                                ram_cell_cnt_enable, ram_cell_cnt_done;
    //------------------------------------------------------------------------
    
	//------------------------------------------------------------------------
    //  Assigns
    // ------------------------------------------------------------------------    
    assign ram_clk =                    scan_clkp_int;
    assign ram_addr =                   ram_length_cnt + AddressStart;
    assign ram_bit_sel =                1'b1;       // Always writing 1-bit at a time
    assign ram_write_en =               (ram_cell_cnt == cmd_cell_address_reg) & (cmd_reg == Cmd_ScanRead) & ram_length_cnt_enable;
    assign ram_data_in =                {AccessWidth{scan_out_int[cmd_row_reg]}};
    
    // Length cnt stays synchronized with what is currently being shifted in
    assign length_cnt_enable =          scan_enable_int[cmd_row_reg];
    assign length_cnt_done =            length_cnt_enable && (length_cnt == {AddressWidth{1'b0}});    

    assign cell_cnt_enable =            length_cnt_done;
    assign cell_cnt_done =              cell_cnt_enable && (cell_cnt == {CellBits{1'b0}});

    assign ram_length_cnt_enable =      scan_enable_ram[cmd_row_reg];
    assign ram_length_cnt_done =        ram_length_cnt_enable && (ram_length_cnt == {AddressWidth{1'b0}});    
    assign ram_cell_cnt_enable =        ram_length_cnt_done;
    assign ram_cell_cnt_done =          ram_cell_cnt_enable && (ram_cell_cnt == {CellBits{1'b0}});    

    assign scan_start =                 scan_start_ack & ~scan_start_req;    

    // Assign scan_in to wraparound from scan_out to scan_in by default, unless we are writing to the designated cell address
    generate for (i = 0; i < ScanRows; i = i + 1) begin: gen_scan_in
        assign scan_in_int[i] =         ((cell_cnt == cmd_cell_address_reg) && (cmd_reg == Cmd_ScanWrite) && (i == cmd_row_reg)) ?
                                            ram_data_out[0] : scan_out_int[i];
    end endgenerate
    assign scan_in_shared_int =         ((cell_cnt == cmd_cell_address_reg) && (cmd_reg == Cmd_ScanWrite)) ?
                                            ram_data_out[0] : scan_out_int[cmd_row_reg];
	//------------------------------------------------------------------------

	//------------------------------------------------------------------------
    // Command Interface Registers
	//------------------------------------------------------------------------
	always @(posedge clk) begin
        if (rst) begin
            cmd_reg <= {CmdBits{1'b0}};
            cmd_cell_length_reg <= {AddressWidth{1'b0}};
            cmd_cell_address_reg <= {CellBits{1'b0}};
            cmd_cell_total_reg <= {CellBits{1'b0}};
            cmd_row_reg <= {ScanRowBits{1'b0}};
        end
        else if (cmd_valid && cmd_ready) begin
            cmd_reg <= cmd;
            cmd_cell_length_reg <= cmd_cell_length;
            cmd_cell_address_reg <= cmd_cell_address;
            cmd_cell_total_reg <= cmd_cell_total;
            cmd_row_reg <= cmd_row;
        end
    end

    // scan command ready
    always @(posedge clk) begin
        if (rst)
            cmd_ready <= 1'b1;
        else if (cmd_valid && cmd_ready)
            cmd_ready <= 1'b0;
        else if (scan_done_ack & ~scan_done_req)
            cmd_ready <= 1'b1;
    end
    //------------------------------------------------------------------------

	//------------------------------------------------------------------------
    //  Scan Clock Generation
	//------------------------------------------------------------------------
	scan_clk_gen    #   (   .ScanClkDiv         (ScanClkDiv),
                            .ScanClkCntWidth    (ScanClkCntWidth))
            clk_maker   (   .clk                (clk), 
                            .rst                (rst),        
                            .scan_clk_en        (scan_clk_en),        
                            .scan_clkp          (scan_clkp),
                            .scan_clkn          (scan_clkn),
                            .scan_clkp_ungated  (scan_clkp_int),
                            .scan_clkn_ungated  (scan_clkn_int));
    
    always @(negedge scan_clkn_int) begin
        if (rst) scan_clk_en <= 1'b0;
        else scan_clk_en <= ~cmd_ready;
    end    
	//------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    // Scan enable registers
    //------------------------------------------------------------------------
    // Scan enable ram starts and stops differently from scan enable internal
    always @(posedge scan_clkp_int) begin
        if (rst)
            scan_enable_ram <= {ScanRows{1'b0}};
        else if ((cmd_reg == Cmd_ScanWrite) & scan_start)
            scan_enable_ram[cmd_row_reg] <= 1'b1;
        else if ((cmd_reg == Cmd_ScanRead) & scan_start_delay)
            scan_enable_ram[cmd_row_reg] <= 1'b1;
        else if (ram_cell_cnt_done)
            scan_enable_ram <= {ScanRows{1'b0}};
    end
    
    always @(posedge scan_clkp_int) begin
        if (rst) 
            scan_enable_int <= {ScanRows{1'b0}};
        else if (scan_start_delay)
            scan_enable_int[cmd_row_reg] <= 1'b1;
        else if (cell_cnt_done) 
            scan_enable_int <= {ScanRows{1'b0}};
    end
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    // Scan update registers
    //------------------------------------------------------------------------
    always @(posedge scan_clkp_int) begin
        if (rst)
            scan_update_int <= {ScanRows{1'b0}};
        else if ((cmd_reg == Cmd_ScanWrite) && cell_cnt_done)
            scan_update_int[cmd_row_reg] <= 1'b1;
        else
            scan_update_int <= {ScanRows{1'b0}};
    end
    //------------------------------------------------------------------------
    
	//------------------------------------------------------------------------
    // Scan-position synchronized Length and cell counters
	//------------------------------------------------------------------------    
    always @(posedge scan_clkp_int) begin
        if (rst)
            length_cnt <= {AddressWidth{1'b0}};
        else if (scan_start | length_cnt_done)
            length_cnt <= cmd_cell_length_reg - 1;
        else if (length_cnt_enable)
            length_cnt <= length_cnt - 1;
    end

    always @(posedge scan_clkp_int) begin
        if (rst)
            cell_cnt <= {CellBits{1'b0}};
        else if (scan_start | cell_cnt_done)
            cell_cnt <= cmd_cell_total_reg - 1;        
        else if (cell_cnt_enable)
            cell_cnt <= cell_cnt - 1;
    end    
	//------------------------------------------------------------------------
    
	//------------------------------------------------------------------------
    // Ram Address synchronized Length and cell counters
	//------------------------------------------------------------------------    
    always @(posedge scan_clkp_int) begin
        if (rst)
            ram_length_cnt <= {AddressWidth{1'b0}};
        else if (scan_start | ram_length_cnt_done)
            ram_length_cnt <= cmd_cell_length_reg - 1;
        else if (ram_length_cnt_enable)
            ram_length_cnt <= ram_length_cnt - 1;
    end

    always @(posedge scan_clkp_int) begin
        if (rst)
            ram_cell_cnt <= {CellBits{1'b0}};
        else if (scan_start | ram_cell_cnt_done)
            ram_cell_cnt <= cmd_cell_total_reg - 1;        
        else if (ram_cell_cnt_enable)
            ram_cell_cnt <= ram_cell_cnt - 1;
    end    
	//------------------------------------------------------------------------    

    //------------------------------------------------------------------------    
	//  4-Phase Scan Start/end Requests
    //------------------------------------------------------------------------    
    always @(posedge clk) begin
        if (rst) scan_start_req <= 1'b0;
        else if (cmd_ready & cmd_valid) scan_start_req <= 1'b1;
        else if (scan_start_ack) scan_start_req <= 1'b0;
    end

    always @(posedge clk) begin
        if (rst) scan_done_ack <= 1'b0;
        else scan_done_ack <= scan_done_req;
    end        

    always @(posedge scan_clkp_int) begin
        if (rst) scan_done_req <= 1'b0;
        else if (cell_cnt_done) scan_done_req <= 1'b1;
        else if (scan_done_ack) scan_done_req <= 1'b0;
    end
    
    always @(posedge scan_clkp_int) begin
        if (rst) scan_start_ack <= 1'b0;
        else scan_start_ack <= scan_start_req;
    end

    always @(posedge scan_clkp_int) begin
        if (rst) scan_start_delay <= 1'b0;
        else scan_start_delay <= scan_start;
    end
    //------------------------------------------------------------------------    
    
    //------------------------------------------------------------------------
    //  Delay scan outputs so it is not racing against scan_clkp rising edge
	//------------------------------------------------------------------------
    always @(*) scan_out_int = scan_out;
    
    always @(negedge scan_clkp) begin
        if (rst) begin
            scan_in <= {ScanRows{1'b0}};
            scan_enable <= {ScanRows{1'b0}};
            scan_update <= {ScanRows{1'b0}};
            
            scan_in_shared <= 1'b0;
            scan_enable_shared <= 1'b0;
            scan_update_shared <= 1'b0;
        end
        else begin
            scan_in <= scan_in_int;
            scan_enable <= scan_enable_int;
            scan_update <= scan_update_int;
            
            scan_in_shared <= scan_in_shared_int;
            scan_enable_shared <= |scan_enable_int;
            scan_update_shared <= |scan_update_int;
        end
	end
    //------------------------------------------------------------------------
   
endmodule

