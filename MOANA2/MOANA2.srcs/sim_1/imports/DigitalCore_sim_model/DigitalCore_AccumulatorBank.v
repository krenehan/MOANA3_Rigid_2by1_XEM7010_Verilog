
// time scale
`timescale 1ns/1ps

// no undeclared nets
//`default_nettype none

module DigitalCore_AccumulatorBank (
        
    reset_async,
    clk,
    in,
    count

    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------

    parameter       IncrementBitWidth = 3;
    parameter       NumAccumulators = 25;
    parameter       AccumulatorDepth = 10;  

    localparam      InputWidth = NumAccumulators * IncrementBitWidth;
    localparam      OutputWidth = NumAccumulators * AccumulatorDepth;
    //-----------------------------------------------------------------------------------
    //  Ports
    //-----------------------------------------------------------------------------------
    input wire reset_async;
    input wire clk;
    input wire [InputWidth-1:0] in;
    output wire [OutputWidth-1:0] count;

    //-----------------------------------------------------------------------------------
    //  Internal Wires
    //-----------------------------------------------------------------------------------
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Gen Variables
    //-----------------------------------------------------------------------------------
    genvar                                  i;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Assigns
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Generate counters
    //-----------------------------------------------------------------------------------
    generate for (i = 0; i < NumAccumulators; i = i + 1) begin : histogram_accumulator_bank
        DigitalCore_Accumulator_Hybrid #(   .IncrementBitWidth(IncrementBitWidth),
                                .AccumulatorDepth(AccumulatorDepth))
            AccumulatorUnit 
                            (
                                .reset_async        (reset_async),
                                .clk                (clk),
                                .in                 (in[(i+1)*IncrementBitWidth-1:i*IncrementBitWidth]),
                                .out                (count[(i+1)*AccumulatorDepth-1:i*AccumulatorDepth])
                            );
    end endgenerate

    //-----------------------------------------------------------------------------------


endmodule

