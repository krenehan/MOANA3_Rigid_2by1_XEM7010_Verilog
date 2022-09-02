
// time scale
`timescale 1ns/1ps

// A simple module just containing flops to be used for I/O. This is so
// that it is easier to tell floorplanning to put these flops in their
// own region and/or to not get optimized away during synthesis

module DigitalCore_carry (
        a,
        b,
        c
    );

    //-----------------------------------------------------------------------------------
    //  Physical Parameters
    //-----------------------------------------------------------------------------------
    parameter Width =       1;
    //-----------------------------------------------------------------------------------
    
    genvar i;
    
    //-----------------------------------------------------------------------------------
    //  I/O
    //-----------------------------------------------------------------------------------
    input  wire  [Width-1:0] a;
    input  wire  [Width-1:0] b;
    output wire              c;
    
    //-----------------------------------------------------------------------------------
    //  I/O
    //-----------------------------------------------------------------------------------
    wire  [Width-1:0] gen;
    wire  [Width-1:0] prop;
    wire  [Width:0] carry;

    //-----------------------------------------------------------------------------------
    //  Input and output carry
    //-----------------------------------------------------------------------------------
    assign c = carry[Width];
    assign carry[0] = 1'b0;
    
    //-----------------------------------------------------------------------------------
    //  Logic
    //-----------------------------------------------------------------------------------
    generate for (i = 0; i < Width; i = i + 1) begin : gen_gen_and_prop
        assign gen[i]  = a[i] & b[i];
        assign prop[i] = a[i] | b[i];
    end endgenerate
    
    generate for (i = 1; i <= Width; i = i + 1) begin : gen_carry
        assign carry[i] = gen[i-1] | (prop[i-1] & carry[i-1]);
   end endgenerate

endmodule

