`timescale 1ns/1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:22:53 03/01/2022
// Design Name:   xem6010_top
// Module Name:   /users/krenehan/MOANA2/FPGA/generic_scan_4by4_bkp/verilog/sim//xem6010_top_tb.v
// Project Name:  xilinx
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: xem6010_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


module mem_arbiter_safety_tb;

	reg rst;
	
	
	//------------------------------------------------------------------------
	// Clocks
	//------------------------------------------------------------------------
	reg ti_clk;
	reg tx_clk;
	reg dram_clk;
	always #10.42 ti_clk <= ~ti_clk; // 48 MHz
	always #43 tx_clk <= ~tx_clk;	// 12.5 MHz
	always #5.0 dram_clk <= ~dram_clk; // 100 MHz
	
	// Signals
	reg [31:0] state;
	reg [28:0] cmd_byte_addr_wr, cmd_byte_addr_rd;
	wire underflow, overflow;
	wire [15:0] error, first_error;
	
	localparam S_WRITE_2 = 12;
	
	//------------------------------------------------------------------------
	// Safety logic to catch situations where writing happens before data is read out
	//------------------------------------------------------------------------
	mem_arbiter_safety
	#			(
					.OKWIDTH			(16),
					.ADDR_WIDTH			(29)
				)
	u_safety	(
					.clk				(dram_clk),
					.reset				(rst),
					.state				(state),
					.wr_addr			(cmd_byte_addr_wr),
					.rd_addr			(cmd_byte_addr_rd),
					.underflow			(underflow),
					.overflow			(overflow),
					.error				(error),
					.first_error		(first_error)
	);

	integer k;

	initial begin
	
		// Initialize registers
		rst = 1;
		dram_clk = 0;
		ti_clk = 0;
		tx_clk = 0;
		state = 0;
		cmd_byte_addr_wr = 29'h1FFF_FFBF;
		cmd_byte_addr_rd = 29'h0;
		
		// Reset
		repeat (10) @(posedge dram_clk);
		rst = 0;
		repeat (10) @(posedge dram_clk);
		
		// Change state
		state = S_WRITE_2;
		repeat (10) @(posedge dram_clk);
		
		// Assert 
		for (k=0;k<16;k=k+1) begin
			cmd_byte_addr_wr = cmd_byte_addr_wr + 8;
			@(posedge dram_clk);
		end
		
		
	end
		
	
	
	
      
endmodule





