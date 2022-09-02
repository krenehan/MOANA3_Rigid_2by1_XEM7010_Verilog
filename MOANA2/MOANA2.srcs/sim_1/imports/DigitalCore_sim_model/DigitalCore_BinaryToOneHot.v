
// time scale
`timescale 1ns/1ps

// no undeclared nets
//`default_nettype none

module DigitalCore_BinaryToOneHot(
    
	enable,
    binary,
    onehot

    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------

    parameter       BinaryWidth = 5;
    parameter       OneHotWidth = 24;
    localparam      DummyBits = OneHotWidth-BinaryWidth;
    localparam	    OneHotWidthMinusOne = OneHotWidth-1;	

    //-----------------------------------------------------------------------------------
    //  Ports
    //-----------------------------------------------------------------------------------
    input wire 								enable;
    input wire  [BinaryWidth-1:0]                          	        binary;
    output wire [OneHotWidth-1:0]                                  	onehot;

    //-----------------------------------------------------------------------------------
    //  Internal Wires
    //-----------------------------------------------------------------------------------
    wire                                                            pass;
    wire  [OneHotWidth-1:0]                                         onehot_passed;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Gen Variables
    //-----------------------------------------------------------------------------------
    genvar                                  i;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Assigns 
    //-----------------------------------------------------------------------------------
    // Gate out large values
    assign pass = ({ {DummyBits{1'b0}}, binary } <= { {1'b1}, {OneHotWidthMinusOne{1'b0}} }) ? 1'b1 : 1'b0 ; // this line is changed

    // Combination one-hot logic
    assign onehot_passed = pass ? ({ {OneHotWidthMinusOne{1'b0}},{1'b1} } << binary) : {OneHotWidth{1'b0}} ; // this as well

    // Output is gated based on enable signal
    assign onehot = enable ? onehot_passed : {OneHotWidth{1'b0}} ;

    //-----------------------------------------------------------------------------------


endmodule

