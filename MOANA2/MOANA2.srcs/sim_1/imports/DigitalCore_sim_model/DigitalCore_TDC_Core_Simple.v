module DigitalCore_TDC_Core_Simple(
    //----------------------------------------------------------------------------------
    // Inputs to TDC Logic
    //----------------------------------------------------------------------------------
    StartExt,
    StartInt,
    StopExt,
    StopInt,

    StartSelect,
    StopSelect,

    RstAsync,

    //----------------------------------------------------------------------------------
    // Outputs from TDC Logic
    //----------------------------------------------------------------------------------
    TDC_Status,
    //INIT_OUT_Dig_delay1,

    //----------------------------------------------------------------------------------
    // Inputs to TDC_Full
    //----------------------------------------------------------------------------------
    DC_BOOST,

    //----------------------------------------------------------------------------------
    // Outputs
    //----------------------------------------------------------------------------------
	FineOut,
	CoarseOut
);

 
    //----------------------------------------------------------------------------------
    // Inputs to TDC Logic
    //----------------------------------------------------------------------------------
    input wire StartExt;
    input wire StartInt;
    input wire StopExt;
    input wire StopInt;

    input wire StartSelect;
    input wire StopSelect;

    input wire RstAsync;

    //----------------------------------------------------------------------------------
    // Outputs from TDC Logic
    //----------------------------------------------------------------------------------
    output wire TDC_Status;

    //----------------------------------------------------------------------------------
    // Inputs to TDC_Full
    //----------------------------------------------------------------------------------
    input wire DC_BOOST;

    //----------------------------------------------------------------------------------
    // Outputs from TDC_Full
    //----------------------------------------------------------------------------------
    //inout wire NBIAS;

    output wire 	[7:0] 		FineOut;
    output wire 	[6:0] 		CoarseOut;

    //----------------------------------------------------------------------------------
    // Internal wires
    //----------------------------------------------------------------------------------
    wire TDC_SW;
    wire TDC_SWB;
    wire TDC_RSTD;
    wire TDC_RSTB;
    wire PulseReset;
    wire INIT_OUT_Dig_delay1;
    wire [7:0] TDC_DC_OUT;

    wire StopInt_bar;
    assign StopInt_bar = ~StopInt;

    wire [7:0] FineOut_int; 
    wire [6:0] CoarseOut_int;
    wire TDC_Status_int;

    // Delays
    assign #(1) FineOut = FineOut_int;
    assign CoarseOut = CoarseOut_int;
    assign #(0.5) TDC_Status = TDC_Status_int;
    

    //-----------------------------------------------------------------------------------
    //    TDC for SPAD
    //-----------------------------------------------------------------------------------
    DigitalCore_TDC_Full_Simple	SPAD_TDCAnalog (	.SW		(TDC_SW),
				.SWB		(TDC_SWB),
				.RSTD		(TDC_RSTD),
				.RSTB		(TDC_RSTB),
				.TIEH		(1'b1),
				.TIEL		(1'b0),

				.DC_BOOST	(DC_BOOST),

				.DC_OUT		(TDC_DC_OUT));


    //-----------------------------------------------------------------------------------
    //    TDC Logic 
    //-----------------------------------------------------------------------------------
    DigitalCore_TDCLogic	SPAD_TDCLogic (	.StartExt		(StartExt),
        			.StartInt		(StartInt),
        			.StopExt		(StopExt),
        			.StopInt		(StopInt_bar),
        			.StartSelect		(StartSelect),
        			.StopSelect		(StopSelect),
        			.RstAsync		(RstAsync),

				.SW			(TDC_SW),
				.SWB			(TDC_SWB),
	
				.RSTD			(TDC_RSTD),
				.RSTB			(TDC_RSTB),
				.TDC_Status		(TDC_Status_int),

				.INIT_OUT_Dig_delay1	(INIT_OUT_Dig_delay1));

    //-----------------------------------------------------------------------------------
    //    TDC Logic 
    //-----------------------------------------------------------------------------------
    DigitalCore_TDCCntrFlops	SPAD_TDCFlops (	.RstAsync		(RstAsync),
        				.RawFine		(TDC_DC_OUT),

					.RSTD			(TDC_RSTD),
					.RSTB			(TDC_RSTB),
        				.INIT_OUT_Dig_delay1	(INIT_OUT_Dig_delay1),

					.FineOut		(FineOut_int),
					.CoarseOut		(CoarseOut_int));

        //---------------------------------------------------------------------------        



endmodule
