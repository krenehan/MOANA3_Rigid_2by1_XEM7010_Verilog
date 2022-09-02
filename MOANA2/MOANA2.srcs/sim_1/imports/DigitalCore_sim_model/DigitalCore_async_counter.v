
`timescale 1ns/1ps

// A hybrid synchronous/asychronous counter. The LSB bits are implemented as a sychronous
// addition while all other bits are implemented as an asychronous chained flip-flop counter

// No auto creation of nets
//`default_nettype none

module DigitalCore_async_counter(
        reset,
	    clk,
        count
    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    parameter Width =           10;
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //  I/O
    //-----------------------------------------------------------------------------------
    input wire                  clk;
    input wire                  reset;
    output reg  [Width-1:0]     count;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Variables
    //-----------------------------------------------------------------------------------
    genvar                      i;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Asynchronous Counter
    //-----------------------------------------------------------------------------------
    // First bit of the asychronous counter
    always @(posedge clk or posedge reset) begin
        if (reset) count[0] <= 1'b0;
        else count[0] <= ~count[0];
    end
    
    // The rest of the async counter bits
    generate for (i = 1; i < Width; i = i + 1) begin: gen_async_count
        always @(negedge count[i-1] or posedge reset) begin
            if (reset) count[i] <= 1'b0;
            else count[i] <= ~count[i];
        end
    end endgenerate
    //-----------------------------------------------------------------------------------

endmodule

