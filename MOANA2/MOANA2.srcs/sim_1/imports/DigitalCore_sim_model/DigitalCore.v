
// time scale
`timescale 1ns/1ps

// no undeclared nets
//`default_nettype none

//-------------------------------------------------------------------------------------------
//    Scan Chain Length
//-------------------------------------------------------------------------------------------
`define DigitalCore_ScanChainLength  313
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
//    Full Bit Vector Defs
//-------------------------------------------------------------------------------------------
`define DigitalCore_TDCDCBoost                    7:0     
`define DigitalCore_TDCStatus                    15:8     
`define DigitalCore_TDCFineOutRaw                79:16    
`define DigitalCore_TDCCoarseOut                135:80    
`define DigitalCore_DynamicPacket               152:136   
`define DigitalCore_PattResetControlledByTriggerExt    153:153   
`define DigitalCore_PattResetExtEnable          154:154   
`define DigitalCore_MeasPerPatt                 178:155   
`define DigitalCore_MeasCountEnable             179:179   
`define DigitalCore_VCSELEnableWithScan         180:180   
`define DigitalCore_VCSELEnableControlledByScan    181:181   
`define DigitalCore_VCSELWave1Enable            182:182   
`define DigitalCore_VCSELWave2Enable            183:183   
`define DigitalCore_TDCStartSelect              191:184   
`define DigitalCore_TDCStopSelect               199:192   
`define DigitalCore_TDCDisable                  207:200   
`define DigitalCore_SPADEnable                  271:208   
`define DigitalCore_DynamicConfigEnable         272:272   
`define DigitalCore_TestPattEnable              273:273   
`define DigitalCore_TestDataIn                  283:274   
`define DigitalCore_TxDataExtRequestEnable      284:284   
`define DigitalCore_TimeOffsetWord              294:285   
`define DigitalCore_SubtractorBypass            295:295   
`define DigitalCore_ClkBypass                   296:296   
`define DigitalCore_ClkFlip                     297:297   
`define DigitalCore_DriverDLLWordControlledByScan    298:298   
`define DigitalCore_DriverDLLWord               303:299   
`define DigitalCore_AQCDLLWordControlledByScan    304:304   
`define DigitalCore_AQCDLLCoarseWord            308:305   
`define DigitalCore_AQCDLLFineWord              311:309   
`define DigitalCore_AQCDLLFinestWord            312:312   
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
//    Indexed Bit Vector Defs
//-------------------------------------------------------------------------------------------
`define DigitalCore_TDCDCBoost_idx(n)        (n * 1      +      0)+:     1 //      7:0     
`define DigitalCore_TDCStatus_idx(n)         (n * 1      +      8)+:     1 //     15:8     
`define DigitalCore_TDCFineOutRaw_idx(n)     (n * 8      +     16)+:     8 //     79:16    
`define DigitalCore_TDCCoarseOut_idx(n)      (n * 7      +     80)+:     7 //    135:80    
`define DigitalCore_DynamicPacket_idx(n)     (n * 17     +    136)+:    17 //    152:136   
`define DigitalCore_PattResetControlledByTriggerExt_idx(n) (n * 1      +    153)+:     1 //    153:153   
`define DigitalCore_PattResetExtEnable_idx(n) (n * 1      +    154)+:     1 //    154:154   
`define DigitalCore_MeasPerPatt_idx(n)       (n * 24     +    155)+:    24 //    178:155   
`define DigitalCore_MeasCountEnable_idx(n)   (n * 1      +    179)+:     1 //    179:179   
`define DigitalCore_VCSELEnableWithScan_idx(n) (n * 1      +    180)+:     1 //    180:180   
`define DigitalCore_VCSELEnableControlledByScan_idx(n) (n * 1      +    181)+:     1 //    181:181   
`define DigitalCore_VCSELWave1Enable_idx(n)  (n * 1      +    182)+:     1 //    182:182   
`define DigitalCore_VCSELWave2Enable_idx(n)  (n * 1      +    183)+:     1 //    183:183   
`define DigitalCore_TDCStartSelect_idx(n)    (n * 1      +    184)+:     1 //    191:184   
`define DigitalCore_TDCStopSelect_idx(n)     (n * 1      +    192)+:     1 //    199:192   
`define DigitalCore_TDCDisable_idx(n)        (n * 1      +    200)+:     1 //    207:200   
`define DigitalCore_SPADEnable_idx(n)        (n * 1      +    208)+:     1 //    271:208   
`define DigitalCore_DynamicConfigEnable_idx(n) (n * 1      +    272)+:     1 //    272:272   
`define DigitalCore_TestPattEnable_idx(n)    (n * 1      +    273)+:     1 //    273:273   
`define DigitalCore_TestDataIn_idx(n)        (n * 10     +    274)+:    10 //    283:274   
`define DigitalCore_TxDataExtRequestEnable_idx(n) (n * 1      +    284)+:     1 //    284:284   
`define DigitalCore_TimeOffsetWord_idx(n)    (n * 10     +    285)+:    10 //    294:285   
`define DigitalCore_SubtractorBypass_idx(n)  (n * 1      +    295)+:     1 //    295:295   
`define DigitalCore_ClkBypass_idx(n)         (n * 1      +    296)+:     1 //    296:296   
`define DigitalCore_ClkFlip_idx(n)           (n * 1      +    297)+:     1 //    297:297   
`define DigitalCore_DriverDLLWordControlledByScan_idx(n) (n * 1      +    298)+:     1 //    298:298   
`define DigitalCore_DriverDLLWord_idx(n)     (n * 5      +    299)+:     5 //    303:299   
`define DigitalCore_AQCDLLWordControlledByScan_idx(n) (n * 1      +    304)+:     1 //    304:304   
`define DigitalCore_AQCDLLCoarseWord_idx(n)  (n * 4      +    305)+:     4 //    308:305   
`define DigitalCore_AQCDLLFineWord_idx(n)    (n * 3      +    309)+:     3 //    311:309   
`define DigitalCore_AQCDLLFinestWord_idx(n)  (n * 1      +    312)+:     1 //    312:312   
//-------------------------------------------------------------------------------------------

module DigitalCore(
        
        //---------------------------------------------------------------------------
        //  Scan Chain I/O
        //---------------------------------------------------------------------------
        SIn,        
	    SClkP,
        SClkN,
        SReset,

        SInOut,        
	    SClkPOut,
        SClkNOut,
        SResetOut,

        SEnable,
        SUpdate,
        SOut,
        //---------------------------------------------------------------------------
      
        //---------------------------------------------------------------------------
        //  Ties
	    //---------------------------------------------------------------------------
        TieVDD, 
        TieVSS,
        //---------------------------------------------------------------------------   
     
        //---------------------------------------------------------------------------
        //  Extrenal Trigger (as direct measurement start signal instead of using SEnable/SUpdate)
	    //---------------------------------------------------------------------------
        TriggerExt,
	    //---------------------------------------------------------------------------

        //---------------------------------------------------------------------------
        //  DataTx Pads
	    //---------------------------------------------------------------------------
        TxRefClk,
        TxDataOut,
        //---------------------------------------------------------------------------     

        //---------------------------------------------------------------------------
        //  TDC Pads
	    //---------------------------------------------------------------------------
        StartExt,
        StopExt,
	    RefClk,
        RstAsync,
        RstAsyncOut,
	    AQCClkOut,
        //---------------------------------------------------------------------------

        //---------------------------------------------------------------------------
        //  SPAD Signals
        //---------------------------------------------------------------------------
	    VRST,
	    SPAD_Cathode,
        //---------------------------------------------------------------------------

        //---------------------------------------------------------------------------
        //  VCSEL Pads
        //---------------------------------------------------------------------------
	    VCSEL1_Anode,
	    VCSEL2_Anode, 
	    
	    ScanBitsRd, 
	    ScanBitsWr, 
	    
	    test_pattern,
	    force_dataout,
	    dynamic_packet

    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    parameter OVERRIDE_DATAOUT = 				"False"; // Override DataTx mechanism so that streamouts can be forced in simulation
    
    parameter TDCBitsRaw =                      8;  // Raw TDC Bits
    parameter NumberOfTDCs =                    8;  // Number of TDCs in the design
    parameter TDCCoarseCounterWidth =           7;  // Width of TDC coarse counter
    parameter HistCounterWidth =                20; // Width of counters in histogram (changed this to 12bits!!!)
    parameter HistNumberOfBins =                150; // Number of histogram bins (bins number changed to 150)
    parameter MeasurementCounterWidth = 	    24; // Width of measurement counter
    parameter NumberOfSPADs =                   64; // Number of SPADs
    parameter DriverDLLStages =                 5;
    parameter AQCDLLCoarseWordWidth =           4;
    parameter AQCDLLFineWordWidth =             4;
    parameter ScanLength =                      `DigitalCore_ScanChainLength;
    parameter DynamicPacketSize =               17;

    localparam TDCDecodedBits =                 3;
    localparam TDCTotalBits =                   TDCCoarseCounterWidth+TDCDecodedBits; // Total number of binary TDC bits
    localparam HistTotalBits =                  HistCounterWidth*HistNumberOfBins;
    localparam TimeOffsetWordWidth =            TDCTotalBits;
    localparam VectorSumWidth =                 4;

    //-----------------------------------------------------------------------------------
    //  Genvar
    //-----------------------------------------------------------------------------------
    genvar                                      i;
    genvar                                      j;
  
    //-----------------------------------------------------------------------------------
    //  I/O
    //-----------------------------------------------------------------------------------
    input wire                                  SClkP;
    input wire                                  SClkN;            
    input wire                                  SReset;
    input wire                                  SEnable;
    input wire                                  SUpdate;
    input wire                                  SIn;
    output wire                                 SOut;

    output wire                                 SClkPOut;
    output wire                                 SClkNOut;            
    output wire                                 SResetOut;
    output wire                                 SInOut;

    output wire                                 TieVDD;
    output wire                                 TieVSS;

    input wire                                  TxRefClk;
    input wire                                  TriggerExt;
    output wire                                 TxDataOut; 
    output wire                                 AQCClkOut;

    input wire                                  StartExt; 
    input wire                                  StopExt; 
    input wire                                  RefClk;
    input wire					                RstAsync;
    output wire					                RstAsyncOut;

    inout wire					                SPAD_Cathode;
    inout wire					                VRST;
    output wire					                VCSEL1_Anode;
    output wire                                 VCSEL2_Anode;
    input wire [HistTotalBits-1:0]				test_pattern;
    input wire									force_dataout;
    output wire [DynamicPacketSize-1:0] 		dynamic_packet;
    //-----------------------------------------------------------------------------------    

    //-----------------------------------------------------------------------------------
    //  Internal Wires
    //-----------------------------------------------------------------------------------
    output wire    	[ScanLength-1:0]                            ScanBitsRd; 
    input wire    	[ScanLength-1:0]                            ScanBitsWr;
    
    wire	    [NumberOfTDCs-1:0]                          TDC_Status;

    wire	    [NumberOfTDCs-1:0]                          SPADRowOut;
    wire    	[NumberOfSPADs-1:0]                         SPAD_Enable;
    wire                                                    Mask_Enable;
    wire 						    	                    AQC_DLL_out_masked;

    wire	    [TDCCoarseCounterWidth-1:0]		            TDCCoarseCnt_Reg [0:NumberOfTDCs-1];
    wire	    [TDCBitsRaw-1:0]                            TDCFineRawCnt [0:NumberOfTDCs-1]; 
    wire    	[TDCTotalBits-1:0]                          TDCOut_Binary [0:NumberOfTDCs-1];
    wire    	[TDCTotalBits-1:0]                          TDCOut_Binary_Adj [0:NumberOfTDCs-1];
    wire    	[TDCTotalBits-1:0]                          TDCOut_Binary_Adj_Out [0:NumberOfTDCs-1];


    wire    	[HistNumberOfBins-1:0]                      TDCOut_OneHot [0:NumberOfTDCs-1];
    wire    	[NumberOfTDCs-1:0]					        TDCOut_Changed;
    wire    	[HistTotalBits-1:0]                         Histogram_Data;
    wire							                        Load;
    wire                                                    load_if_pattern_done;
    wire							                        ExtReadRequest;
    wire                                                    DataTxLoadDone;
    reg                                                     en;
    wire                                                    DataTxClk;

    wire                                                    VCSEL_Start;
    wire                                                    VCSELEnable;
    wire                                                    vcsel_enable_with_shift_register;
    wire                                                    VCSELEnable_ToClkGen;
    wire                                                    VCSEL1_Start;
    wire                                                    VCSEL2_Start; 
    wire                                                    VCSEL_Stop;
	
    wire                                                    Measurement_Counter_Clk;
    wire 						                            Measurement_Counter_Reset;

    wire    	[MeasurementCounterWidth-1:0]		        Measurement_Count;
    wire						                            PattResetExtSignal;
    wire 						                            Max_Count_Reset;
    wire 						                            Max_Count_Reset_Pulse;
    wire                                                    End_Pattern_Reset;
    wire                                                    CounterBank_Reset;

    wire                                                    AQC_DLL_out;
    wire                                                    TDC_StopClkInt;
    wire                                                    GatingClk;

    wire    	[NumberOfTDCs-1:0]                          TDCOut_Vector [0:HistNumberOfBins-1];
    wire    	[VectorSumWidth*HistNumberOfBins-1:0]       TDCOut_VectorSum;
    //wire    	[VectorSumWidth*HistNumberOfBins-1:0]       TDCOut_VectorSum_Out;
    
    wire                                                    vcsel_enable_dynamic;
    wire        [4:0]                                       driver_dll_word;
    wire        [4:0]                                       driver_dll_word_dynamic;
    wire        [3:0]                                       aqc_dll_coarse_word;
    wire        [3:0]                                       aqc_dll_coarse_word_dynamic;
    wire        [2:0]                                       aqc_dll_fine_word;
    wire                                                    aqc_dll_finest_word;
    wire        [2:0]                                       aqc_dll_fine_word_dynamic;
    wire                                                    aqc_dll_finest_word_dynamic;
    wire                                                    vcsel_wavelength1_enable;
    wire                                                    vcsel_wavelength2_enable;
    wire                                                    vcsel_wavelength1_enable_dynamic;
    wire                                                    vcsel_wavelength2_enable_dynamic;
    wire                                                    dll_change;
    wire                                                    dll_change_dynamic;
    wire                                                    dll_change_done;
    wire                                                    clk_flip;
    wire                                                    clk_flip_dynamic;
    wire        [DynamicPacketSize-1:0]                     packet;
    wire                                                    shift_enable;
    wire                                                    shift_data;
    wire                                                    dynamic_histogram_reset_trigger;
    wire                                                    dynamic_histogram_reset_active;
    //----------------------------------------------------------------------------------- 
    
    
    assign dynamic_packet = packet;   

    //-----------------------------------------------------------------------------------
    //  Assigns
    //-----------------------------------------------------------------------------------    
    assign  TieVDD              =   1'b1;
    assign  TieVSS              =   1'b0; 

    assign  SClkPOut            =   SClkP;
    assign  SClkNOut            =   SClkN;            
    assign  SResetOut           =   SReset;
    assign  SInOut              =   SIn;
    assign  RstAsyncOut         =   RstAsync;
    
    assign  ExtReadRequest      =   (ScanBitsWr[`DigitalCore_TxDataExtRequestEnable]== 1'b1)    ? TriggerExt : 1'b1;
	assign  PattResetExtSignal  =   (ScanBitsWr[`DigitalCore_PattResetControlledByTriggerExt]== 1'b1)           ? TriggerExt : SUpdate;
    //-----------------------------------------------------------------------------------    

//    //-----------------------------------------------------------------------------------
//    //    Config Scan Chain
//    //-----------------------------------------------------------------------------------
//    DigitalCore_scan_bits    #  (   .TwoPhase           (1),
//                                    .ConfigLatch        (1))
//          scan                  (   .SClkP              (SClkP),
//                                    .SClkN              (SClkN),
//                                    .SReset             (SReset),
//                                    .SEnable            (SEnable),
//                                    .SUpdate            (SUpdate),
//                                    .SIn                (SIn),
//                                    .SOut               (SOut),
//                                    .ScanBitsRd         (ScanBitsRd),
//                                    .ScanBitsWr         (ScanBitsWr)
//                                ); 
//    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //    Measurement counter
    //-----------------------------------------------------------------------------------
	DigitalCore_sync_counter_negedge		#		(
									.Width(MeasurementCounterWidth))
			MeasurementCounter	(
									.reset(Measurement_Counter_Reset),
									.clk(Measurement_Counter_Clk),
									.count(Measurement_Count)
								);

    assign Measurement_Counter_Clk = ScanBitsWr[`DigitalCore_MeasCountEnable] & AQC_DLL_out;
	assign Measurement_Counter_Reset = RstAsync | (Max_Count_Reset & ~dynamic_histogram_reset_active);
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    DLLs for Clocking
    //-----------------------------------------------------------------------------------

        DigitalCore_DLLClockGen      
            DLLClockGenUnit     (   
                                    .DRIVER_WORD                    (driver_dll_word),
                                    .COARSEWORD                     (aqc_dll_coarse_word),
                                    .FINEWORD                       (aqc_dll_fine_word),
                                    .FINESTWORD                     (aqc_dll_finest_word),
				                    .BYPASS                         (ScanBitsWr[`DigitalCore_ClkBypass]),
				                    .CLK_FLIP                       (clk_flip),

				                    .VCSEL1_SELECT                  (vcsel_wavelength1_enable),
				                    .VCSEL2_SELECT                  (vcsel_wavelength2_enable),

                                    .CLK_IN		                    (RefClk),
				                    .AQC_DLL_OUT_REF 	            (AQCClkOut),
                                    .AQC_DLL_OUT	                (GatingClk),

				                    .VCSEL_ENABLE	                (VCSELEnable_ToClkGen),
                                    .VCSEL_START1	                (VCSEL1_Start),
                                    .VCSEL_START2	                (VCSEL2_Start),
                                    .VCSEL_STOP		                (VCSEL_Stop),

				                    .CATHODE		                (SPAD_Cathode),
                                    .VRST		                    (VRST),
                                    
                                    .CHANGE                         (dll_change),
                                    .DYNAMIC                        (ScanBitsWr[`DigitalCore_DynamicConfigEnable]),
                                    .RESET                          (RstAsync),
                                    .DONE                           (dll_change_done)
                                );
    
    assign dll_change = ScanBitsWr[`DigitalCore_DynamicConfigEnable] ? dll_change_dynamic : 1'b0;
    assign driver_dll_word = ScanBitsWr[`DigitalCore_DynamicConfigEnable] ? driver_dll_word_dynamic : ScanBitsWr[`DigitalCore_DriverDLLWord];
    assign clk_flip = ScanBitsWr[`DigitalCore_DynamicConfigEnable] ? clk_flip_dynamic : ScanBitsWr[`DigitalCore_ClkFlip];
    assign aqc_dll_coarse_word = ScanBitsWr[`DigitalCore_DynamicConfigEnable] ? aqc_dll_coarse_word_dynamic : ScanBitsWr[`DigitalCore_AQCDLLCoarseWord];
    assign aqc_dll_fine_word = ScanBitsWr[`DigitalCore_DynamicConfigEnable] ? aqc_dll_fine_word_dynamic : ScanBitsWr[`DigitalCore_AQCDLLFineWord];
    assign aqc_dll_finest_word = ScanBitsWr[`DigitalCore_DynamicConfigEnable] ? aqc_dll_finest_word_dynamic : ScanBitsWr[`DigitalCore_AQCDLLFinestWord];

    assign vcsel_wavelength1_enable = ScanBitsWr[`DigitalCore_DynamicConfigEnable] ? vcsel_wavelength1_enable_dynamic : ScanBitsWr[`DigitalCore_VCSELWave1Enable];
    assign vcsel_wavelength2_enable = ScanBitsWr[`DigitalCore_DynamicConfigEnable] ? vcsel_wavelength2_enable_dynamic : ScanBitsWr[`DigitalCore_VCSELWave2Enable];
    //-----------------------------------------------------------------------------------


    //-----------------------------------------------------------------------------------
    //    SPAD Array
    //-----------------------------------------------------------------------------------
	DigitalCore_SPADArray 
        SPADArrayUnit            (     
                                    .AQC_CLK(GatingClk),
				                    .AQC_CLK_OUT(AQC_DLL_out),
				                    .TDC_STOP_CLK(TDC_StopClkInt),
				                    .VCSELEN_IN(VCSELEnable),
				                    .VCSELEN_OUT(VCSELEnable_ToClkGen),
                                    .CATHODE(SPAD_Cathode), 
                                    .SPAD_EN(SPAD_Enable),
                                    .RowOut(SPADRowOut), 
                                    .VRST(VRST)
                                );

    generate for (i = 0; i < NumberOfSPADs; i = i + 1) begin : aqc_enable_assign
        assign SPAD_Enable[i] = ScanBitsWr[`DigitalCore_SPADEnable_idx(i)];
    end endgenerate
    //-----------------------------------------------------------------------------------


    //-----------------------------------------------------------------------------------
    //    TDC
    //-----------------------------------------------------------------------------------
    generate for (i = 0; i < NumberOfTDCs; i = i + 1) begin : TDC_SPADRow
        DigitalCore_TDC_Simple          #       (
                                        .CoarseBits(TDCCoarseCounterWidth))
                TDC_SimpleUnit      (
                                        .Clk(AQC_DLL_out),
	                                    .StartExt(StartExt),
	                                    .StartInt(SPADRowOut[i]),
	                                    .StopExt(StopExt),
	                                    .StopInt(TDC_StopClkInt),
	                                    .StopSelect(ScanBitsWr[`DigitalCore_TDCStopSelect_idx(i)]),
	                                    .StartSelect(ScanBitsWr[`DigitalCore_TDCStartSelect_idx(i)]),
	                                    .RstAsync(RstAsync),
	                                    .DC_BOOST(ScanBitsWr[`DigitalCore_TDCDCBoost_idx(i)]),
					                    .TDC_Status(TDC_Status[i]),
	                                    .TDC_FineOut_Raw(TDCFineRawCnt[i]),
	                                    .TDC_CoarseOut_Raw(TDCCoarseCnt_Reg[i]),
	                                    .TDCOut(TDCOut_Binary[i])
                                    );

        	assign ScanBitsRd[`DigitalCore_TDCCoarseOut_idx(i)] = TDCCoarseCnt_Reg[i] ;
        	assign ScanBitsRd[`DigitalCore_TDCFineOutRaw_idx(i)] = TDCFineRawCnt[i] ;
	    	assign ScanBitsRd[`DigitalCore_TDCStatus_idx(i)] = TDC_Status[i] ;
    end endgenerate
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    TDC Change Event Detector
    //-----------------------------------------------------------------------------------
	generate for ( i = 0; i < NumberOfTDCs; i = i + 1) begin: TDCOut_Changed_Gen  
        DigitalCore_ClkCycleDelay     #           (
                                        .DelayCycles(1))
            TDCOutDelayCell           (
                                        .rst(RstAsync),
                                        .clk(AQC_DLL_out),
                                        .in(TDC_Status[i]),
                                        .out(TDCOut_Changed[i])
                                    );
    end endgenerate
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    Subtractor for Binning
    //-----------------------------------------------------------------------------------
    generate for (i = 0; i < NumberOfTDCs; i = i + 1) begin : subtractor_gen
        DigitalCore_Subtractor      #           (
                                        .Width(TDCTotalBits),
                                        .Bypass_Input_Is_b("TRUE")
                                    )
            SubtractorUnit              (
                                        .bypass(ScanBitsWr[`DigitalCore_SubtractorBypass]),
                                        .a( ScanBitsWr[`DigitalCore_TimeOffsetWord] ),
                                        .b(TDCOut_Binary[i]),
                                        .c(TDCOut_Binary_Adj[i])
                                    );

        DigitalCore_io_flops            #       (
                                        .Width(TDCTotalBits),
                                        .ResetVal(1'b0)) 
            Subtractor_Sampler      (
                                        .clk(AQC_DLL_out),
                                        .reset(RstAsync),
                                        .enable(1'b1),
                                        .in(TDCOut_Binary_Adj[i]),
                                        .out(TDCOut_Binary_Adj_Out[i])
                                    );
    end endgenerate
    //-----------------------------------------------------------------------------------


    //-----------------------------------------------------------------------------------
    //    Binary to One-Hot Converters
    //-----------------------------------------------------------------------------------
    generate for (i = 0; i < NumberOfTDCs; i = i + 1) begin : binary_to_onehot_gen
	    DigitalCore_BinaryToOneHot        #     (
                                        .BinaryWidth    (TDCTotalBits),
                                        .OneHotWidth    (HistNumberOfBins))
            BinaryToOneHotUnit      (     
					                    .enable         (TDCOut_Changed[i] & ~ScanBitsWr[`DigitalCore_TDCDisable_idx(i)]),
                                        .binary         (TDCOut_Binary_Adj_Out[i]), 
                                        .onehot         (TDCOut_OneHot[i])
                                    );
    end endgenerate
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    Vector Sum Units
    //-----------------------------------------------------------------------------------
    generate for (i = 0; i < HistNumberOfBins; i = i + 1) begin : vector_sum_gen
        assign TDCOut_Vector[i] = { TDCOut_OneHot[7][i] , 
                                    TDCOut_OneHot[6][i] , 
                                    TDCOut_OneHot[5][i] , 
                                    TDCOut_OneHot[4][i] , 
                                    TDCOut_OneHot[3][i] , 
                                    TDCOut_OneHot[2][i] , 
                                    TDCOut_OneHot[1][i] , 
                                    TDCOut_OneHot[0][i] };

        DigitalCore_VectorSum                  
                             //#      (
                                        //.InputWidth     (NumberOfTDCs)
                             //       )
            VectorSumUnit           (
                                        .RstAsync       (RstAsync),
                                        .vector         (TDCOut_Vector[i]),
                                        .sum            (TDCOut_VectorSum[VectorSumWidth*(i+1)-1:VectorSumWidth*i])
                                    );
    end endgenerate
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    Flops for Summed One-Hot Values
    //-----------------------------------------------------------------------------------
    //io_flops            #       (
    //                                .Width              (HistNumberOfBins*VectorSumWidth),
    //                                .ResetVal           (1'b0)) 
    //    BinaryToOneHot_Sampler  (
    //                                .clk                (AQC_DLL_out),
    //                                .reset              (RstAsync),
    //                                .enable             (1'b1),
    //                                .in                 (TDCOut_VectorSum),
    //                                .out                (TDCOut_VectorSum_Out)
    //                            );
    //-----------------------------------------------------------------------------------


    //-----------------------------------------------------------------------------------
    //    Accumulator Bank for Histogram
    //-----------------------------------------------------------------------------------
	DigitalCore_AccumulatorBank     #       (
                                    .IncrementBitWidth  (VectorSumWidth),
                                    .NumAccumulators    (HistNumberOfBins),
                                    .AccumulatorDepth   (HistCounterWidth))
        AccumulatorBankUnit
                                (     
                                    .reset_async        (CounterBank_Reset), 
                                    .clk                (AQC_DLL_out_masked),
                                    .in                 (TDCOut_VectorSum),
                                    .count              (Histogram_Data)
                                );

    assign AQC_DLL_out_masked = AQC_DLL_out & Mask_Enable;
    assign CounterBank_Reset = RstAsync | End_Pattern_Reset;
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //    DataTx with independent load/read clocks
    //-----------------------------------------------------------------------------------
    DigitalCore_DataTx_Padded_Sync  #       (   
    								.OVERRIDE_DATAOUT	(OVERRIDE_DATAOUT),
                                    .DataInWidth        (HistTotalBits),
                                    .SyncStages         (2))
        DataTxUnit              (   
                                    .RstAsync           (RstAsync),
	                                .Load               (load_if_pattern_done),
	                                .LoadClkIn          (AQC_DLL_out),
                                    //.LoadClkIn          (DataTxClk),
					                .TxReadRequest      (ExtReadRequest),

	                                .DataIn             (Histogram_Data),
	                                .TestDataIn         (ScanBitsWr[`DigitalCore_TestDataIn]),
	                                .TestPattEnable     (ScanBitsWr[`DigitalCore_TestPattEnable]),

	                                .DataOut            (TxDataOut),
	                                .ReadClkIn          (TxRefClk),
	                                .LoadComplete       (DataTxLoadDone), 
	                                .test_pattern		(test_pattern)
                                );
                                
    if (OVERRIDE_DATAOUT == "False") begin
    	assign load_if_pattern_done = Load & ~dynamic_histogram_reset_active;
    end else begin
    	assign load_if_pattern_done = force_dataout;
    end

    //-----------------------------------------------------------------------------------
    //    Pattern Controller
    //-----------------------------------------------------------------------------------
	DigitalCore_PatternResetController  #   (
                                    .MeasurementCounterWidth            (MeasurementCounterWidth),
                                    .PipelineStages                     (2))
        PatternResetControllerUnit  (
                                    .Clk                                (AQC_DLL_out),
                                    .RstAsync                           (RstAsync),
				                    .PattResetExt                       (PattResetExtSignal),
				                    .PattResetExtEnable                 (ScanBitsWr[`DigitalCore_PattResetExtEnable]),
                                    .Measurement_Count                  (Measurement_Count),
                                    .MeasPerPatt                        (ScanBitsWr[`DigitalCore_MeasPerPatt]),
                                    .MeasCountEnable                    (ScanBitsWr[`DigitalCore_MeasCountEnable]),
                                    .dynamic_histogram_reset_trigger    (dynamic_histogram_reset_trigger),
                                    .dynamic_histogram_reset_active     (dynamic_histogram_reset_active),
                                    .Max_Count_Reset                    (Max_Count_Reset),
                                    .Max_Count_Reset_Pulse              (Max_Count_Reset_Pulse),
                                    .Load                               (Load),
                                    .End_Pattern_Reset                  (End_Pattern_Reset),
                                    .Mask_Enable                        (Mask_Enable),
                                    .DataTxLoadDone                     (DataTxLoadDone)
                                );
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //    Dynamic Configuration Module
    //-----------------------------------------------------------------------------------
	DigitalCore_DynamicConfigurationModule  #   (
                                    .PacketSize(DynamicPacketSize))
        DynamicConfigModuleUnit (
                                    .clk                                (AQC_DLL_out),
                                    .rst                                (RstAsync),
                                    .max_count_reset                    (Max_Count_Reset),
                                    .dynamic_histogram_reset_trigger    (dynamic_histogram_reset_trigger),
                                    .dynamic_histogram_reset_active     (dynamic_histogram_reset_active),
				                    .enable                             (ScanBitsWr[`DigitalCore_DynamicConfigEnable]),
                                    .shift_enable                       (shift_enable),
                                    .shift_data                         (shift_data),
                                    .vcsel_enable_dynamic               (vcsel_enable_dynamic),
                                    .vcsel_wavelength1_enable_dynamic   (vcsel_wavelength1_enable_dynamic),
                                    .vcsel_wavelength2_enable_dynamic   (vcsel_wavelength2_enable_dynamic),
                                    .driver_dll_word_dynamic            (driver_dll_word_dynamic), 
                                    .clk_flip_dynamic                   (clk_flip_dynamic),
                                    .aqc_dll_coarse_word_dynamic        (aqc_dll_coarse_word_dynamic),
                                    .aqc_dll_fine_word_dynamic          (aqc_dll_fine_word_dynamic), 
                                    .aqc_dll_finest_word_dynamic        (aqc_dll_finest_word_dynamic),
                                    .dll_change                         (dll_change_dynamic),
                                    .dll_change_done                    (dll_change_done),
                                    .packet                             (packet)
                                );
                                
    assign ScanBitsRd[`DigitalCore_DynamicPacket] = packet;
    assign shift_enable = ScanBitsWr[`DigitalCore_DynamicConfigEnable] ? PattResetExtSignal : 1'b0;
    assign shift_data = ScanBitsWr[`DigitalCore_DynamicConfigEnable] ? SEnable : 1'b0;
                                                        
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    // VCSEL Controller
    //-----------------------------------------------------------------------------------
	DigitalCore_VCSELController  
	    VCSELControllerUnit     (
                                    .clk                                            (AQC_DLL_out),
                                    .rst                                            (RstAsync),
                                    .max_count_rst                                  (Max_Count_Reset),
                                    .vcsel_enable_controlled_by_scan_chain          (ScanBitsWr[`DigitalCore_VCSELEnableControlledByScan]),
                                    .vcsel_enable_with_scan                         (ScanBitsWr[`DigitalCore_VCSELEnableWithScan]),
                                    .vcsel_enable_controlled_by_shift_register      (ScanBitsWr[`DigitalCore_DynamicConfigEnable]),
                                    .vcsel_enable_with_shift_register               (vcsel_enable_dynamic),
                                    .s_enable                                       (SEnable),
                                    .pattern_reset_external_signal                  (PattResetExtSignal), // Usually SUpdate and not TriggerExt
				                    .vcsel_enable                                   (VCSELEnable)
                                );



    //-----------------------------------------------------------------------------------
    //    VCSEL Drivers
    //-----------------------------------------------------------------------------------
    DigitalCore_VCSEL_PadDriver
        VCSEL1_AFE             (
                                    .START(VCSEL1_Start),
                                    .STOP(VCSEL_Stop),
				                    .VCSEL_OUT(VCSEL1_Anode));

    DigitalCore_VCSEL_PadDriver 
        VCSEL2_AFE             (
                                    .START(VCSEL2_Start),
                                    .STOP(VCSEL_Stop),
				                    .VCSEL_OUT(VCSEL2_Anode));

endmodule

