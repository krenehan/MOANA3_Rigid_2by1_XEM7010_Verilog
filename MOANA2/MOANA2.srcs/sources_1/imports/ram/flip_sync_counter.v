`timescale 1ns/1ps

// No auto creation of nets
//`default_nettype none

module flip_sync_counter
	#(
		parameter WIDTH = 10,
		parameter FIXED_FLIP_VAL = "True",
		parameter FLIP_AT_VAL = 2)
	(
        input wire reset,
		input wire clk,
		input wire enable,
        output reg [WIDTH-1:0] count, 
        output wire alert, 
        output reg flipped, 
        input wire [WIDTH-1:0] flip_val
    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //  Interal wires and registers
    //-----------------------------------------------------------------------------------
    reg alert_fixed;
    reg alert_configurable;
    
    //-----------------------------------------------------------------------------------
    //  Assigns
    //-----------------------------------------------------------------------------------
    always @(*) begin
    	if (FIXED_FLIP_VAL == "True") begin
    		alert_fixed = count == FLIP_AT_VAL - 1;
    		alert_configurable = 1'b0;
    	end else begin
    		alert_fixed = 1'b0;
    		alert_configurable = count == flip_val - 1;
    	end
    end
    assign alert = (FIXED_FLIP_VAL == "True") ? alert_fixed : alert_configurable;
    
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

