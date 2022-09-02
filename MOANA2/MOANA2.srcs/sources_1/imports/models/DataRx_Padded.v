
// time scale
`timescale 1ns/1ps


// User Inputs:
// Make sure to modify the parameters (NumTDCbits, NumBins, BinDepth, and CntWidth)
// Make sure the shift counter is correct binary code: (ShiftCnt < 10'b1010000000)

module DataRx_Padded(
        
	RstAsync,
	ClkIn,
	DataIn,
	DataOut, 
    Full
    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    
    parameter   NumBins = 64;               		// Number of unique timestamps (bins = 2^(NumTDCbits))
    parameter   BinDepth = 10;                          // Bin Depth (N'b counter)
    parameter	  Patterns = 1;
    parameter   Frames = 1;
    
	localparam 	CntWidth = 32;                          // Need counter to represent ceil(log2(DataOutWidth))
	localparam 	DataOutWidth = NumBins*BinDepth*Patterns*Frames;

    //-----------------------------------------------------------------------------------
    //  Ports
    //-----------------------------------------------------------------------------------
    input wire					RstAsync;
    input wire					ClkIn;

    input wire					DataIn;			// DataIn (1b)
	output reg 					Full;

    output reg  				[DataOutWidth-1:0] DataOut;	

    //-----------------------------------------------------------------------------------
    //  Internal Wires
    //-----------------------------------------------------------------------------------
    reg			[CntWidth-1:0]			ShiftCnt;	// ShiftCnt (10b)
    reg                                 Pad_Received;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Assigns
    //-----------------------------------------------------------------------------------
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    Photon Det Counters per row
    //-----------------------------------------------------------------------------------
	
	always @(posedge ClkIn or posedge RstAsync) begin
		if (RstAsync) begin
			ShiftCnt <= {CntWidth*{1'b0}};
			DataOut  <= 0;
			Full <= 1'b0;
            Pad_Received <= 1'b0;
		end else if (DataIn & ~Pad_Received) begin
            Pad_Received <= 1'b1;
        end else if (Pad_Received) begin
            if (ShiftCnt < DataOutWidth) begin
			    DataOut  <= {DataIn, DataOut[DataOutWidth-1:1]};
			    ShiftCnt <= ShiftCnt + {16'd1};
		    end else begin
			    Full <= 1'b1;
            end
		end
	end
    //-----------------------------------------------------------------------------------


endmodule

