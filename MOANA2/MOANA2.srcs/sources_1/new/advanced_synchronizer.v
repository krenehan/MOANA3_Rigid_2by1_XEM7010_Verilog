`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2022 02:12:55 PM
// Design Name: 
// Module Name: advanced_synchronizer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module advanced_synchronizer #(
		parameter BUS_WIDTH = 1, 
		parameter SYNC_STAGES = 3
	)
	(
		input wire rst,
		input wire src_clk,
		input wire dest_clk,
		input wire src_ctrl, 
		output wire dest_ctrl, 
		output wire src_ctrl_feedback,
		input wire [BUS_WIDTH-1:0] src_bus,
		output wire [BUS_WIDTH-1:0] dest_bus
    );
    
    //-----------------------------------------------------------------------------------
    //  Genvar
    //-----------------------------------------------------------------------------------
    genvar											i;
    
    //-----------------------------------------------------------------------------------
    //  Internal wires and registers
    //-----------------------------------------------------------------------------------
    wire 											take_data_d;
    reg 												take_data;
    reg 		[SYNC_STAGES-1:0] 			take_data_sync;
    wire 											got_data_d;
    reg 												got_data;
    reg 		[SYNC_STAGES-1:0] 			got_data_sync;
    wire 	[BUS_WIDTH-1:0] 				bus_flop_d;
    reg 		[BUS_WIDTH-1:0] 				bus_flop;
    
    
    //-----------------------------------------------------------------------------------
    //  Assign statement 
    //-----------------------------------------------------------------------------------
    assign dest_bus = bus_flop;
    
    //-----------------------------------------------------------------------------------
    //  Input mux and flop for src_ctrl signal
    //-----------------------------------------------------------------------------------
    assign take_data_d = src_ctrl ? ~take_data : take_data;

	always @(posedge src_clk or posedge rst) begin
        if (rst) begin
        	take_data <= 0;
        end else begin
        	take_data <= take_data_d;
        end
    end


    //-----------------------------------------------------------------------------------
    //  Synchronizer stages for take_data
    //-----------------------------------------------------------------------------------
    always @(posedge dest_clk or posedge rst) begin
        if (rst) begin
        	take_data_sync[0] <= 0;
        end else begin
        	take_data_sync[0] <= take_data;
        end
    end

	generate for (i = 1; i < SYNC_STAGES; i = i + 1) begin: take_data_sync_gen
        always @(posedge dest_clk or posedge rst) begin
            if (rst) begin
            	take_data_sync[i] <= 0;
            end else begin
            	take_data_sync[i] <= take_data_sync[i-1];
            end
        end
    end endgenerate


    //-----------------------------------------------------------------------------------
    //  XOR gate for dest control signal
    //-----------------------------------------------------------------------------------
    assign dest_ctrl = take_data_sync[SYNC_STAGES-1] ^ take_data_sync[SYNC_STAGES-2];
    
    
    //-----------------------------------------------------------------------------------
    //  Data crossing
    //-----------------------------------------------------------------------------------
    generate for (i = 1; i < BUS_WIDTH; i = i + 1) begin: data_sync_gen
    
    	// Mux
    	assign bus_flop_d[i] = dest_ctrl ? dest_bus[i] : src_bus[i];
    	
    	// Flop
    	always @(posedge dest_clk or posedge rst) begin
    		if (rst) begin
    			bus_flop[i] <= 1'b0;
    		end else begin
    			bus_flop[i] <= bus_flop_d[i];
    		end
    	end
    end endgenerate
    
    
    //-----------------------------------------------------------------------------------
    //  Input mux and flop for dest_ctrl signal
    //-----------------------------------------------------------------------------------
    assign got_data_d = dest_ctrl ? ~got_data : got_data;

	always @(posedge dest_clk or posedge rst) begin
        if (rst) begin
        	got_data <= 0;
        end else begin
        	got_data <= got_data_d;
        end
    end


    //-----------------------------------------------------------------------------------
    //  Synchronizer stages for dest_ctrl
    //-----------------------------------------------------------------------------------
    always @(posedge src_clk or posedge rst) begin
        if (rst) begin
        	got_data_sync[0] <= 0;
        end else begin
        	got_data_sync[0] <= got_data;
        end
    end

	generate for (i = 1; i < SYNC_STAGES; i = i + 1) begin: got_data_sync_gen
        always @(posedge src_clk or posedge rst) begin
            if (rst) begin
            	got_data_sync[i] <= 0;
            end else begin
            	got_data_sync[i] <= got_data_sync[i-1];
            end
        end
    end endgenerate


    //-----------------------------------------------------------------------------------
    //  XOR gate for src control feedback signal
    //-----------------------------------------------------------------------------------
    assign src_ctrl_feedback = got_data_sync[SYNC_STAGES-1] ^ got_data_sync[SYNC_STAGES-2];
        
    
endmodule
