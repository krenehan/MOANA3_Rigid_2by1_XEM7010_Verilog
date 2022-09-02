module DigitalCore_TDCCntrFlops(
        
        //---------------------------------------------------------------------------
        //  Inputs
        //---------------------------------------------------------------------------
	RawFine,
        RstAsync,

	RSTB,
	RSTD,
	INIT_OUT_Dig_delay1,
        //---------------------------------------------------------------------------        

        //---------------------------------------------------------------------------
        //  Outputs
        //---------------------------------------------------------------------------
	FineOut,
	CoarseOut
        //---------------------------------------------------------------------------
    );

	genvar i;

	parameter NumberOfFineSamplers = 8;
	parameter NumberOfCoarseSamplers = 7;

    //-----------------------------------------------------------------------------------
    //   I/O Wires
    //-----------------------------------------------------------------------------------
    input wire                                  		RstAsync;
    input wire							RSTD, RSTB;
    input wire							INIT_OUT_Dig_delay1;
		
    input wire		[NumberOfFineSamplers-1:0]              RawFine;

    output wire		[NumberOfFineSamplers-1:0]              FineOut;
    output wire		[NumberOfCoarseSamplers-1:0]		CoarseOut;


//    //-----------------------------------------------------------------------------------
//    //   Wires
//    //-----------------------------------------------------------------------------------
//    wire INIT_OUT_Dig_delay1_buff, INIT_OUT_Dig_delay1_del;
//	wire PulseReset_del, CntrRst, CntrClkGated;

//    wire 		[NumberOfCoarseSamplers-1:0]		RawCoarse;
//    wire 		[NumberOfCoarseSamplers-1:0]		CntrFlopQN;
//    wire        [3:0] INIT_OUT_Dig_delay1_del_int; // For delaying

//    //-----------------------------------------------------------------------------------
//    //  Coarse Counter
//    //-----------------------------------------------------------------------------------
//    AN2LVTD1		CntrClkGating_DT	(.A1(RawFine[6]), .A2(RSTB), .Z(CntrClkGated));

//	wire			CntrRst_Pulse, RSTD_del;

//    assign #(0.5) RSTD_del = RSTD;
//	//DELLVT0			CntrRstDel0_DT		(.I(RSTD), .Z(RSTD_del));
//    AN2LVTD1		CntreRstPulse_DT	(.A1(RSTB), .A2(RSTD_del), .Z(CntrRst_Pulse));

//	NR2LVTD4		CntrRstGen_DT		(.A1(CntrRst_Pulse), .A2(RstAsync), .ZN(CntrRst));

//    //Async Counter
//	INVLVTD0	CntrInv_DT	(.I(RawCoarse[0]), .ZN(CntrFlopQN[0]));
//	DFCNQLVTD1	CntrFlop0_DT	(.D(CntrFlopQN[0]), .CP(CntrClkGated), .CDN(CntrRst), .Q(RawCoarse[0]));

//	generate for (i = 1; i < NumberOfCoarseSamplers; i = i + 1) begin : CoarseCntr_DT
//		DFNCNLVTD1	CntrFlops_DT	(.D(CntrFlopQN[i]), .CPN(RawCoarse[i-1]), .CDN(CntrRst), .Q(RawCoarse[i]), .QN(CntrFlopQN[i]));
//	end endgenerate

//    //-----------------------------------------------------------------------------------
//    //  Sampling Flops
//    //-----------------------------------------------------------------------------------
//	generate for (i = 0; i < NumberOfFineSamplers; i = i + 1) begin : TDC_FineSampler_DT
//		DFNCNLVTD1	FineFlops_DT	(.D(RawFine[i]), .CPN(INIT_OUT_Dig_delay1), .CDN(~RstAsync), .Q(FineOut[i]), .QN());
//	end endgenerate

//    assign #(0.5) INIT_OUT_Dig_delay1_del_int[0] = INIT_OUT_Dig_delay1;
//    assign #(0.5) INIT_OUT_Dig_delay1_del_int[1] = INIT_OUT_Dig_delay1_del_int[0];
//    assign #(0.5) INIT_OUT_Dig_delay1_del_int[2] = INIT_OUT_Dig_delay1_del_int[1];
//    assign #(0.5) INIT_OUT_Dig_delay1_del_int[3] = INIT_OUT_Dig_delay1_del_int[2];
//    assign #(0.5) INIT_OUT_Dig_delay1_del = INIT_OUT_Dig_delay1_del_int[3];
//	//DELLVT1			SamplingClkGenDel_DT	(.I(INIT_OUT_Dig_delay1), .Z(INIT_OUT_Dig_delay1_del));
//	BUFFLVTD3		SamplingClkGenBuff_DT	(.I(INIT_OUT_Dig_delay1_del), .Z(INIT_OUT_Dig_delay1_buff));

//	generate for (i = 0; i < NumberOfCoarseSamplers; i = i + 1) begin : TDC_CoarseSampler_DT
//		DFNCNLVTD1	CoarseFlops_DT	(.D(RawCoarse[i]), .CPN(INIT_OUT_Dig_delay1_buff), .CDN(~RstAsync), .Q(CoarseOut[i]), .QN());
//	end endgenerate

endmodule

