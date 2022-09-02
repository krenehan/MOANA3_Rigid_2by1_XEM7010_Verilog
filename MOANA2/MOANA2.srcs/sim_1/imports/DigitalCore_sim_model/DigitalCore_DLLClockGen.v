`timescale 1ns/1ps


module DigitalCore_DLLClockGen(
        CLK_IN, 
        DRIVER_WORD, 
        FINEWORD,
        FINESTWORD,
        COARSEWORD,
        CLK_FLIP, 
        BYPASS, 
        AQC_DLL_OUT, 
        AQC_DLL_OUT_REF,
        CATHODE, 
        VRST, 
        VCSEL1_SELECT, 
        VCSEL2_SELECT, 
        VCSEL_ENABLE,
        VCSEL_STOP, 
        VCSEL_START1,
        VCSEL_START2,
        CHANGE,
        DYNAMIC,
        RESET,
        DONE
);
    
    parameter CoarseWordWidth = 4;
    parameter FineWordWidth = 3;
    parameter DriverDelayStages = 5;

    input wire CLK_IN;
    input wire CLK_FLIP;
    input wire BYPASS;
    input wire [CoarseWordWidth-1:0] COARSEWORD;
    input wire [FineWordWidth-1:0] FINEWORD;
    input wire FINESTWORD;
    input wire [DriverDelayStages-1:0] DRIVER_WORD;
    output wire AQC_DLL_OUT;
    output wire AQC_DLL_OUT_REF;
    inout wire VRST;
    inout wire CATHODE;
    output wire VCSEL_START1;
    output wire VCSEL_START2;
    input wire VCSEL1_SELECT;
    input wire VCSEL2_SELECT;
    output wire VCSEL_STOP;
    input wire VCSEL_ENABLE;
    input wire CHANGE;
    input wire DYNAMIC;
    input wire RESET;
    output wire DONE;



    DigitalCore_DLLClockGen_Dynamic
        DLLClockGenInst         (   
                                    .CLK_IN(CLK_IN), 
                                    .DRIVER_WORD(DRIVER_WORD), 
                                    .FINEWORD(FINEWORD), 
                                    .FINESTWORD(FINESTWORD),
                                    .COARSEWORD(COARSEWORD),
                                    .CLK_FLIP(CLK_FLIP), 
                                    .BYPASS(BYPASS), 
                                    .AQC_DLL_OUT(AQC_DLL_OUT), 
                                    .AQC_DLL_OUT_REF(AQC_DLL_OUT_REF),
                                    .VCSEL1_SELECT(VCSEL1_SELECT), 
                                    .VCSEL2_SELECT(VCSEL2_SELECT), 
                                    .VCSEL_ENABLE(VCSEL_ENABLE),
                                    .VCSEL_STOP(VCSEL_STOP), 
                                    .VCSEL_START1(VCSEL_START1),
                                    .VCSEL_START2(VCSEL_START2),
                                    .CHANGE(CHANGE),
                                    .DYNAMIC(DYNAMIC),
                                    .RESET(RESET),
                                    .DONE(DONE)
                                );





endmodule

