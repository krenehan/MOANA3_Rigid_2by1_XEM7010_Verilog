
// time scale
`timescale 1ns/1ps

// no undeclared nets
//`default_nettype none

module DigitalCore_TDC_Simple(
    Clk,
	StartExt,
	StartInt,
	StopExt,
	StopInt,
	StartSelect,
	StopSelect,
	RstAsync,
	DC_BOOST,
	TDC_Status,
	TDC_FineOut_Raw,
	TDC_CoarseOut_Raw,

	TDCOut
);

	//-----------------------------------------------------------------------------------
    //  Physical Parameters
    //-----------------------------------------------------------------------------------
	parameter CoarseBits = 8;
	//-----------------------------------------------------------------------------------
	
	//-----------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------
	localparam FineBitsRaw = 8;
    localparam FineBits = 3;
	//-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //  I/O
    //-----------------------------------------------------------------------------------
    input wire Clk;
	input wire StartExt;
	input wire StartInt;
	input wire StopExt;
	input wire StopInt;
	input wire StartSelect;
	input wire StopSelect;
	input wire RstAsync;
	input wire DC_BOOST;
	output wire  TDC_Status;

	output wire 	[FineBitsRaw-1:0] 		TDC_FineOut_Raw; // Sampled fine output of TDC (for scan out)
	output wire 	[CoarseBits-1:0] 		TDC_CoarseOut_Raw; // Sampled coarse output of TDC_Full (for scan out)
	output wire 	[FineBits+CoarseBits-1:0] 	TDCOut; // Full decoded output of TDC
	//-----------------------------------------------------------------------------------
	
	//-----------------------------------------------------------------------------------
	//  Internal Wires
	//-----------------------------------------------------------------------------------
	
	// Fine output signals
	wire [FineBitsRaw-1:0] TDC_FineOut; // Ordered output
    wire [FineBitsRaw-1:0] TDC_FineOut_Raw_Nonsampled;
	
	// Coarse output signal
	wire [CoarseBits-1:0] TDC_CoarseOut_Raw_Nonsampled;

	// TDC Status output signal
	wire TDC_Status_Nonsampled;
	//-----------------------------------------------------------------------------------
	
	//-----------------------------------------------------------------------------------
    //  Assigns
    //-----------------------------------------------------------------------------------    
	assign TDC_FineOut = { 	TDC_FineOut_Raw[6],
							TDC_FineOut_Raw[5],
							TDC_FineOut_Raw[2],
							TDC_FineOut_Raw[1],
							TDC_FineOut_Raw[7],
							TDC_FineOut_Raw[4],
							TDC_FineOut_Raw[3],
							TDC_FineOut_Raw[0] 
						};
	//-----------------------------------------------------------------------------------

	//-----------------------------------------------------------------------------------
	// Fine output blocks
	//-----------------------------------------------------------------------------------
	
	// Analog TDC Core
	DigitalCore_TDC_Core_Simple SPAD_TDCCoreSimple(
		.StartExt(StartExt),
		.StartInt(StartInt),
		.StopExt(StopExt),
		.StopInt(StopInt),
		.StartSelect(StartSelect),
		.StopSelect(StopSelect),
		.RstAsync(RstAsync),
		.TDC_Status(TDC_Status_Nonsampled),
		.DC_BOOST(DC_BOOST),
		.CoarseOut(TDC_CoarseOut_Raw_Nonsampled),
		.FineOut(TDC_FineOut_Raw_Nonsampled)
	);
	
	
	//-----------------------------------------------------------------------------------
	// Fine output sampler
	//-----------------------------------------------------------------------------------	
	DigitalCore_io_flops #(.Width(FineBitsRaw)) FineSampler (
		.clk(Clk),
		.reset(RstAsync),
		.enable(1'b1),
		.in(TDC_FineOut_Raw_Nonsampled),
		.out(TDC_FineOut_Raw)
	);
	//-----------------------------------------------------------------------------------
	
	//-----------------------------------------------------------------------------------
	// Coarse output sampler
	//-----------------------------------------------------------------------------------	
	DigitalCore_io_flops #(.Width(CoarseBits)) CoarseSampler (
		.clk(Clk),
		.reset(RstAsync),
		.enable(1'b1),
		.in(TDC_CoarseOut_Raw_Nonsampled),
		.out(TDC_CoarseOut_Raw)
	);
	//-----------------------------------------------------------------------------------

	//-----------------------------------------------------------------------------------
	// Coarse output sampler
	//-----------------------------------------------------------------------------------	
	DigitalCore_io_flops #(.Width(1)) TDCStatusSampler (
		.clk(Clk),
		.reset(RstAsync),
		.enable(1'b1),
		.in(TDC_Status_Nonsampled),
		.out(TDC_Status)
	);
	//-----------------------------------------------------------------------------------
	
	//-----------------------------------------------------------------------------------
	// Decoder block
	//-----------------------------------------------------------------------------------
	
	// Decoder
	DigitalCore_TDCDecoder #(.TDCCoarseBits(CoarseBits)) TDCDecoderUnit (
		.TDCFineIn(TDC_FineOut),
		.TDCCoarseIn(TDC_CoarseOut_Raw),
		.TDCOut(TDCOut)
	);
	
	//-----------------------------------------------------------------------------------

endmodule
