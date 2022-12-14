
// time scale
`timescale 1ns/1ps

module DigitalCore_PulseGenerator_negedge(
        
        //---------------------------------------------------------------------------
        //  ports
        //---------------------------------------------------------------------------
        rst,
        clk,
        in,
        out
        //---------------------------------------------------------------------------        

    );

    //-----------------------------------------------------------------------------------
    //   I/O Wires
    //-----------------------------------------------------------------------------------
    input wire                                  rst;
    input wire                                  clk;
    input wire                                  in;
    output wire                                 out;

	
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
    assign out = in_delayed[0] & ~in_delayed[1];

    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    Flops
    //-----------------------------------------------------------------------------------
    always @(negedge clk or posedge rst) begin
        if (rst) begin
            in_delayed[0] <= 1'b0;
            in_delayed[1] <= 1'b0;
        end else begin
            in_delayed[0] <= in;
            in_delayed[1] <= in_delayed[0];
        end
    end

endmodule

