`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:29:46 04/09/2021 
// Design Name: 
// Module Name:    emitter_controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module emitter_controller(

            // Chip clock and global reset
            rst,
            clk,
            
            // Information about pattern and measurement 
            measurement_count,
            pattern_count,
            
            // Emitter enable signals
            emitter_enable,
            
            // Debug
            pattern_emitter_packet,
            
            // Register bank containing emitter pattern information
            emitter_pattern_register_bank
    );
    
    //-----------------------------------------------------------------------------------
    //    Parameters
    //-----------------------------------------------------------------------------------
    parameter NumberOfChips =                       2;
    parameter OKWidth =                             16;
    parameter BufferSize =                           144; // Divisible by OKWidth, at least equal to Number * NumberOfChips;
    parameter BufferAddressBits =                    8; // Greater than or equal to clog2(BufferSize)

    
    //-----------------------------------------------------------------------------------
    //    IO
    //-----------------------------------------------------------------------------------
    input wire                                      clk;
    input wire                                      rst;
    input wire  [OKWidth-1:0]                       measurement_count;
    input wire  [OKWidth-1:0]                       pattern_count;
    input wire  [BufferSize-1:0]                     emitter_pattern_register_bank;
    output reg  [NumberOfChips-1:0]                 emitter_enable;


    //-----------------------------------------------------------------------------------
    //    Internal Wires and Registers
    //-----------------------------------------------------------------------------------
    wire                                            measurement_counter_zero;
    wire                                            emitter_enable_signal;
    wire                                            emitter_disable_signal;
    wire        [BufferAddressBits-1:0]              read_address;
    output wire        [NumberOfChips-1:0]                 pattern_emitter_packet;


    //-----------------------------------------------------------------------------------
    //    Assigns
	 //    Note that this code was adapated to work with 2 chips instead of 16. As a result, the buffer is sized for 16 chips, and the read address is incremented by 16 every pattern.
	 //    The only thing that's really different here is that only a 2-bit portion of the 16-bit value from the register bank is used when NumberOfChips=2.
    //-----------------------------------------------------------------------------------
    assign measurement_counter_zero = (measurement_count == 10);
    assign read_address = pattern_count[BufferAddressBits-1:0] * 16; // The read address determines where to look in the register bank
    assign pattern_emitter_packet = emitter_pattern_register_bank[read_address +: NumberOfChips]; // Values from the register bank are used for the emitter enable
    
    
    //-----------------------------------------------------------------------------------
    //    Genvar
    //-----------------------------------------------------------------------------------
    genvar i;
    
    
    //-----------------------------------------------------------------------------------
    //    Emitter enable logic
    //-----------------------------------------------------------------------------------
    // At beginning of pattern, measurement counter goes to zero
    // Use this as a trigger signal for enabling the next emitter
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            emitter_enable <= {NumberOfChips{1'b0}};
        end else if (emitter_enable_signal) begin
            emitter_enable <= pattern_emitter_packet;
        end else if (emitter_disable_signal) begin
            emitter_enable <= {NumberOfChips{1'b0}};
        end
    end


    // Create a pulsed enable signal when measurement counter goes to 0
    AfterPulseGenerator_negedge emitter_enable_pulse_unit (
                                    .rst(rst),
                                    .clk(clk),
                                    .in(measurement_counter_zero),
                                    .out(emitter_enable_signal)
    );
    
    
    // Create a disable signal to set emitter_enable low after 10 cycles
    ClkCycleDelay_negedge # (
                                    .Width(1), 
                                    .DelayCycles(10))
        emitter_disable_delay (
                                    .rst(rst),
                                    .clk(clk),
                                    .in(emitter_enable_signal),
                                    .out(emitter_disable_signal)
    );


endmodule
