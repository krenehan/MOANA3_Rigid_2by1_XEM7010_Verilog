
`timescale 1ns/1ps

// A synchronous counter

module DigitalCore_sync_counter(
        reset,
	    clk,
        count
    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    parameter Width =           10;
    localparam DummyBits =      Width-1;
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //  I/O
    //-----------------------------------------------------------------------------------
    input wire                  clk;
    input wire                  reset;
    output reg  [Width-1:0]     count;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Synchronous Counter
    //-----------------------------------------------------------------------------------
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= {Width{1'b0}};
        end else begin
            count <= count + { {DummyBits{1'b0}}, 1'b1 };
        end
    end
    //-----------------------------------------------------------------------------------

endmodule
