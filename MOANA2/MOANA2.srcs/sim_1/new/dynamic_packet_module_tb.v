`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2022 09:53:09 AM
// Design Name: 
// Module Name: dynamic_packet_module_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dynamic_packet_module_tb(

    );

	localparam NUMBER_OF_CHIPS = 16;
	localparam OKWIDTH = 16;
	localparam DIVIDER_BITS = 2;
	
	reg rst;
	reg clk;
	reg ti_clk;
	reg pipe_in_complete;
	reg pipe_in_write;
	reg [OKWIDTH-1:0] pipe_in_16b;
	reg begin_shift;
	wire shift_clk;
	wire [NUMBER_OF_CHIPS-1:0] shift_data;
	integer i;
	wire [OKWIDTH-1:0] pipe_in_data [16:0];
	
	// Pipe in data
	assign pipe_in_data[0] = 16'b1111_1111_0000_0000;
	assign pipe_in_data[1] = 16'b1111_1111_1111_1111;
	assign pipe_in_data[2] = 16'b0000_0000_0000_0000;
	assign pipe_in_data[3] = 16'b1111_1111_1111_1111;
	assign pipe_in_data[4] = 16'b0000_0000_0000_0000;
	assign pipe_in_data[5] = 16'b1111_1111_1111_1111;
	assign pipe_in_data[6] = 16'b0000_0000_0000_0000;
	assign pipe_in_data[7] = 16'b1111_1111_1111_1111;
	assign pipe_in_data[8] = 16'b0000_0000_0000_0000;
	assign pipe_in_data[9] = 16'b1111_1111_1111_1111;
	assign pipe_in_data[10] = 16'b0000_0000_0000_0000;
	assign pipe_in_data[11] = 16'b1111_1111_1111_1111;
	assign pipe_in_data[12] = 16'b0000_0000_0000_0000;
	assign pipe_in_data[13] = 16'b1111_1111_1111_1111;
	assign pipe_in_data[14] = 16'b0000_0000_0000_0000;
	assign pipe_in_data[15] = 16'b1111_1111_1111_1111;
	assign pipe_in_data[16] = 16'b0000_0000_1111_1111;
	
	// Clocks
	always #(10) clk <= ~clk;
	always #(12) ti_clk <= ~ti_clk;


	// DUT
	dynamic_packet_module 
	#(
		.NUMBER_OF_CHIPS(NUMBER_OF_CHIPS),
		.OKWIDTH(OKWIDTH),
		.DIVIDER_BITS(DIVIDER_BITS)
	)
	DUT (
		.rst(rst),
		.clk(clk),
		.ti_clk(ti_clk),
		
		.pipe_in_complete(pipe_in_complete),
		
		.pipe_in_write(pipe_in_write),
		.pipe_in_16b(pipe_in_16b),
		
		.shift_trigger(begin_shift),
		
		.shift_clk(shift_clk),
		.shift_data(shift_data)
	);
	
	
	// Experiment
	initial begin
	
		// Signal states at time 0
		rst <= 1'b1;
		clk <= 1'b0;
		ti_clk <= 1'b0;
		pipe_in_complete <= 1'b0;
		pipe_in_write <= 1'b0;
		pipe_in_16b <= 16'b0;
		begin_shift <= 1'b0;
		
		// Come out of reset
		repeat (10) @(posedge clk);
		rst <= 1'b0;
		repeat (100) @(posedge clk);
		
		// Write 17 packets of 16b data into FIFO
		@(posedge ti_clk);
		for (i=0;i<17;i=i+1) begin
			pipe_in_write <= 1'b1;
			pipe_in_16b <= pipe_in_data[i];
			@(posedge ti_clk);
		end
		pipe_in_16b <= 16'd0;
		pipe_in_write <= 1'b0;
		
		// Pipe in is complete
		repeat (100) @(posedge ti_clk);
		pipe_in_complete <= 1'b1;
		
		for (i=0;i<2;i=i+1) begin
			
			// Initiate shift
			@(posedge clk);
			begin_shift <= 1'b1;
			@(posedge clk);
			begin_shift <= 1'b0;
			
			// Wait for some number of cycles
			repeat (100) @(posedge clk);
			
		end
		
		// End sim	
		$finish;
	
	
	end
	
endmodule