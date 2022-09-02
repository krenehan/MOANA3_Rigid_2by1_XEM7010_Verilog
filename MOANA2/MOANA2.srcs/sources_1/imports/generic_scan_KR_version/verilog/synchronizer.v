`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:03:05 01/26/2022 
// Design Name: 
// Module Name:    synchronizer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 	Synchronizer structure for crossing clock domains.
//						Implicit assumption is that user will ensure src_signal is stable
//						in src_clk domain for a few cycles of dest_clk domain.
//						Note that this structure should not be used 
// Parameters:
//						NumSignals - Number of signals to sync, which set the width of input and output
//						Stages - Number of sync flops in dest_clk domain
//
// Dependencies: None
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module synchronizer(
	input wire rst,
	input wire src_clk,
	input wire dest_clk,
	input wire [NumSignals-1:0] src_sig,
	output wire [NumSignals-1:0] dest_sig
    );
	 
	// Parameters
	parameter NumSignals = 1;
	parameter Stages = 2;
	
	// Genvar
	genvar i;
	
	// Internal wires
	reg [NumSignals-1:0] src_flop;
	reg [NumSignals-1:0] dest_flop [Stages-1:0];
	
	// Destination signal comes from output of last flop
	assign dest_sig = dest_flop[Stages-1];
	
	// Synchronizer input flop
	always @(posedge src_clk or posedge rst) begin
		if (rst) begin
			src_flop <= 0;
		end else begin
			src_flop <= src_sig;
		end
	end
	
	// Synchronizer first output flop
	always @(posedge dest_clk or posedge rst) begin
		if (rst) begin
			dest_flop[0] <= 0;
		end else begin
			dest_flop[0] <= src_flop;
		end
	end
	
	generate for (i = 1; i < Stages; i = i + 1) begin : gen_synco_flops
		always @(posedge dest_clk or posedge rst) begin
			if (rst) begin
				dest_flop[i] <= 0;
			end else begin
				dest_flop[i] <= dest_flop[i-1];
			end
		end
	end endgenerate
	
	
	
	


endmodule
