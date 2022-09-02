`timescale 1ns / 1ps

// Generates a two-phase scan clock from a reference clock
module scan_clk_gen(        
        // global signals
        clk, 
        rst,        
        // scan clock gating
        scan_clk_en,        
        // gated scan chain clocks
        scan_clkp,
        scan_clkn,
        // ungated scan chain clocks
        scan_clkp_ungated,
        scan_clkn_ungated
    );

	//------------------------------------------------------------------------
	// Parameters
	//------------------------------------------------------------------------    
    // Scan clock generation
    parameter ScanClkDiv                = 48;                   // Divide the scan clock by this
    parameter ScanClkCntWidth           = 10;                   // Width of the scan_clk_cnt counter (must be > log2(ScanClkDiv / 2)
    //------------------------------------------------------------------------    
    
	//------------------------------------------------------------------------
	// I/O
	//------------------------------------------------------------------------
	// Interface with host interface/buffer
    input wire                          clk;		            // input reference clock, should be the same as used to gen. data
    input wire                          rst;				    // global reset signal
    
    // scan clock gating
    input wire                          scan_clk_en;
    // gated scan chain clocks
    output wire                         scan_clkp;
    output wire                         scan_clkn;
    // ungated scan chain clocks    
    output wire                         scan_clkp_ungated;
    output wire                         scan_clkn_ungated;
	//------------------------------------------------------------------------

    //------------------------------------------------------------------------
	// Signals
	//------------------------------------------------------------------------
    reg         [ScanClkCntWidth-1:0]   scan_clk_cnt;
    reg         [3:0]                   scan_clkp_reg;
    reg         [3:0]                   scan_clkn_reg;
	//------------------------------------------------------------------------
    

	//------------------------------------------------------------------------
    //  Assigns
    // ------------------------------------------------------------------------
    assign scan_clkp =                  scan_clkp_ungated & scan_clk_en;
    assign scan_clkn =                  scan_clkn_ungated & scan_clk_en;
    assign scan_clkp_ungated =          scan_clkp_reg[3];
    assign scan_clkn_ungated =          scan_clkn_reg[3];
	//------------------------------------------------------------------------

	//------------------------------------------------------------------------
    //  Scan Clock Generation
	//------------------------------------------------------------------------
	always @(posedge clk) begin
		if (rst)
            scan_clk_cnt <= {ScanClkCntWidth{1'b0}};
        else if (scan_clk_cnt == ScanClkDiv / 4 - 1)
            scan_clk_cnt <= {ScanClkCntWidth{1'b0}};
        else
            scan_clk_cnt <= scan_clk_cnt + 1;
    end

    always @(posedge clk) begin
        if (rst) begin
            scan_clkp_reg <= 4'b0100;
            scan_clkn_reg <= 4'b0001;
        end
        else if (scan_clk_cnt == ScanClkDiv / 4 - 1) begin
            scan_clkp_reg <= {scan_clkp_reg[2:0], scan_clkp_reg[3]};
            scan_clkn_reg <= {scan_clkn_reg[2:0], scan_clkn_reg[3]};
        end        
    end
	//------------------------------------------------------------------------
    
	//------------------------------------------------------------------------
    //  Consistency Check
	//------------------------------------------------------------------------
    `ifdef BEHAVIORAL
    initial begin
        if ((ScanClkDiv == 0) || (ScanClkDiv % 4 !== 0)) begin
            $display("Consistency error: ScanClkDiv must be a multiple of 4 and greater than 0!");
            $finish;
        end    
    end
    `endif
	//------------------------------------------------------------------------
    
endmodule

