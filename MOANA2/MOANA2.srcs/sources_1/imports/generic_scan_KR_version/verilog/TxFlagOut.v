
`timescale 1ns/1ps
// ============================================================================
// An interface to set wr_en based on signals from the FIFO
// ============================================================================
module TxFlagOut(
		rst,
		chip_rst,
		block_next_streamout,
		next_streamout_will_be_blocked,
		tx_clk,
		tx_data,
		tx_flagout,
		data_count,
        data_loaded,
        pad_captured, 
        blocking
    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    localparam 	PacketWidth = 		12'd3000;
    localparam  PacketWidthInt =    12'd2999;
	localparam	CountBits = 		12;
	localparam	DummyBits = 		CountBits-1;


    //-----------------------------------------------------------------------------------
    //    I/O
    //-----------------------------------------------------------------------------------
	input 	wire 						rst;
	input 	wire 						chip_rst;
	input 	wire						block_next_streamout;
    input 	wire                      	tx_clk;
    input 	wire                      	tx_data;
	output 	wire						tx_flagout;
    output 	reg                      	data_loaded;
    output 	reg		[CountBits-1:0] 	data_count;
    output 	reg							pad_captured;
	output reg						blocking;
    

    //-----------------------------------------------------------------------------------
    //  Signals
    //-----------------------------------------------------------------------------------
	reg									first_readout_ignored;
	output reg									next_streamout_will_be_blocked;
	reg 								fifo_wr_en;
	

    //-----------------------------------------------------------------------------------
    //  Assigns
    //-----------------------------------------------------------------------------------
	assign tx_flagout = fifo_wr_en & ~blocking;
	

    //-----------------------------------------------------------------------------------
    //  Set tx_flagout 
    //-----------------------------------------------------------------------------------
	always @(posedge tx_clk or posedge rst) begin
		if (rst) begin
			fifo_wr_en <= 1'b0;
			pad_captured <= 1'b0;
            data_loaded <= 1'b0;
			data_count <= {CountBits{1'b0}};
        end else if (data_loaded) begin
            data_loaded <= 1'b0;
		end else if (data_count == PacketWidthInt) begin
			// If we reach the end of the packet
			fifo_wr_en <= 1'b0;
			pad_captured <= 1'b0;
			data_count <= {CountBits{1'b0}};
            data_loaded <= 1'b1;
		end else if (pad_captured) begin
			data_count <= data_count + {{DummyBits{1'b0}}, 1'b1};
		end else if (tx_data) begin
			// FIFOs are not first-word-fall-through
			// fifo_wr_en needs to be set immediately
			// FIFO captures first packet next cycle
			fifo_wr_en <= 1'b1;
			pad_captured <= 1'b1;
		end
	end


   //-----------------------------------------------------------------------------------
	// When the TxFlagOut block receives the block_next_streamout signal, it will ignore the next tx
   //-----------------------------------------------------------------------------------
	always @(posedge tx_clk or posedge chip_rst) begin
		if (chip_rst) begin
			next_streamout_will_be_blocked <= 1'b0;
		end else if (block_next_streamout) begin
			next_streamout_will_be_blocked <= 1'b1;
		end else if (blocking) begin
			next_streamout_will_be_blocked <= 1'b0;
		end
	end   
	
   //-----------------------------------------------------------------------------------
	// When the TxFlagOut block receives the block_next_streamout signal
   //-----------------------------------------------------------------------------------
	always @(posedge tx_clk or posedge chip_rst) begin
		if (chip_rst) begin
			blocking <= 1'b0;
		end else if (next_streamout_will_be_blocked & ~fifo_wr_en) begin
			blocking <= 1'b1;
		end else if (data_loaded) begin
			blocking <= 1'b0;
		end
	end   
	
	
	 
endmodule
