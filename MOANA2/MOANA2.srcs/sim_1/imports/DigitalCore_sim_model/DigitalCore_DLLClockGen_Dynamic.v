`timescale 1ns/1ps

module DigitalCore_DLLClockGen_Dynamic (
        CLK_IN, 
        DRIVER_WORD, 
        FINEWORD, 
        FINESTWORD,
        COARSEWORD,
        CLK_FLIP, 
        BYPASS, 
        AQC_DLL_OUT, 
        AQC_DLL_OUT_REF,
        VCSEL1_SELECT, 
        VCSEL2_SELECT, 
        VCSEL_ENABLE,
        VCSEL_STOP, 
        VCSEL_START1,
        VCSEL_START2, 
        DONE, 
        CHANGE,
        DYNAMIC,
	RESET
);
    
    
    // Parameters
    localparam CoarseWordWidth = 4;
    localparam FineWordWidth = 3;
    localparam DriverDelayStages = 5;
    
    // Genvar
    genvar i;


    // IO
    input wire CLK_IN;
    input wire CLK_FLIP;
    input wire BYPASS;
    input wire [CoarseWordWidth-1:0] COARSEWORD;
    input wire [FineWordWidth-1:0] FINEWORD;
    input wire FINESTWORD;
    input wire [DriverDelayStages-1:0] DRIVER_WORD;
    output wire AQC_DLL_OUT;
    output wire AQC_DLL_OUT_REF;
    output wire VCSEL_START1;
    output wire VCSEL_START2;
    input wire VCSEL1_SELECT;
    input wire VCSEL2_SELECT;
    output wire VCSEL_STOP;
    input wire VCSEL_ENABLE;
    input wire RESET;
    output wire DONE;
    input wire CHANGE;
    input wire DYNAMIC;

    // Internal wires
    wire VCSEL_START;
    wire VCSEL_START1_INT, VCSEL_START1_INT_BAR;
    wire VCSEL_START2_INT, VCSEL_START2_INT_BAR;
    wire VCSEL_STOP_INT, VCSEL_STOP_INT_ONE, VCSEL_STOP_INT_TWO, VCSEL_STOP_INT_BAR;
    wire AQC_DLL_OUT_INT, AQC_DLL_OUT_INT_BAR, AQC_DLL_OUT_INT_BUFF, AQC_DLL_OUT_INT_BAR_BUFF;
    wire AQC_DLL_OUT_REF_BAR;
    
    // More internal wires
    wire RESET_N;
    wire [DriverDelayStages-1:0] DW_DELONE, DW_FLOPONE, DW_DELTWO, DW_FLOPTWO, DW_DELTHREE;
    wire [DriverDelayStages-1:0] DRIVER_WORD_DELAYED, DRIVER_WORD_DLL;
    wire [CoarseWordWidth-1:0] CW_DELONE, CW_FLOPONE, CW_DELTWO, CW_FLOPTWO, CW_DELTHREE, COARSEWORD_DELAYED, COARSEWORD_DLL;
    wire [FineWordWidth-1:0] FW_DELONE, FW_FLOPONE, FW_DELTWO, FW_FLOPTWO, FW_DELTHREE, FINEWORD_DELAYED, FINEWORD_DLL;
    wire FSTW_DELONE, FSTW_FLOPONE, FSTW_DELTWO, FSTW_FLOPTWO, FSTW_DELTHREE, FINESTWORD_DELAYED, FINESTWORD_DLL;
    wire DONE_OR_NO_CHANGE;
    wire CHANGE_DELONE, CHANGE_FLOPONE, CHANGE_DELTWO, CHANGE_FLOPTWO, CHANGE_BAR_DLL, CHANGE_DELTHREE, CHANGE_FLOPTHREE, CHANGE_DELFOUR, CHANGE_FLOPFOUR, CHANGE_DELFIVE;
    wire CLK_DLL_OUT, CLK_DLL_OUT_DELAYED;
    wire CLK_FLIP_DELONE, CLK_FLIP_FLOPONE, CLK_FLIP_DELTWO, CLK_FLIP_FLOPTWO, CLK_FLIP_DELTHREE, CLK_FLIP_DELAYED, CLK_FLIP_DLL;
    wire VCSEL1_SELECT_DELONE, VCSEL1_SELECT_FLOPONE, VCSEL1_SELECT_DELTWO, VCSEL1_SELECT_FLOPTWO, VCSEL1_SELECT_DELTHREE, VCSEL1_SELECT_DELAYED, VCSEL1_SELECT_DLL;
    wire VCSEL2_SELECT_DELONE, VCSEL2_SELECT_FLOPONE, VCSEL2_SELECT_DELTWO, VCSEL2_SELECT_FLOPTWO, VCSEL2_SELECT_DELTHREE, VCSEL2_SELECT_DELAYED, VCSEL2_SELECT_DLL;
    wire VCSEL_ENABLE_DELONE, VCSEL_ENABLE_FLOPONE, VCSEL_ENABLE_DELTWO, VCSEL_ENABLE_FLOPTWO, VCSEL_ENABLE_DELTHREE, VCSEL_ENABLE_DELAYED, VCSEL_ENABLE_DLL;
    
    // Inverter for reset input (asynchronous)
    assign RESET_N = ~RESET;
    
    // Multiplexers for scan vs dynamic
    generate for (i = 0; i < CoarseWordWidth; i = i + 1) begin : select_coarseword_scan_vs_dynamic
        assign COARSEWORD_DLL[i] = DYNAMIC ? COARSEWORD_DELAYED[i] : COARSEWORD[i];
    end endgenerate

    generate for (i = 0; i < FineWordWidth; i = i + 1) begin : select_fineword_scan_vs_dynamic
        assign FINEWORD_DLL[i] = DYNAMIC ? FINEWORD_DELAYED[i] : FINEWORD[i];
    end endgenerate

    assign FINESTWORD_DLL = DYNAMIC ? FINESTWORD_DELAYED : FINESTWORD;

    generate for (i = 0; i < DriverDelayStages; i = i + 1) begin : select_driverword_scan_vs_dynamic
        assign DRIVER_WORD_DLL[i] = DYNAMIC ? DRIVER_WORD_DELAYED[i] : DRIVER_WORD[i];
    end endgenerate
    
    assign CLK_FLIP_DLL = DYNAMIC ? CLK_FLIP_DELAYED : CLK_FLIP;
    assign VCSEL1_SELECT_DLL = DYNAMIC ? VCSEL1_SELECT_DELAYED : VCSEL1_SELECT;
    assign VCSEL2_SELECT_DLL = DYNAMIC ? VCSEL2_SELECT_DELAYED : VCSEL2_SELECT;
    assign VCSEL_ENABLE_DLL = DYNAMIC ? VCSEL_ENABLE_DELAYED : VCSEL_ENABLE;

    // Driver word 4 to 0 delay flops
    generate
        for (i = 0; i < DriverDelayStages; i = i + 1) begin : driverword_4to0_delay
            DELLVT0     I_DRIVER_WORD_DELONE_DT    (   .I(DRIVER_WORD[i]),  .Z(DW_DELONE[i])                                            );
            DFCNQLVTD1  I_DRIVER_WORD_FLOPONE      (   .D(DW_DELONE[i]),    .Q(DW_FLOPONE[i]),          .CP(CLK_IN),    .CDN(RESET_N)   );
            DELLVT0     I_DRIVER_WORD_DELTWO_DT    (   .I(DW_FLOPONE[i]),   .Z(DW_DELTWO[i])                                            );
            DFCNQLVTD1  I_DRIVER_WORD_FLOPTWO      (   .D(DW_DELTWO[i]),    .Q(DW_FLOPTWO[i]),          .CP(CLK_IN),    .CDN(RESET_N)   );
            DELLVT0     I_DRIVER_WORD_DELTHREE_DT  (   .I(DW_FLOPTWO[i]),   .Z(DW_DELTHREE[i])                                          );
            DFCNQLVTD1  I_DRIVER_WORD_FLOPTHREE    (   .D(DW_DELTHREE[i]),  .Q(DRIVER_WORD_DELAYED[i]), .CP(CLK_IN),    .CDN(RESET_N)   );
        end
    endgenerate
    
    // Coarse word delay flops
    generate
        for (i = 0; i < CoarseWordWidth; i = i + 1) begin : coarseword_delay
            DELLVT0     I_COARSEWORD_DELONE_DT    (   .I(COARSEWORD[i]),    .Z(CW_DELONE[i]) );
            DFCNQLVTD1  I_COARSEWORD_FLOPONE      (   .D(CW_DELONE[i]),     .Q(CW_FLOPONE[i]),          .CP(CLK_IN),    .CDN(RESET_N)   );
            DELLVT0     I_COARSEWORD_DELTWO_DT    (   .I(CW_FLOPONE[i]),    .Z(CW_DELTWO[i]) );
            DFCNQLVTD1  I_COARSEWORD_FLOPTWO      (   .D(CW_DELTWO[i]),     .Q(CW_FLOPTWO[i]),          .CP(CLK_IN),    .CDN(RESET_N)   );
            DELLVT0     I_COARSEWORD_DELTHREE_DT  (   .I(CW_FLOPTWO[i]),    .Z(CW_DELTHREE[i]) );
            DFCNQLVTD1  I_COARSEWORD_FLOPTHREE    (   .D(CW_DELTHREE[i]),   .Q(COARSEWORD_DELAYED[i]),  .CP(CLK_IN),    .CDN(RESET_N)   );
        end
    endgenerate
    
    // Fine word delay flops
    generate
        for (i = 0; i < FineWordWidth; i = i + 1) begin : fineword_delay
            DELLVT0     I_FINEWORD_DELONE_DT       (   .I(FINEWORD[i]),      .Z(FW_DELONE[i])                                           );
            DFCNQLVTD1  I_FINEWORD_FLOPONE         (   .D(FW_DELONE[i]),     .Q(FW_FLOPONE[i]),         .CP(CLK_IN),    .CDN(RESET_N)   );
            DELLVT0     I_FINEWORD_DELTWO_DT       (   .I(FW_FLOPONE[i]),    .Z(FW_DELTWO[i])                                           );
            DFCNQLVTD1  I_FINEWORD_FLOPTWO         (   .D(FW_DELTWO[i]),     .Q(FW_FLOPTWO[i]),         .CP(CLK_IN),    .CDN(RESET_N)   );
            DELLVT0     I_FINEWORD_DELTHREE_DT     (   .I(FW_FLOPTWO[i]),    .Z(FW_DELTHREE[i])                                         );
            DFCNQLVTD1  I_FINEWORD_FLOPTHREE       (   .D(FW_DELTHREE[i]),   .Q(FINEWORD_DELAYED[i]),   .CP(CLK_IN),    .CDN(RESET_N)   );
        end
    endgenerate

    // Finest word delay flops
    DELLVT0     I_FINESTWORD_DELONE_DT       (   .I(FINESTWORD),      .Z(FSTW_DELONE)                                           );
    DFCNQLVTD1  I_FINESTWORD_FLOPONE         (   .D(FSTW_DELONE),     .Q(FSTW_FLOPONE),         .CP(CLK_IN),    .CDN(RESET_N)   );
    DELLVT0     I_FINESTWORD_DELTWO_DT       (   .I(FSTW_FLOPONE),    .Z(FSTW_DELTWO)                                           );
    DFCNQLVTD1  I_FINESTWORD_FLOPTWO         (   .D(FSTW_DELTWO),     .Q(FSTW_FLOPTWO),         .CP(CLK_IN),    .CDN(RESET_N)   );
    DELLVT0     I_FINESTWORD_DELTHREE_DT     (   .I(FSTW_FLOPTWO),    .Z(FSTW_DELTHREE)                                         );
    DFCNQLVTD1  I_FINESTWORD_FLOPTHREE       (   .D(FSTW_DELTHREE),   .Q(FINESTWORD_DELAYED),   .CP(CLK_IN),    .CDN(RESET_N)   );
    
    // Change delay flops
    DELLVT0     I_CHANGE_DELONE_DT     (   .I(CHANGE),             .Z(CHANGE_DELONE)                                                               );
    DFCNQLVTD1  I_CHANGE_FLOPONE       (   .D(CHANGE_DELONE),      .Q(CHANGE_FLOPONE),     .CP(CLK_DLL_OUT),   .CDN(RESET_N)                       );
    DELLVT0     I_CHANGE_DELTWO_DT     (   .I(CHANGE_FLOPONE),     .Z(CHANGE_DELTWO)                                                               );
    DFCNLVTD1   I_CHANGE_FLOPTWO       (   .D(CHANGE_DELTWO),      .Q(CHANGE_FLOPTWO),     .CP(CLK_DLL_OUT),   .CDN(RESET_N),  .QN(CHANGE_BAR_DLL) );
    DELLVT0     I_CHANGE_DELTHREE_DT   (   .I(CHANGE_FLOPTWO),     .Z(CHANGE_DELTHREE)                                                             );
    DFCNQLVTD1  I_CHANGE_FLOPTHREE     (   .D(CHANGE_DELTHREE),    .Q(CHANGE_FLOPTHREE),   .CP(CLK_DLL_OUT),   .CDN(RESET_N)                       );
    DELLVT0     I_CHANGE_DELFOUR_DT    (   .I(CHANGE_FLOPTHREE),   .Z(CHANGE_DELFOUR)                                                              );
    DFCNQLVTD1  I_CHANGE_FLOPFOUR      (   .D(CHANGE_DELFOUR),     .Q(CHANGE_FLOPFOUR),    .CP(CLK_DLL_OUT),   .CDN(RESET_N)                       );
    DELLVT0     I_CHANGE_DELFIVE_DT    (   .I(CHANGE_FLOPFOUR),    .Z(CHANGE_DELFIVE)                                                              );
    DFCNQLVTD1  I_CHANGE_FLOPFIVE      (   .D(CHANGE_DELFIVE),     .Q(DONE),               .CP(CLK_DLL_OUT),   .CDN(RESET_N)                       );
    
    // Clock flip delay flops
    DELLVT0     I_CLK_FLIP_DELONE_DT       (   .I(CLK_FLIP),             .Z(CLK_FLIP_DELONE)                                          );
    DFCNQLVTD1  I_CLK_FLIP_FLOPONE         (   .D(CLK_FLIP_DELONE),      .Q(CLK_FLIP_FLOPONE),        .CP(CLK_IN),    .CDN(RESET_N)   );
    DELLVT0     I_CLK_FLIP_DELTWO_DT       (   .I(CLK_FLIP_FLOPONE),     .Z(CLK_FLIP_DELTWO)                                          );
    DFCNQLVTD1  I_CLK_FLIP_FLOPTWO         (   .D(CLK_FLIP_DELTWO),      .Q(CLK_FLIP_FLOPTWO),        .CP(CLK_IN),    .CDN(RESET_N)   );
    DELLVT0     I_CLK_FLIP_DELTHREE_DT     (   .I(CLK_FLIP_FLOPTWO),     .Z(CLK_FLIP_DELTHREE)                                        );
    DFCNQLVTD1  I_CLK_FLIP_FLOPTHREE       (   .D(CLK_FLIP_DELTHREE),    .Q(CLK_FLIP_DELAYED),        .CP(CLK_IN),    .CDN(RESET_N)   );
    
    // VCSEL Enable delay flops
    DELLVT0     I_VCSEL_ENABLE_DELONE_DT       (   .I(VCSEL_ENABLE),             .Z(VCSEL_ENABLE_DELONE)                                          );
    DFCNQLVTD1  I_VCSEL_ENABLE_FLOPONE         (   .D(VCSEL_ENABLE_DELONE),      .Q(VCSEL_ENABLE_FLOPONE),        .CP(CLK_IN),    .CDN(RESET_N)   );
    DELLVT0     I_VCSEL_ENABLE_DELTWO_DT       (   .I(VCSEL_ENABLE_FLOPONE),     .Z(VCSEL_ENABLE_DELTWO)                                          );
    DFCNQLVTD1  I_VCSEL_ENABLE_FLOPTWO         (   .D(VCSEL_ENABLE_DELTWO),      .Q(VCSEL_ENABLE_FLOPTWO),        .CP(CLK_IN),    .CDN(RESET_N)   );
    DELLVT0     I_VCSEL_ENABLE_DELTHREE_DT     (   .I(VCSEL_ENABLE_FLOPTWO),     .Z(VCSEL_ENABLE_DELTHREE)                                        );
    DFCNQLVTD1  I_VCSEL_ENABLE_FLOPTHREE       (   .D(VCSEL_ENABLE_DELTHREE),    .Q(VCSEL_ENABLE_DELAYED),        .CP(CLK_IN),    .CDN(RESET_N)   );
    
    // VCSEL1 Select delay flops
    DELLVT0     I_VCSEL1_SELECT_DELONE_DT       (   .I(VCSEL1_SELECT),             .Z(VCSEL1_SELECT_DELONE)                                          );
    DFCNQLVTD1  I_VCSEL1_SELECT_FLOPONE         (   .D(VCSEL1_SELECT_DELONE),      .Q(VCSEL1_SELECT_FLOPONE),        .CP(CLK_IN),    .CDN(RESET_N)   );
    DELLVT0     I_VCSEL1_SELECT_DELTWO_DT       (   .I(VCSEL1_SELECT_FLOPONE),     .Z(VCSEL1_SELECT_DELTWO)                                          );
    DFCNQLVTD1  I_VCSEL1_SELECT_FLOPTWO         (   .D(VCSEL1_SELECT_DELTWO),      .Q(VCSEL1_SELECT_FLOPTWO),        .CP(CLK_IN),    .CDN(RESET_N)   );
    DELLVT0     I_VCSEL1_SELECT_DELTHREE_DT     (   .I(VCSEL1_SELECT_FLOPTWO),     .Z(VCSEL1_SELECT_DELTHREE)                                        );
    DFCNQLVTD1  I_VCSEL1_SELECT_FLOPTHREE       (   .D(VCSEL1_SELECT_DELTHREE),    .Q(VCSEL1_SELECT_DELAYED),        .CP(CLK_IN),    .CDN(RESET_N)   );
    
    // VCSEL2 Select delay flops
    DELLVT0     I_VCSEL2_SELECT_DELONE_DT       (   .I(VCSEL2_SELECT),             .Z(VCSEL2_SELECT_DELONE)                                          );
    DFCNQLVTD1  I_VCSEL2_SELECT_FLOPONE         (   .D(VCSEL2_SELECT_DELONE),      .Q(VCSEL2_SELECT_FLOPONE),        .CP(CLK_IN),    .CDN(RESET_N)   );
    DELLVT0     I_VCSEL2_SELECT_DELTWO_DT       (   .I(VCSEL2_SELECT_FLOPONE),     .Z(VCSEL2_SELECT_DELTWO)                                          );
    DFCNQLVTD1  I_VCSEL2_SELECT_FLOPTWO         (   .D(VCSEL2_SELECT_DELTWO),      .Q(VCSEL2_SELECT_FLOPTWO),        .CP(CLK_IN),    .CDN(RESET_N)   );
    DELLVT0     I_VCSEL2_SELECT_DELTHREE_DT     (   .I(VCSEL2_SELECT_FLOPTWO),     .Z(VCSEL2_SELECT_DELTHREE)                                        );
    DFCNQLVTD1  I_VCSEL2_SELECT_FLOPTHREE       (   .D(VCSEL2_SELECT_DELTHREE),    .Q(VCSEL2_SELECT_DELAYED),        .CP(CLK_IN),    .CDN(RESET_N)   );
    
    // Input AND gate
    CKAN2LVTD0  I_START_AND1    (   .A1(CLK_IN), .A2(VCSEL_ENABLE_DLL), .Z(VCSEL_START) );

    // Logic to generate VCSEL_START1;
    AN2LVTD0    I_START1_AND1      (   .A1(VCSEL_START), .A2(VCSEL1_SELECT_DLL), .Z(VCSEL_START1_INT) );
    INVLVTD4    I_START1_INV1_DT   (   .I(VCSEL_START1_INT), .ZN(VCSEL_START1_INT_BAR) );
    INVLVTD16   I_START1_INV2_DT   (   .I(VCSEL_START1_INT_BAR), .ZN(VCSEL_START1) );

    // Logic to generate VCSEL_START2;
    AN2LVTD0    I_START2_AND1      (   .A1(VCSEL_START), .A2(VCSEL2_SELECT_DLL), .Z(VCSEL_START2_INT) );
    INVLVTD4    I_START2_INV1_DT   (   .I(VCSEL_START2_INT), .ZN(VCSEL_START2_INT_BAR) );
    INVLVTD16   I_START2_INV2_DT   (   .I(VCSEL_START2_INT_BAR), .ZN(VCSEL_START2) );


    // FINE_DLL for generating VCSEL STOP 
    DigitalCore_FINE_DLL_100PS_STANDALONE_EXTENDED
	I_FINE_DLL		(
					.I		(CLK_IN),
					.S		(DRIVER_WORD_DLL),
					.FINE_OUT	(VCSEL_STOP_INT)
				);
					
                                
    // AND gates for matching with VCSEL Start
    AN2LVTD0    I_STOP_AND1_DT    (   .A1(VCSEL_STOP_INT), .A2(1'b1), .Z(VCSEL_STOP_INT_ONE) );
    AN2LVTD0    I_STOP_AND2_DT    (   .A1(VCSEL_STOP_INT_ONE), .A2(1'b1), .Z(VCSEL_STOP_INT_TWO) );
                                
    // Clock buffers for VCSEL_STOP_INT
    INVLVTD4    I_STOP_INV4_DT     (   .I(VCSEL_STOP_INT_TWO), .ZN(VCSEL_STOP_INT_BAR) );
    INVLVTD16   I_STOP_INV16_DT    (   .I(VCSEL_STOP_INT_BAR), .ZN(VCSEL_STOP) );
    
    // CoarseFine DLL for creating SPAD gating clock and digital logic clock
    DigitalCore_CoarseFine_DLL          #   (
                                    .CoarseWordWidth(CoarseWordWidth),
                                    .FineWordWidth(FineWordWidth))
        I_COARSEFINE_DLL        (
                                    .IN(VCSEL_STOP_INT),
                                    .COARSEWORD(COARSEWORD_DLL),
                                    .FINEWORD(FINEWORD_DLL),
                                    .FINESTWORD(FINESTWORD_DLL),
                                    .CLK_FLIP(CLK_FLIP_DLL),
                                    .BYPASS(BYPASS),
                                    .OUT(CLK_DLL_OUT)
                                );

    // Gating logic
    DigitalCore_DELAY_CELL_800PS    I_CLK_DLL_OUT_DELAYCELL     ( .I(CLK_DLL_OUT),                                  .Z(CLK_DLL_OUT_DELAYED) );
    AN2LVTD0            I_CLK_OUT_DELAYED_AND_DONE  ( .A1(CLK_DLL_OUT_DELAYED), .A2(DONE_OR_NO_CHANGE), .Z(AQC_DLL_OUT_INT)     );
    OR2LVTD0            I_DONE_OR_CHANGEBAR         ( .A1(DONE),                .A2(CHANGE_BAR_DLL),    .Z(DONE_OR_NO_CHANGE)   );

    // Clock buffers for AQC_DLL_OUT
    // INVLVTD1    I_AQC_INV1_DT    (   .I(AQC_DLL_OUT_INT),            .ZN(AQC_DLL_OUT_INT_BAR)        );
    // INVLVTD3    I_AQC_INV3_DT    (   .I(AQC_DLL_OUT_INT_BAR),        .ZN(AQC_DLL_OUT_INT_BUFF)       );
    // INVLVTD8    I_AQC_INV8_DT    (   .I(AQC_DLL_OUT_INT_BUFF),       .ZN(AQC_DLL_OUT_INT_BAR_BUFF)   );
    // INVLVTD24   I_AQC_INV24_DT   (   .I(AQC_DLL_OUT_INT_BAR_BUFF),   .ZN(AQC_DLL_OUT)                );
    CKNLVTD1    I_AQC_INV1_DT    (   .CLK(AQC_DLL_OUT_INT),            .CN(AQC_DLL_OUT_INT_BAR)        );
    CKNLVTD3    I_AQC_INV3_DT    (   .CLK(AQC_DLL_OUT_INT_BAR),        .CN(AQC_DLL_OUT_INT_BUFF)       );
    CKNLVTD8    I_AQC_INV8_DT    (   .CLK(AQC_DLL_OUT_INT_BUFF),       .CN(AQC_DLL_OUT_INT_BAR_BUFF)   );
    CKNLVTD24   I_AQC_INV24_DT   (   .CLK(AQC_DLL_OUT_INT_BAR_BUFF),   .CN(AQC_DLL_OUT)                );
    
    // Clock buffers for AQC_DLL_OUT_REF
    // INVLVTD1    I_AQC_REF_INV1_DT  (   .I(AQC_DLL_OUT_INT_BUFF),   .ZN(AQC_DLL_OUT_REF_BAR)    );
    // INVLVTD4    I_AQC_REF_INV4_DT  (   .I(AQC_DLL_OUT_REF_BAR),    .ZN(AQC_DLL_OUT_REF)        );
    CKNLVTD1    I_AQC_REF_INV1_DT  (   .CLK(AQC_DLL_OUT_INT_BUFF),   .CN(AQC_DLL_OUT_REF_BAR)    );
    CKNLVTD4    I_AQC_REF_INV4_DT  (   .CLK(AQC_DLL_OUT_REF_BAR),    .CN(AQC_DLL_OUT_REF)        );


endmodule

primitive tsmc_xbuf (o, i, dummy);
   output o;     
   input i, dummy;
   table         
   // i dummy : o
      0   1   : 0 ;
      1   1   : 1 ;
      x   1   : 1 ;
   endtable      
endprimitive 
primitive tsmc_dff (q, d, cp, cdn, sdn, notifier);
   output q;
   input d, cp, cdn, sdn, notifier;
   reg q;
   table
      ?   ?   0   ?   ? : ? : 0 ; // CDN dominate SDN
      ?   ?   1   0   ? : ? : 1 ; // SDN is set   
      ?   ?   1   x   ? : 0 : x ; // SDN affect Q
      ?   ?   1   x   ? : 1 : 1 ; // Q=1,preset=X
      ?   ?   x   1   ? : 0 : 0 ; // Q=0,clear=X
      0 (01)  ?   1   ? : ? : 0 ; // Latch 0
      0 (0x)  1   1   ? : ? : x ; // Weak clock
      0   0   ?   1   ? : 0 : 0 ; // Keep 0 (D==Q)
      1 (01)  1   ?   ? : ? : 1 ; // Latch 1   
      1 (0x)  1   ?   ? : ? : x ; // Weak clock
      1   0   1   ?   ? : 1 : 1 ; // Keep 1 (D==Q)
      ? (1?)  1   1   ? : ? : - ; // ignore negative edge of clock
      ?   0   1   1   ? : ? : - ; // ignore low-level clock
      ?   ? (?1)  1   ? : ? : - ; // ignore positive edge of CDN
      ?   ?   1 (?1)  ? : ? : - ; // ignore posative edge of SDN
      *   ?   1   1   ? : ? : - ; // ignore data change on steady clock
      ?   ?   ?   ?   * : ? : x ; // timing check violation
   endtable
endprimitive

