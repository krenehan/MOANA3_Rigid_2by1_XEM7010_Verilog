`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:29 01/06/2022 
// Design Name: 
// Module Name:    up_down_counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Up down counter with no overflow
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module up_down_counter 
	#( 	parameter WIDTH = 10)
	(
		input  wire clk,
		input  wire rst,
		input  wire inc,
		input  wire dec,
		output wire full,
		output wire empty,
		output wire empty_next_cycle,
		output reg [WIDTH-1:0] count
    );
	 
	// Full and empty flags 
	assign full = &count;
	assign empty = !(|count);
	assign empty_next_cycle = (count == 1) & dec;
	
	
	// Up down counter with no overflow
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			count <= 0;
		end else if (inc & dec) begin
			count <= count;
		end else if (inc & ~full) begin
			count <= count + 1;
		end else if (dec & ~empty) begin
			count <= count - 1;
		end else begin
			count <= count;
		end
	end
			


endmodule
