
// time scale
`timescale 1ns/1ps

module DigitalCore_PatternResetController(
        
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
        dynamic_histogram_reset_trigger,
        dynamic_histogram_reset_active,
        End_Pattern_Reset,
        Mask_Enable,
        DataTxLoadDone
        //---------------------------------------------------------------------------        

    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
	parameter MeasurementCounterWidth   = 	    15; // Width of measurement counter
	parameter PipelineStages            =       3; // Number of cycles in the pipeline
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
    input wire                                  dynamic_histogram_reset_trigger;
    output reg                                  dynamic_histogram_reset_active;
    output wire                                 End_Pattern_Reset;
    output reg                                  Mask_Enable;
    input wire                                  DataTxLoadDone;

	
    //-----------------------------------------------------------------------------------
    //  Genvars
    //-----------------------------------------------------------------------------------
    genvar i;
    //-----------------------------------------------------------------------------------
	
    //-----------------------------------------------------------------------------------
    //   Wires
    //-----------------------------------------------------------------------------------
    wire                                                    Mask_Enable_Pulse;
    wire                                                    Start_Reset_Process;
    reg                                                     Reset_Started;
    wire                                                    Internal_Reset;
    wire                                                    Measurement_Counter_Finished;
    wire                                                    end_pattern_trigger;
    wire                                                    accumulators_ready;
    wire                                                    loading_complete;
    wire                                                    loading_complete_flag;
    wire                                                    clear_flags;
    wire                                                    dead_cycle;
    wire                                                    mask_enable_trigger;

    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //   Assigns
    //-----------------------------------------------------------------------------------
    assign Start_Reset_Process = PattResetExtEnable ? PattResetExt : Internal_Reset;
    assign Internal_Reset = Measurement_Counter_Finished | dynamic_histogram_reset_trigger;
    assign Measurement_Counter_Finished = ( Measurement_Count == (MeasPerPatt - { {DummyBits{1'b0}}, 1'b1}) ) & MeasCountEnable;
    assign clear_flags = accumulators_ready;

    //-----------------------------------------------------------------------------------
    
    // Dynamic reset status flag
    always @(posedge Clk or posedge RstAsync) begin
        if (RstAsync) begin
            dynamic_histogram_reset_active <= 1'b0;
        end else if (dynamic_histogram_reset_trigger) begin
            dynamic_histogram_reset_active <= 1'b1;
        end else if (clear_flags) begin
            dynamic_histogram_reset_active <= 1'b0;
        end else begin
            dynamic_histogram_reset_active <= dynamic_histogram_reset_active;
        end
    end
    
    // loading_complete status flag to catch 1-cycle DataTxLoadDone and extend it through the reset process
    //always @(negedge Clk or posedge RstAsync) begin
    //    if (RstAsync) begin
    //        loading_complete_flag <= 1'b0;
    //    end else if (loading_complete) begin
    //        loading_complete_flag <= 1'b1;
    //    end else if (clear_flags) begin
    //        loading_complete_flag <= 1'b0;
    //    end else begin
    //        loading_complete_flag <= loading_complete_flag;
    //    end
    //end
    
    

    //-----------------------------------------------------------------------------------
    //    Generate reset signals for end of pattern
    //-----------------------------------------------------------------------------------
    
    // The reset mechanism is triggered by either the dynamic histogram reset trigger, or by the measurement counter reaching its target value
    // The counter is disabled immediately, because the next few cycles are going to be wasted doing some bookkeeping before streamout
    // If this is a dynamic reset, the counter will be re-enabled after 3 wasted cycles
    // If this is a histogram streamout and reset, the counter will be re-enabled 3 wasted cycles after we've confirmed that data has been loaded
	always @(posedge Clk or posedge RstAsync) begin 
        if (RstAsync) begin
            Max_Count_Reset <= 1'b0;
            Reset_Started <= 1'b0;
            
        end else begin
        
            // Begin the reset process when we see Start_Reset_Process go high 
		    if (Start_Reset_Process & ~Reset_Started) begin
                Reset_Started <= 1'b1;
            	Max_Count_Reset <= 1'b1;
                
            // Wait for the loading to finish
            // Once loading has finished, the accumulators are ready to go N cycles later
            // Given the N cycle pipeline latency, this means the measurement counter should come back immediately 
            // This ensures data will be ready right when the accumulators are ready again
            end else if (loading_complete_flag) begin
                	
                // If the max count reset bin is empty, we have finished max_count_reset
                Max_Count_Reset <= 1'b0;
                Reset_Started <= 1'b0;
                
            end
        end
	end

    // After the MeasurementCounter reaches its maximum value, the AccumulatorBank needs to be disabled during the 3 dead cycles
    // Mask_Enable_Pulse is a delayed version of Max_Count_Reset that accounts for the N-cycle pipeline delay between the counter reaching
    // the target value and the point at which the data from the last cycle has made it to the AccumulatorBank
	always @(negedge Clk or posedge RstAsync) begin
        if (RstAsync) begin 
            Mask_Enable <= 1'b1;
        end else begin
	        if (Mask_Enable_Pulse) begin
                Mask_Enable <= 1'b0;
            end else if (accumulators_ready) begin
                Mask_Enable <= 1'b1;
            end else begin
                Mask_Enable <= Mask_Enable;
            end
        end
	end
	
	// Translate Max Count Reset to negative edge of clock
    DigitalCore_PulseGenerator_negedge 
        Max_Count_Reset_PulseGenerator            
                                (
                                    .clk(Clk),
                                    .rst(RstAsync),
                                    .in(Max_Count_Reset),
                                    .out(Max_Count_Reset_Pulse)
                                );
                                
    // Mask the clock of the accumulators on the negative edge just before the Nth cycle begins
    DigitalCore_ClkCycleDelay_negedge   #           (
                                    .DelayCycles(PipelineStages-1))
        MaskEnableTriggerDelayCell (
                                    .clk(Clk),
                                    .rst(RstAsync),
                                    .in(Max_Count_Reset_Pulse),
                                    .out(mask_enable_trigger)
                                );
                                

    // Given that the pipeline is N cycles, disabling the counter now means the accumulators should be disabled N cycles in the future  
    DigitalCore_ClkCycleDelay_negedge   #           (
                                    .DelayCycles(PipelineStages))
        Mask_EnableDelayCell    (
                                    .clk(Clk),
                                    .rst(RstAsync),
                                    .in(Max_Count_Reset_Pulse),
                                    .out(Mask_Enable_Pulse)
                                );
                                

    // First cycle of accumulators being disabled is when we pulse the load signal
    // This transfers data from the accumulatorbank to the DataTx module
    DigitalCore_ClkCycleDelay_negedge   #   (
                                    .DelayCycles(1))
        LoadDelayCell           (
                                    .rst(RstAsync),
                                    .clk(Clk),
                                    .in(Mask_Enable_Pulse),
                                    .out(Load)
                                );


    // The 
    DigitalCore_ClkCycleDelay_negedge   #           (
                                    .DelayCycles(1))
        LoadFlagDelayCell       (
                                    .rst(RstAsync),
                                    .clk(Clk),
                                    .in(loading_complete),
                                    .out(loading_complete_flag)
                                );
                                
    assign loading_complete = dynamic_histogram_reset_active ? Load : DataTxLoadDone;
    
    
    // Second cycle of accumulators being disabled is when we reset them, which ensures that they are ready for a new histogram
    // If this is a dynamic reset, we aren't going to initiate a Load process, so we won't get a DataTxLoadDone signal back, so we can just move on
    // If this was a histogram streamout and reset, we need to wait until the DataTxLoadDone signal comes back before we move on
    DigitalCore_ClkCycleDelay_negedge   #           (
                                    .DelayCycles(1))
        EndPatternResetDelayCell (
                                    .rst(RstAsync),
                                    .clk(Clk),
                                    .in(loading_complete_flag),
                                    .out(End_Pattern_Reset)
                                );
                                
                                
    // Third dead cycle is when we reset the accumulators
    DigitalCore_ClkCycleDelay_negedge   #           (
                                    .DelayCycles(1))
        DeadCycleDelayCell      (
                                    .rst(RstAsync),
                                    .clk(Clk),
                                    .in(End_Pattern_Reset),
                                    .out(accumulators_ready)
                                );
                                
                                
    // After the load signal, the measurement counter needs to be brought back 3 cycles before the accumulators are ready
    // This ensures that data from the TDCs reaches the accumulators as soon as they are ready
    // We need at least 3 cycles between the loading_complete signal and accumulator ready signal, so we introduce this dead cycle
    //ClkCycleDelay_negedge   #           (
    //                                .DelayCycles(1))
    //    AccsReadyDelayCell      (
    //                                .rst(RstAsync),
    //                                .clk(Clk),
    //                                .in(dead_cycle),
    //                                .out(accumulators_ready)
    //                            );

    //-----------------------------------------------------------------------------------


endmodule

