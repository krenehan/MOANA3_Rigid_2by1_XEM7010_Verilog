
`timescale 1ns/1ps

// TODO Verify latency
`define Latency 0.600

module DigitalCore_VCSEL_PadDriver(START, STOP, VCSEL_OUT);

    parameter real LATENCY = `Latency;

    output wire VCSEL_OUT;
    input wire START, STOP;

    wire STARTN_delayed, STOP_delayed;
	
    assign #(LATENCY) STARTN_delayed = ~START;
    assign #(LATENCY) STOP_delayed = STOP;

    assign VCSEL_OUT = ~(STARTN_delayed | STOP_delayed);

endmodule
