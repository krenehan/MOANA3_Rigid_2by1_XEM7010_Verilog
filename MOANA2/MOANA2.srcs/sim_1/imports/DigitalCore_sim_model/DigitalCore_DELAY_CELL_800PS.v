`timescale 1ns/1ps


module DigitalCore_DELAY_CELL_800PS (I, Z);

    input wire I;
    output wire Z;
    reg I_delayed;
    
    always @(*) begin
        I_delayed <= #(0.4) I;
    end

    assign Z = I_delayed;
endmodule

