
`timescale 1ns/1ps
`define HalfCycle 0.5

module fpga_control(
        //-------------------------------------------------------------------------------
        //    Global Signals                                                             
        //-------------------------------------------------------------------------------
        clk,
        rst,
        //-------------------------------------------------------------------------------

        //-------------------------------------------------------------------------------
        // Opal-Kelly Pipe Interface                                                          
        //-------------------------------------------------------------------------------
        clr_inbuf,
        clr_outbuf,

        pipeI_data,
        pipeI_write,
        pipeI_ready,

        pipeO_data,
        pipeO_read,
        pipeO_valid,

        pipeIO_err,
        //-------------------------------------------------------------------------------

        //-------------------------------------------------------------------------------
        // Chip Scan I/O                                                                      
        //-------------------------------------------------------------------------------        
        // Primary I/O
        scan_clkp,
        scan_clkn,
        //scan_rst,
        scan_out,

        // Individual I/O
        scan_enable,
        scan_update,
        scan_in,
        
        // Shared I/O
        scan_enable_shared,
        scan_update_shared,
        scan_in_shared,
        //-------------------------------------------------------------------------------
        
        //-------------------------------------------------------------------------------
        // Debug State
        //-------------------------------------------------------------------------------
        cmd_fsm_state
        //-------------------------------------------------------------------------------
    );

    //------------------------------------------------------------------------
    //  User Parameters
    //------------------------------------------------------------------------
    parameter Capacity =                    16384 * 16;     // 16384 is the size of a BRAM on the Spartan-3

    // For some unknown reason, a value of 800 does not work for packet length!
    // For some unknown reason, a value of 1000 does not work for packet length!
    // Anything above or below that will work
    parameter PacketLength =                25;           // Expected packet length (in number of flits) from OK
    parameter HeaderFlits =                 4;              // Number of Flits that correspond to the header    
    
    parameter LengthBits =                  18;             // Number of bits used to specify the length of each cell
    parameter CellBits =                    8;              // Number of bits to address the number of cells
    parameter ScanRows =                    16;             // Total number of cell rows that this can control
    parameter ScanRowBits =                 4;              // Number of bits within CellBits used for the cell row    

    parameter PDMBits =                     10;             // Number of bits of the PDM driver
    
    // Scan clock generation
    // Division by 96 (500 kHz clock) is a known safe value for EOSX
    // Division by 8 (6 MHz clock) is a known safe value for Micron DX chips
    parameter ScanClkDiv =                  96;              // Divide the scan clock by this
    parameter ScanClkCntWidth =             16;             // Width of the scan_clk_cnt counter (must be > log2(ScanClkDiv / 2)
    // ADC clock generation
    parameter ADCClkDiv =                   6;              // Must be at least 2
    parameter ADCClkCntWidth =              10;             // Width of the adc_clk_cnt counter (must be > log2(ADCClkDiv / 2)
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    //  Constants (Do not modify!)
    //------------------------------------------------------------------------ 
    localparam CountWidth =                 16;             // Count width of the OK interface
    localparam FlitWidth =                  16;             // Word size of OK interface
    localparam HeaderSize =                 HeaderFlits * FlitWidth;
    localparam PacketBits =                 PacketLength * FlitWidth;

    localparam AddressWidth =               LengthBits;
    localparam AddressStartOk =             0;                              // Offset address of OK buffer
    localparam AddressStartScan =           AddressStartOk + HeaderSize;    // Offset address of scan bits
    localparam AddressOffsetADC =           AddressStartOk + HeaderSize;    // Offset address of ADC output
    //------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //    Global Signals
    //-----------------------------------------------------------------------------------
    input wire                              clk;
    input wire                              rst;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    // Opal-Kelly Interface
    //-----------------------------------------------------------------------------------
    input wire                              clr_inbuf;
    input wire                              clr_outbuf;
    
    input wire  [FlitWidth-1:0]             pipeI_data;
    input wire                              pipeI_write;
    output wire                             pipeI_ready;
    
    output wire [FlitWidth-1:0]             pipeO_data;
    input wire                              pipeO_read;
    output wire                             pipeO_valid;
    
    output wire                             pipeIO_err;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    // Scan I/O
    //-----------------------------------------------------------------------------------
    output wire                             scan_clkp;
    output wire                             scan_clkn;
    //output wire                             scan_rst;
    input wire  [ScanRows-1:0]              scan_out;

    output wire [ScanRows-1:0]              scan_enable;
    output wire [ScanRows-1:0]              scan_update;
    output wire [ScanRows-1:0]              scan_in;

    output wire                             scan_enable_shared;
    output wire                             scan_update_shared;
    output wire                             scan_in_shared;
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    // Debug Outputs
    //-----------------------------------------------------------------------------------
    output wire [7:0]                       cmd_fsm_state;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  DUT Signals
    //-----------------------------------------------------------------------------------
    // Core to Buffer Interface    
    wire        [HeaderSize-1:0]            ok2core_header;     // buffer to core header    
    wire                                    data_valid;         // The data piped in is valid (assert when pipe in is done)
    wire                                    data_free;          // Pulse to free the data buffer (pulse when data in buffer no longer needed)
    wire                                    data_return;        // Pulse to indicate that the data buffer has data to return to the OK
    
    // Buffer interface signals
    wire                                    buf_clk_scan;
    wire        [AddressWidth-1:0]          buf_addr_scan;
    wire                                    buf_bit_sel_scan;
    wire                                    buf_write_en_scan;
    wire        [FlitWidth-1:0]             buf_data_in_scan;
    wire        [FlitWidth-1:0]             buf_data_out_scan;
    
    // Scan fsm interface signals
    wire                                    scan_fsm_cmd;
    wire        [LengthBits-1:0]            scan_fsm_cmd_cell_length;
    wire        [CellBits-1:0]              scan_fsm_cmd_cell_address;
    wire        [CellBits-1:0]              scan_fsm_cmd_cell_total;
    wire        [ScanRowBits-1:0]           scan_fsm_cmd_row;
    wire                                    scan_fsm_cmd_valid;
    wire                                    scan_fsm_cmd_ready;    
    //-----------------------------------------------------------------------------------

    //------------------------------------------------------------------------
    //  Opal Kelly Pipe Interface to our blocks
    //------------------------------------------------------------------------
    pipe_interface  #   (   .PacketLength               (PacketLength),
                            .FlitWidth                  (FlitWidth),
                            .AddressWidth               (AddressWidth),
                            .AddressStart               (AddressStartOk),
                            .HeaderFlits                (HeaderFlits),
                            .CountWidth                 (CountWidth))
            iok2core    (   .clk                        (clk),
                            .rst                        (rst),  
                            .clr_inbuf                  (clr_inbuf),
                            .clr_outbuf                 (clr_outbuf),
            
                            .pipeI_ready                (pipeI_ready),
                            .pipeI_write                (pipeI_write),
                            .pipeI_data                 (pipeI_data),
                            
                            .pipeO_valid                (pipeO_valid),
                            .pipeO_read                 (pipeO_read),
                            .pipeO_data                 (pipeO_data),

                            .pipeIO_err                 (pipeIO_err),
            
                            .ok2core_header             (ok2core_header),                            
                            .data_valid                 (data_valid),
                            .data_free                  (data_free),
                            .data_return                (data_return),
                                        
                            .buf_clk                    (buf_clk_scan),
                            .buf_addr                   (buf_addr_scan),
                            .buf_bit_sel                (buf_bit_sel_scan),
                            .buf_write_en               (buf_write_en_scan),
                            .buf_data_in                (buf_data_in_scan),
                            .buf_data_out               (buf_data_out_scan));
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    //  Command FSM
    //------------------------------------------------------------------------
    cmd_fsm         #   (   .HeaderSize                 (HeaderSize),
                            .LengthBits                 (LengthBits),
                            .CellBits                   (CellBits),
                            .ScanRows                   (ScanRows),
                            .ScanRowBits                (ScanRowBits),
                            .PDMBits                    (PDMBits))
                command (   .clk                        (clk),
                            .rst                        (rst),
                            .ok2core_header             (ok2core_header),
                            .data_valid                 (data_valid),
                            .data_free                  (data_free),
                            .data_return                (data_return),
                            
                            .scan_fsm_cmd               (scan_fsm_cmd),
                            .scan_fsm_cmd_cell_length   (scan_fsm_cmd_cell_length),
                            .scan_fsm_cmd_cell_address  (scan_fsm_cmd_cell_address),
                            .scan_fsm_cmd_cell_total    (scan_fsm_cmd_cell_total),
                            .scan_fsm_cmd_row           (scan_fsm_cmd_row),
                            .scan_fsm_cmd_valid         (scan_fsm_cmd_valid),
                            .scan_fsm_cmd_ready         (scan_fsm_cmd_ready),
                            
                            .state                      (cmd_fsm_state));
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    //  Scan FSM
    //------------------------------------------------------------------------
    scan_fsm        #   (   .CellBits                   (CellBits),
                            .ScanRows                   (ScanRows),
                            .ScanRowBits                (ScanRowBits),
                            .ScanClkDiv                 (ScanClkDiv),
                            .ScanClkCntWidth            (ScanClkCntWidth),
                            .AddressWidth               (AddressWidth),
                            .AddressStart               (AddressStartScan))
            scan_ctrl   (   .clk                        (clk), 
                            .rst                        (rst),
                            
                            .cmd                        (scan_fsm_cmd),
                            .cmd_cell_length            (scan_fsm_cmd_cell_length),
                            .cmd_cell_address           (scan_fsm_cmd_cell_address),
                            .cmd_cell_total             (scan_fsm_cmd_cell_total),
                            .cmd_row                    (scan_fsm_cmd_row),
                            .cmd_valid                  (scan_fsm_cmd_valid),
                            .cmd_ready                  (scan_fsm_cmd_ready),
                            
                            .scan_clkp                  (scan_clkp),
                            .scan_clkn                  (scan_clkn),
                            .scan_out                   (scan_out),
                            
                            .scan_in                    (scan_in),
                            .scan_enable                (scan_enable),
                            .scan_update                (scan_update),
                            
                            .scan_in_shared             (scan_in_shared),
                            .scan_enable_shared         (scan_enable_shared),
                            .scan_update_shared         (scan_update_shared),
                            
                            .ram_clk                    (buf_clk_scan),
                            .ram_addr                   (buf_addr_scan),
                            .ram_bit_sel                (buf_bit_sel_scan),
                            .ram_write_en               (buf_write_en_scan),
                            .ram_data_in                (buf_data_in_scan),
                            .ram_data_out               (buf_data_out_scan));
    //------------------------------------------------------------------------
    
endmodule
