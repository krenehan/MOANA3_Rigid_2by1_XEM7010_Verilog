
// time scale
`timescale 1ns/1ps

// no undeclared nets
//`default_nettype none

module PatternResetController(
        
        //---------------------------------------------------------------------------
        //  ports
        //---------------------------------------------------------------------------
        Clk,
        RstAsync,
        Measurement_Count,
	    PattResetExt,	// This forces block to issue "Reset" @posedge of PattResetExt
	    PattResetExtEnable,
        MeasPerPatt,
        MeasCountEnable,
        Max_Count_Reset,
        Max_Count_Reset_Pulse,
        Load,
        End_Pattern_Reset,
        Mask_Enable
        //---------------------------------------------------------------------------        

    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
	parameter MeasurementCounterWidth   = 	    15; // Width of measurement counter
    localparam DummyBits                =       MeasurementCounterWidth-1;

    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //   I/O Wires
    //-----------------------------------------------------------------------------------
    input wire                                  Clk;
    input wire                                  RstAsync;
    input wire                                  PattResetExt;
    input wire					                PattResetExtEnable; // Signal to bypass counter and activate "PattResetExt"
    input wire [MeasurementCounterWidth-1:0]    Measurement_Count;
    input wire [MeasurementCounterWidth-1:0]    MeasPerPatt;
    input wire                                  MeasCountEnable;
    output reg                                  Max_Count_Reset;
    output wire                                 Max_Count_Reset_Pulse;
    output wire                                 Load;
    output wire                                 End_Pattern_Reset;
    output reg                                  Mask_Enable;

	
    //-----------------------------------------------------------------------------------
    //  Genvars
    //-----------------------------------------------------------------------------------
    genvar i;
    //-----------------------------------------------------------------------------------
	
    //-----------------------------------------------------------------------------------
    //   Wires
    //-----------------------------------------------------------------------------------
    reg     [2:0]                                           Max_Count_Reset_CycleCounter;
    reg     [2:0]                                           Mask_Enable_CycleCounter;
    wire                                                    Mask_Enable_Pulse;
    wire                                                    Start_Reset_Process;
    reg                                                     Reset_Started;

    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //   Assigns
    //-----------------------------------------------------------------------------------
    assign Start_Reset_Process = PattResetExtEnable ? 
                                                    PattResetExt : 
                                                    ((Measurement_Count == (MeasPerPatt - { {DummyBits{1'b0}}, 1'b1}) ) & MeasCountEnable);

    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    Generate reset signals for end of pattern
    //-----------------------------------------------------------------------------------
	always @(posedge Clk or posedge RstAsync) begin 
        if (RstAsync) begin
            Max_Count_Reset <= 1'b0;
            Max_Count_Reset_CycleCounter <= 3'b0;
            Reset_Started <= 1'b0;
        end else begin
		    if (Start_Reset_Process & ~Reset_Started) begin
                Reset_Started <= 1'b1;
            	Max_Count_Reset <= 1'b1;
            	Max_Count_Reset_CycleCounter <= 3'b111;
		    end else if (Max_Count_Reset_CycleCounter[0]) begin
            	Max_Count_Reset_CycleCounter <= {1'b0, Max_Count_Reset_CycleCounter[2:1]};
            end else begin
                Max_Count_Reset <= 1'b0;
                if (~Start_Reset_Process) begin
                    Reset_Started <= 1'b0;
                end
            end
        end
	end

	always @(posedge Clk or posedge RstAsync) begin
        if (RstAsync) begin 
            Mask_Enable <= 1'b1;
            Mask_Enable_CycleCounter <= 3'b0;
        end else begin
		    if (Mask_Enable_Pulse) begin
                Mask_Enable <= 1'b0;
                Mask_Enable_CycleCounter <= 3'b111;
		    end else if (Mask_Enable_CycleCounter[0]) begin 
                Mask_Enable_CycleCounter <= {1'b0, Mask_Enable_CycleCounter[2:1]};
            end else begin
                Mask_Enable <= 1'b1;
            end
        end
	end
	
    PulseGenerator_negedge 
        Max_Count_Reset_PulseGenerator            
                                (
                                    .clk(Clk),
                                    .rst(RstAsync),
                                    .in(Max_Count_Reset),
                                    .out(Max_Count_Reset_Pulse)
                                );

    ClkCycleDelay_negedge   #           (
                                    .DelayCycles(3))
        Mask_EnableDelayCell    (
                                    .clk(Clk),
                                    .rst(RstAsync),
                                    .in(Max_Count_Reset_Pulse),
                                    .out(Mask_Enable_Pulse)
                                );

    ClkCycleDelay_negedge   #           (
                                    .DelayCycles(1))
        LoadDelayCell           (
                                    .rst(RstAsync),
                                    .clk(Clk),
                                    .in(Mask_Enable_Pulse),
                                    .out(Load)
                                );

    ClkCycleDelay_negedge   #           (
                                    .DelayCycles(1))
        EndPatternResetDelayCell (
                                    .rst(RstAsync),
                                    .clk(Clk),
                                    .in(Load),
                                    .out(End_Pattern_Reset)
                                );

    //-----------------------------------------------------------------------------------


endmodule

