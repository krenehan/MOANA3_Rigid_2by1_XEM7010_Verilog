`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2022 09:15:33 AM
// Design Name: 
// Module Name: AfterPulseGenerator
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


module AfterPulseGenerator(
    input wire rst,
    input wire clk,
    input wire in,
    output wire out
    );
    
    //-----------------------------------------------------------------------------------
    //  Genvars
    //-----------------------------------------------------------------------------------
    genvar i;
    //-----------------------------------------------------------------------------------
	
    //-----------------------------------------------------------------------------------
    //   Wires
    //-----------------------------------------------------------------------------------
    reg [1:0] in_delayed;

    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //   Assigns
    //-----------------------------------------------------------------------------------
    assign out = ~in_delayed[0] & in_delayed[1];

    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    Flops
    //-----------------------------------------------------------------------------------
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            in_delayed[0] <= 1'b0;
            in_delayed[1] <= 1'b0;
        end else begin
            in_delayed[0] <= in;
            in_delayed[1] <= in_delayed[0];
        end
    end

    
    
endmodule
