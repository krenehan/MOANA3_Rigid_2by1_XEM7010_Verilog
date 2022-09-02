`timescale 1ns/1ps

module DigitalCore_ClockGate(

        clk,
        en,
        gated_clk

    );
    
    input wire en, clk;
    output wire gated_clk;
    wire clk_bar;
    reg Q;
    
    not (clk_bar, clk);
    and (gated_clk, Q, clk);
    always @(*) begin
        if (clk_bar) begin
            Q <= en;
        end
    end

endmodule
