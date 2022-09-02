`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:56:14 04/10/2021 
// Design Name: 
// Module Name:    pipe_interface 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Pipe interface to Opal Kelly FIFO that translates data from Python to data in a register bank.
//              This is meant for smaller pipes. Register banks become too large when very large pipes are needed. 
//              This module takes care of all necessary bit reorganization.
//
// Dependencies: FIFO called fifo_W16_R1 that takes 16-bit input and serializes to 1-bit output.
//               This FIFO needs to have separate write and read clocks. 
//               Requires a dedicated OK wire indicating transfer size in number of bits.
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module  pipe2registerbank(

        // Generic clock and reset signals
        rst,
        clk,
        ok_clk,
    
        // Signals from pipe in
        pipeI_data,
        pipeI_write,
        transfer_size,
    
        // Register bank with stored data
        register_bank
        
    );
    
    //-----------------------------------------------------------------------------------
    //    Parameters
    //-----------------------------------------------------------------------------------
    parameter OKWidth =                     16;
    parameter BufferSize =                   144;
    parameter BufferAddressBits =            8; // Must be >= clog2(BufferSize)
    
	 genvar i;
    
    //-----------------------------------------------------------------------------------
    //    IO
    //-----------------------------------------------------------------------------------
    input   wire                            rst;
    input   wire                            clk;
    input   wire                            ok_clk;
    input   wire    [OKWidth-1:0]           pipeI_data;
    input   wire                            pipeI_write;   // Write signal from pipe
    input   wire    [OKWidth-1:0]           transfer_size; // Transfer size in bits
    output  reg     [BufferSize-1:0]         register_bank;
    
    
    //-----------------------------------------------------------------------------------
    //    Internal wires
    //-----------------------------------------------------------------------------------
    wire            [OKWidth-1:0]           pipeI_data_shuffled;
	 wire				  [OKWidth-1:0]			  pipeI_data_reversed;
    wire                                    fifo_full           [1:0];
    wire                                    fifo_empty          [1:0];
    wire                                    fifo_underflow       [1:0];
    wire                                    fifo_overflow        [1:0];
    wire            [8:0]                   fifo_rd_data_count;
    wire                                    fifo_valid          [1:0];
    wire            [7:0]                   fifo0_dout;
    wire                                    fifo1_dout;
    reg             [BufferAddressBits-1:0]  write_address;
    wire                                    packet_finished;
    
    
    //-----------------------------------------------------------------------------------
    //    Assigns
    //-----------------------------------------------------------------------------------
	 assign packet_finished = write_address == BufferSize[BufferAddressBits-1:0] - 1;
    
    
	//-----------------------------------------------------------------------------------
	//    Shuffle bytes and reverse
	//-----------------------------------------------------------------------------------
	assign pipeI_data_shuffled[7:0] = pipeI_data[15:8];
	assign pipeI_data_shuffled[15:8] = pipeI_data[7:0];
	
	generate for (i = 0; i < OKWidth; i = i + 1) begin : reverse_pipe
		assign pipeI_data_reversed[i] = pipeI_data_shuffled[OKWidth-1-i];
	end endgenerate
    
    
    //-----------------------------------------------------------------------------------
    //    fifo_W16_R8 gets 16 bits from OK pipeout and translates to 8-bit output
    //-----------------------------------------------------------------------------------
	fifo_W16_R8 fifo0 		(
									 .rst 				(rst),
									 .wr_clk 			(ok_clk),
									 .rd_clk 			(ok_clk),
									 .din 				(pipeI_data_reversed),	// 16-bit in data
									 .wr_en 			(pipeI_write),
									 .rd_en 			(~fifo_full[1]),
									 .dout 				(fifo0_dout),  // 8-bit out data
									 .full 				(fifo_full[0]),
									 .empty 			(fifo_empty[0]),
									 .valid 			(fifo_valid[0])
	);
    
    //-----------------------------------------------------------------------------------
    //    fifo_W8_R1 gets 8 bits from OK pipeout and serializes to 1-bit output
    //-----------------------------------------------------------------------------------
	fifo_W8_R1 fifo1 		(
									 .rst 				(rst),
									 .wr_clk 			(ok_clk),
									 .rd_clk 			(ok_clk),
									 .din 				(fifo0_dout),	// 8-bit in data
									 .wr_en 			(fifo_valid[0]),
									 .rd_en 			(1'b1),
									 .dout 				(fifo1_dout),  // 1-bit out data
									 .full 				(fifo_full[1]),
									 .empty 			(fifo_empty[1]),
									 .valid 			(fifo_valid[1]),
                                     .overflow           (fifo_overflow[1])
	);
    
    
    //-----------------------------------------------------------------------------------
    //    Register bank for storing transferred data
    //-----------------------------------------------------------------------------------
    always @(posedge ok_clk or posedge rst) begin
        if (rst) begin
            register_bank <= 0;
        end else if (fifo_valid[1]) begin
            register_bank[write_address] <= fifo1_dout;
        end
    end
    
    
    //-----------------------------------------------------------------------------------
    //    Write address pointer
    //----------------------------------------------------------------------------------- 
    always @(posedge ok_clk or posedge rst) begin
        if (rst) begin
            write_address <= 0;
        end else if (fifo_valid[1]) begin
            if (packet_finished) begin
                write_address <= 0;
            end else begin
                write_address <= write_address + 1;
            end
        end
    end
    

endmodule
