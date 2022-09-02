`timescale 1ns/1ps

// No auto creation of nets
//`default_nettype none

module capped_sync_counter_negedge(
        reset,
		clk,
		enable,
        cap,
        count
    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    parameter Width =           10;
	localparam DummyBits = 		Width-1;
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //  I/O
    //-----------------------------------------------------------------------------------
    input wire                  clk;
    input wire                  reset;
	input wire					enable;
    input wire  [Width-1:0]     cap;
    output reg  [Width-1:0]     count;
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //  Synchronous Counter
    //-----------------------------------------------------------------------------------
    // First bit of the asychronous counter
    always @(negedge clk or posedge reset) begin
        if (reset) begin
			count[Width-1:0] <= {Width{1'b0}};
		end else if (enable) begin
            if (count == cap) begin
                count[Width-1:0] <= {Width{1'b0}};
            end else begin
                count[Width-1:0] <= count[Width-1:0] + { {DummyBits{1'b0}}, 1'b1};
            end
		end
	end
    //-----------------------------------------------------------------------------------

endmodule

