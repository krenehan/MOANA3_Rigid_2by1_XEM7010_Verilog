
// time scale
`timescale 1ns/1ps

// no undeclared nets
//`default_nettype none

// A simple module just containing flops to be used for I/O. This is so
// that it is easier to tell floorplanning to put these flops in their
// own region and/or to not get optimized away during synthesis

module DigitalCore_io_flops (
        clk,
        reset,
        enable,
        in,
        out
    );

    //-----------------------------------------------------------------------------------
    //  Physical Parameters
    //-----------------------------------------------------------------------------------
    parameter Width =       1;
    parameter ResetVal =    1'b0;
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //  I/O
    //-----------------------------------------------------------------------------------
    input wire              clk;
    input wire              reset;
    input wire              enable;
    input wire  [Width-1:0] in;
    output reg  [Width-1:0] out;
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //  Register
    //-----------------------------------------------------------------------------------
    always @(posedge clk or posedge reset) begin
        if (reset) out <= ResetVal;
        else if (enable) out <= in;
    end 
    //-----------------------------------------------------------------------------------

endmodule

