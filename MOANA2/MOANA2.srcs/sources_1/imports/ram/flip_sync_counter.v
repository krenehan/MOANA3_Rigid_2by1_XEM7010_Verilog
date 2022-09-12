`timescale 1ns/1ps

// No auto creation of nets
//`default_nettype none

module flip_sync_counter
	#(
		parameter WIDTH = 10,
		parameter FLIP_AT_VAL = 10'd1023)
	(
        input wire reset,
		input wire clk,
		input wire enable,
        output reg [WIDTH-1:0] count, 
        output wire alert, 
        output reg flipped
    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //  Interal wires and registers
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //  Assigns
    //-----------------------------------------------------------------------------------
    assign alert = count == FLIP_AT_VAL - 1;
    
    //-----------------------------------------------------------------------------------
    //  Synchronous Counter
    //-----------------------------------------------------------------------------------
    // First bit of the asychronous counter
    always @(posedge clk or posedge reset) begin
        if (reset) begin
			count <= 0;
			flipped <= 1'b0;
			
		end else begin
		
			// Flipped default state
			flipped <= 1'b0;
		
			if (enable) begin
				if (alert) begin
					flipped <= 1'b1;
					count <= 0;
				end else begin
					count <= count + 1;
				end
			end
		end
	end
    //-----------------------------------------------------------------------------------

endmodule

