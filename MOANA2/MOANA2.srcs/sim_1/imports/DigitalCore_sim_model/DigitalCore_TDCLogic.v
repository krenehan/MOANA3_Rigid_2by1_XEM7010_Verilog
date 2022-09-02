
module DigitalCore_TDCLogic(
        
        //---------------------------------------------------------------------------
        //  Inputs
        //---------------------------------------------------------------------------
        StartExt,
        StartInt,
        StopExt,
        StopInt,

        StartSelect,
        StopSelect,

        RstAsync,
        //---------------------------------------------------------------------------        

        //---------------------------------------------------------------------------
        //  Current Mirror
        //---------------------------------------------------------------------------
	SW,
	SWB,
	
	RSTD,
	RSTB,
	
	TDC_Status, // This is somehow the sampled version of INIT_OUT at negedge of StopClk
	INIT_OUT_Dig_delay1 
	//INIT_OUT_Dig_delay2
        //---------------------------------------------------------------------------
    );

    //-----------------------------------------------------------------------------------
    //   I/O Wires
    //-----------------------------------------------------------------------------------
    input wire                                  RstAsync;
    input wire                                  StartSelect;
    input wire                                  StopSelect;            
    input wire                                  StartExt, StartInt;
    input wire                                  StopExt, StopInt;

    output wire                                 SW;
    output wire                                 SWB;
    output wire                                 RSTD;
    output wire                                 RSTB;
    output wire                                 TDC_Status;
    output wire                                 INIT_OUT_Dig_delay1; //INIT_OUT_Dig_delay2;

//    //-----------------------------------------------------------------------------------
//    //   Wires
//    //-----------------------------------------------------------------------------------
//    wire Start, Stop;
//    wire Start_gated, Stop_gated;
//    wire Flop_rst;
//    wire Start_reg, Start_regB;	
//    wire Stop_reg, Stop_regB, Stop_regBuff;	
//    wire INIT, INIT_OUT, Reset_reg;
//    wire Reset, RO_Reset;
//    wire ResetPulse;
//    wire RstBuff0,RstBuff1,RstBuff2,RstBuff3,RstBuff4,RstBuff5,RstBuff6,RstBuff7; 
//    wire RSTB_PreBuff;
//    wire INIT_OUT_Buff0, INIT_OUT_Buff1, INIT_OUT_Buff2, INIT_OUT_Buff3, INIT_OUT_Buff4, INIT_OUT_Buff5;
//    wire StopFlop_rst;
//    wire Stop_del, Stop_buff;

//    //-----------------------------------------------------------------------------------
//    //    Config Scan Chain
//    //-----------------------------------------------------------------------------------
//	MUX2LVTD2	StartMux_DT	(.I0(StartExt), .I1(StartInt), .S(StartSelect), .Z(Start));
//	MUX2LVTD2	StopMux_DT	(.I0(StopExt), .I1(StopInt), .S(StopSelect), .Z(Stop));

//	//AN2LVTD1	StartGate_DT	(.A1(Start),.A2(1'b1),.Z(Start_gated));
//	DFCNLVTD1	StartFlop_DT	(.D(1'b1), .CP(Start), .CDN(Flop_rst), .Q(Start_reg), .QN(Start_regB));

//	AN2LVTD1	StopFlopRst_DT	(.A1(Flop_rst),.A2(Start_reg),.Z(StopFlop_rst));
//	DFCNLVTD1	StopFlop_DT	(.D(1'b1), .CP(Stop), .CDN(StopFlop_rst), .Q(Stop_reg), .QN(Stop_regB));

//	BUFFLVTD2	StopFlopBuff_DT	(.I(Stop_reg),.Z(Stop_regBuff));

//	DFNCNLVTD1	ResetFlop_DT	(.D(1'b1), .CPN(INIT_OUT), .CDN(Flop_rst), .Q(Reset_reg), .QN());
//	//IND2LVTD2	DummyIND_DT	(.A1(Stop_reg),.B1(1'b0),.ZN());

//	NR2LVTD2 	INITGen_DT 	(.A1(Start_regB), .A2(Stop_regBuff), .ZN(INIT));
//	BUFFLVTD4 	INITGenBuff_DT 	(.I(INIT),.Z(INIT_OUT));

//	//DFCNLVTD1	TDCStatus_DT	(.D(INIT_OUT_Dig_delay1), .CP(Stop), .CDN(~RstAsync), .Q(TDC_Status), .QN());
//	BUFFLVTD2	TDCStatusStopBuff_DT	(.I(Stop),.Z(Stop_buff));
//    assign Stop_del = Stop_buff;
//	//DELLVT015	TDCStatusStopDel_DT	(.I(Stop_buff),.Z(Stop_del));
//	DFCNLVTD1	TDCStatus_DT		(.D(INIT_OUT), .CP(Stop_del), .CDN(~RstAsync), .Q(TDC_Status), .QN());
//    //-----------------------------------------------------------------------------------
    
//	NR2LVTD2	ResetGen_DT	(.A1(RstAsync),.A2(ResetPulse),.ZN(Flop_rst));

//	IND2LVTD2	ResetIND_DT	(.A1(Reset_reg),.B1(Start_reg),.ZN(Reset));

//	BUFFLVTD2	ResetBuff_DT	(.I(Reset),.Z(RO_Reset));

//	INVLVTD0	RstBuff0_DT		(.I(Reset),.ZN(RstBuff0));
//    assign #(0.5) RstBuff1 = RstBuff0;
//	//DELLVT0		RstBuff1_DT		(.I(RstBuff0),.Z(RstBuff1));


//	AN2LVTD1	ResetPulseGen_DT	(.A1(Reset),.A2(RstBuff1),.Z(ResetPulse));

//	IND2LVTD4	RSTD_Gen_DT		(.A1(RO_Reset), .B1(1'b1),.ZN(RSTD)); //sized up from 2x to 4x
//	IND2LVTD2	RSTB_Gen_DT		(.A1(1'b0), .B1(RO_Reset),.ZN(RSTB_PreBuff));
//	BUFFLVTD4	RSTB_GenBuff_DT		(.I(RSTB_PreBuff), .Z(RSTB)); //sized up from 2x to 4x


//	BUFFLVTD1	SWBBuff0_DT		(.I(INIT_OUT), .Z(INIT_OUT_Buff0));
//	BUFFLVTD2	SWBBuff1_DT		(.I(INIT_OUT_Buff0), .Z(INIT_OUT_Buff1));
//	IND2LVTD4	SWBIND_DT		(.A1(1'b0), .B1(INIT_OUT_Buff1), .ZN(SWB)); //sized up from 2x to 4x

//	BUFFLVTD2	SWBuff0_DT		(.I(INIT_OUT), .Z(INIT_OUT_Buff2));
//	AN2LVTD4	SWAND_DT		(.A1(1'b1), .A2(INIT_OUT_Buff2), .Z(SW)); //sized up from 2x to 4x

//	AN2LVTD2	INITOUTAND_DT		(.A1(1'b1), .A2(INIT_OUT_Buff2), .Z(INIT_OUT_Buff3));
//      	BUFFLVTD2	INITOUTBuff0_DT		(.I(INIT_OUT_Buff3), .Z(INIT_OUT_Buff4));
//      	BUFFLVTD2	INITOUTBuff1_DT		(.I(INIT_OUT_Buff4), .Z(INIT_OUT_Buff5));		
//      	BUFFLVTD8	INITOUTBuff2_DT		(.I(INIT_OUT_Buff5), .Z(INIT_OUT_Dig_delay1));	


endmodule
