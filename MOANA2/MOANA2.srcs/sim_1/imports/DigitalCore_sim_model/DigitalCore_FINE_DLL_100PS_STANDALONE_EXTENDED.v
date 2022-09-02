`timescale 1ns/1ps

module DigitalCore_FINE_DLL_100PS_STANDALONE_EXTENDED(I, S, FINE_OUT);
    
    input wire I;
    input wire [4:0] S;
    output wire FINE_OUT;

    reg out_delayed;
    assign FINE_OUT = out_delayed;
    
    always @(*) begin
        out_delayed <= #(0.4 + S*0.1) I;
    end

endmodule
