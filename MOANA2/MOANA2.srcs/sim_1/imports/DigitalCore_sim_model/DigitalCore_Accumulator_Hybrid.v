
// time scale
`timescale 1ns/1ps

// no undeclared nets
//`default_nettype none

module DigitalCore_Accumulator_Hybrid (
        
    reset_async,
    clk,
    in,
    out

    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------

    parameter       IncrementBitWidth =         3;
    parameter       AccumulatorDepth =          10;  

    localparam      SynchronousBits =           IncrementBitWidth + 1;
    localparam      AsynchronousBits =          AccumulatorDepth - SynchronousBits;
    localparam      SynchronousDummyBits =      1;
    //-----------------------------------------------------------------------------------
    //  Ports
    //-----------------------------------------------------------------------------------
    input   wire                                reset_async;
    input   wire                                clk;
    input   wire    [IncrementBitWidth-1:0]     in;
    output  wire    [AccumulatorDepth-1:0]      out;

    //-----------------------------------------------------------------------------------
    //  Internal Wires
    //-----------------------------------------------------------------------------------
    reg             [SynchronousBits-1:0]       sync_bits;
    wire            [AsynchronousBits-1:0]      async_bits;
    wire                                        carry;
    wire                                        gated_clk;
    reg                                         capped;
    wire                                        overflow;
    wire                                        counter_clk_enable;

    //-----------------------------------------------------------------------------------
    //  Gen Variables
    //-----------------------------------------------------------------------------------
    genvar                                  i;

    //-----------------------------------------------------------------------------------
    //  Assigns
    //-----------------------------------------------------------------------------------
    assign overflow = carry & (&async_bits);
    assign counter_clk_enable = carry & ~overflow;
    assign out = capped ? { async_bits, {SynchronousBits{1'b1}} } : { async_bits, sync_bits };

    //-----------------------------------------------------------------------------------
    //  Synchronous Accumulate Bits
    //-----------------------------------------------------------------------------------
    always @(posedge clk or posedge reset_async) begin
        if (reset_async) begin
            sync_bits <= {SynchronousBits{1'b0}};
        end else begin
            sync_bits <= sync_bits + { {SynchronousDummyBits{1'b0}}, in };
        end
    end

    //-----------------------------------------------------------------------------------
    //  Asynchronous Carry Calculation
    //-----------------------------------------------------------------------------------
    DigitalCore_carry   #           (
                            .Width  (SynchronousBits))
        acc_carry       (
                            .a      ({ {SynchronousDummyBits{1'b0}}, in }),
                            .b      (sync_bits),
                            .c      (carry)
                        );
                        
    //-----------------------------------------------------------------------------------
    //  Keeping track of overflow, once counter is capped, it stops incrementing
    //-----------------------------------------------------------------------------------                
    always @(posedge clk or posedge reset_async) begin
        if (reset_async) begin
            capped <= 1'b0;
        end else if (overflow) begin
            capped <= 1'b1;
        end else begin
            capped <= capped;
        end
    end
                        
                        
    //-----------------------------------------------------------------------------------
    //  Clock Gate Module
    //-----------------------------------------------------------------------------------
    DigitalCore_ClockGate           
        carry_gate      (
                            .clk        (clk),
                            .en         (counter_clk_enable),
                            .gated_clk  (gated_clk)
                        );

    //-----------------------------------------------------------------------------------
    //  Asynchronous counter
    //-----------------------------------------------------------------------------------
    DigitalCore_async_counter   #   (
                            .Width  (AsynchronousBits))
        acc_counter     (
                            .reset  (reset_async),
                            .clk    (gated_clk),
                            .count  (async_bits)
                        );

endmodule

