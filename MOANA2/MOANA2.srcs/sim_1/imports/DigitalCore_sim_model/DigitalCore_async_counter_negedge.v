
`timescale 1ns/1ps

// A hybrid synchronous/asychronous counter. The LSB bits are implemented as a sychronous
// addition while all other bits are implemented as an asychronous chained flip-flop counter


module DigitalCore_async_counter_negedge(
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
    always @(negedge clk or posedge reset) begin
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

