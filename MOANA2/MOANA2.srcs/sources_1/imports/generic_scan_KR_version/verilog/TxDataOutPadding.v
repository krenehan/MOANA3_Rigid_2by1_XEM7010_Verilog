`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:32 12/11/2021 
// Design Name: 
// Module Name:    TxDataOutPadding 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TxDataOutPadding(
    clk,
    rst,
    prev_fifo_valid,
    prev_fifo_empty,
    prev_fifo_data,
	 prev_fifo_rd_en,
	 next_fifo_data,
	 next_fifo_wr_en
	 //padding, data_passthrough, bit_counter, disable_read_en, padding_begins_next_cycle, padding_ends_next_cycle
    );
	 
	 // Parameters
	 parameter DataWidth = 20;
	 parameter PaddedWidth = 32;
	 parameter BitCounterWidth = 5; // Must overflow at PaddedWidth 
	 localparam PaddedWidthMinusOne = PaddedWidth-1;
	 localparam NumberOfPadBits = PaddedWidth-DataWidth;
	 
	 
	 // IO
	 input 	wire 							clk;
	 input 	wire 							rst;
	 input 	wire 							prev_fifo_valid;
    input 	wire 							prev_fifo_empty;
	 input 	wire 							prev_fifo_data;
	 output 	wire 							prev_fifo_rd_en;
	 output 	wire 							next_fifo_data;
	 output 	reg 							next_fifo_wr_en;
	 
	 //output wire data_passthrough;
	 //output wire padding;
	 //output reg [BitCounterWidth-1:0] bit_counter;
	 //output wire disable_read_en;
	 //output wire padding_begins_next_cycle;
	 //output wire padding_ends_next_cycle;
	 
	 // Wires
	 wire 									data_passthrough;
	 wire										padding;
	 reg [BitCounterWidth-1:0] 		bit_counter;
	 wire disable_read_en;
	 wire padding_begins_next_cycle;
	 wire padding_ends_next_cycle;
	 
	 // Read enable control
	 // Read enable must be disabled during padding so that bits are not missed
	 assign disable_read_en = (bit_counter >= (DataWidth[BitCounterWidth-1:0] - 1)) & ~padding_ends_next_cycle;
	 assign prev_fifo_rd_en = ~(prev_fifo_empty | disable_read_en) ;
	 
	 // Signals to indicate whether or not data is passing from prev_fifo to next_fifo, or if padding is happening
	 assign data_passthrough = bit_counter < DataWidth[BitCounterWidth-1:0];
	 assign padding = bit_counter >= DataWidth[BitCounterWidth-1:0];
	 assign padding_begins_next_cycle = bit_counter == (DataWidth[BitCounterWidth-1:0] - 1);
	 assign padding_ends_next_cycle = bit_counter == PaddedWidthMinusOne[BitCounterWidth-1:0];
	 
	 // Multiplexer for padding 0s
	 assign next_fifo_data = data_passthrough ? prev_fifo_data : 1'b0;
     
    // Write begins a cycle after read is enabled from first fifo
	 // Write holds through the padding phase
	 // Write is disabled at the end of the last padding phase when the first FIFO has completely emptied out
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            next_fifo_wr_en <= 1'b0;
		  end else if (prev_fifo_empty & padding_ends_next_cycle) begin
				next_fifo_wr_en <= 1'b0;
        end else if (prev_fifo_rd_en | padding | padding_begins_next_cycle) begin
            next_fifo_wr_en <= 1'b1;
        end else begin
            next_fifo_wr_en <= 1'b0;
        end
    end
	
	// Counter to count the number of bits written into the next FIFO
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			bit_counter <= 1'b0;
		end else if (next_fifo_wr_en) begin
			bit_counter <= bit_counter + 1;
		end else begin
			bit_counter <= bit_counter;
		end
	end
					


endmodule
