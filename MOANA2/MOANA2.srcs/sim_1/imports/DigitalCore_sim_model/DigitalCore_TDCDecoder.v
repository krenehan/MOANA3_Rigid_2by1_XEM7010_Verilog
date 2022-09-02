
// time scale
`timescale 1ns/1ps

// no undeclared nets
//`default_nettype none

module DigitalCore_TDCDecoder(

	TDCFineIn,
	TDCCoarseIn,

	TDCOut
    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    parameter TDCCoarseBits = 8;

    localparam TDCFineRawBits = 8;
    localparam  TDCFineBits = 3;
    //-----------------------------------------------------------------------------------
    //  I/O
    //-----------------------------------------------------------------------------------
    input wire [TDCCoarseBits-1:0] TDCCoarseIn;
    input wire [TDCFineRawBits-1:0] TDCFineIn;
    
    output reg [TDCCoarseBits+TDCFineBits-1:0] TDCOut;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Internal Wires
    //-----------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Assigns
    //-----------------------------------------------------------------------------------    
    //-----------------------------------------------------------------------------------    
   
    // Fine bit decoder
	always @(*) begin
		case (TDCFineIn)
			8'b11110000: 	TDCOut[TDCFineBits-1:0] <= 3'b000;
			8'b11111000: 	TDCOut[TDCFineBits-1:0] <= 3'b000;
			8'b01110000: 	TDCOut[TDCFineBits-1:0] <= 3'b000;

			8'b11100001: 	TDCOut[TDCFineBits-1:0] <= 3'b001;
			8'b11110001: 	TDCOut[TDCFineBits-1:0] <= 3'b001;
			8'b11100000: 	TDCOut[TDCFineBits-1:0] <= 3'b001;

			8'b11000011: 	TDCOut[TDCFineBits-1:0] <= 3'b010;
			8'b11100011: 	TDCOut[TDCFineBits-1:0] <= 3'b010;
			8'b11000001: 	TDCOut[TDCFineBits-1:0] <= 3'b010;

			8'b10000111: 	TDCOut[TDCFineBits-1:0] <= 3'b011;
			8'b11000111: 	TDCOut[TDCFineBits-1:0] <= 3'b011;
			8'b10000011: 	TDCOut[TDCFineBits-1:0] <= 3'b011;

			8'b00001111: 	TDCOut[TDCFineBits-1:0] <= 3'b100;
			8'b10001111: 	TDCOut[TDCFineBits-1:0] <= 3'b100;
			8'b00000111: 	TDCOut[TDCFineBits-1:0] <= 3'b100;

			8'b00011110: 	TDCOut[TDCFineBits-1:0] <= 3'b101;
			8'b00011111: 	TDCOut[TDCFineBits-1:0] <= 3'b101;
			8'b00001110: 	TDCOut[TDCFineBits-1:0] <= 3'b101;

			8'b00111100: 	TDCOut[TDCFineBits-1:0] <= 3'b110;
			8'b00111110: 	TDCOut[TDCFineBits-1:0] <= 3'b110;
			8'b00011100: 	TDCOut[TDCFineBits-1:0] <= 3'b110;

			8'b01111000: 	TDCOut[TDCFineBits-1:0] <= 3'b111;
			8'b01111100: 	TDCOut[TDCFineBits-1:0] <= 3'b111;
			8'b00111000: 	TDCOut[TDCFineBits-1:0] <= 3'b111;

            default:        TDCOut[TDCFineBits-1:0] <= 3'b000;
		endcase
	end
	
	// Coarse bit decoder
	always @(*) begin
		TDCOut[TDCCoarseBits+TDCFineBits-1:TDCFineBits] <= TDCCoarseIn;
	end


endmodule

