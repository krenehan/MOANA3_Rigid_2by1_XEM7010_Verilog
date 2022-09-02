`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2022 01:21:01 PM
// Design Name: 
// Module Name: frame_arbiter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module frame_arbiter
	#(
		parameter 	NUMBER_OF_CHIPS 			= 	2,
		parameter 	OKWIDTH						= 	16,
		parameter	PATTERN_PIPE_BUFFER_SIZE 	= 	32,
		parameter	PATTERN_PIPE_ADDR_BITS 		= 	5
	)
	(
		input	wire										rst,
		input 	wire										clk,
		input	wire										tx_clk,
		input	wire										scan_done,
		output 	reg											capture_idle,
		input 	wire										frame_data_sent,
		output 	reg 										frame_data_received,
		input 	wire										capture_start,
		output 	reg											capture_running,
		output 	wire										capture_complete,
		output 	wire										capture_complete_delayed,
		output 	reg											capture_done,
		input 	wire										data_stream,
		output 	wire										read_trigger,
		input 	wire										read_ack_trigger,
		output 	wire											block_next_streamout,
		output 	reg											read_ack_trigger_hold, 
		input 	wire	[OKWIDTH-1:0]						number_of_frames,
		input	wire	[OKWIDTH-1:0] 						patterns_per_frame,
		input	wire	[OKWIDTH*2-1:0]						measurements_per_pattern,
		input	wire	[NUMBER_OF_CHIPS-1:0]				pad_captured,
		input	wire	[NUMBER_OF_CHIPS-1:0]				pad_captured_mask,
		input 	wire	[NUMBER_OF_CHIPS-1:0]				blocking,
		output	wire	[NUMBER_OF_CHIPS-1:0] 				emitter_enable,
		output	reg											refclk_enable,
		output 	wire										tx_refclk_enable,
		input	wire	[PATTERN_PIPE_BUFFER_SIZE-1:0] 		emitter_pattern_register_bank,
		output 	wire 	[NUMBER_OF_CHIPS-1:0] 				pattern_emitter_packet,
		output 	wire	[23:0]						measurement_count,
		output	wire	[OKWIDTH-1:0]						pattern_count,
		output	wire	[OKWIDTH-1:0]						frame_count,
		output	wire										frame_complete_pulse,
		output	wire										frame_complete,
		output 	reg	[9:0] 							state,
		output 	reg	[9:0]								next_state
    
    );
    

    //-----------------------------------------------------------------------------------
    // FSM States
    //-----------------------------------------------------------------------------------
	localparam	IDLE 							= 10'h01;
	localparam  	HANDSHAKE  			= 10'h02;
	localparam  	RUN_CAPTURE          = 10'h04;
	localparam  	FINISH_DATATX    		= 10'h08;
	localparam  	FINISH_CAPTURE 		= 10'h10;
	localparam  	RESET               		= 10'h20;
	localparam 	STREAM_RESUME  	= 10'h40;
	
	
    //-----------------------------------------------------------------------------------
    // IO
    //-----------------------------------------------------------------------------------
    
    reg				block_next_streamout_flag;
    reg				read_ack_trigger_hold_clear;
    
	wire			logic_reset;
	reg				capture_reset;
	
	wire			measurement_counter_reset;
        
    reg				data_stream_active;
    reg				data_stream_delay_start;
    wire			data_stream_delay_finished_alert;
    
    wire			pad_captured_master;
    wire			blocking_master;
    wire			pad_captured_sync;
    wire			pad_captured_pulse;
	wire			blocking_sync;
	wire			pc_ready_for_next_capture;

    

    //-----------------------------------------------------------------------------------
    // Assign statements
    //-----------------------------------------------------------------------------------
    assign logic_reset = rst | capture_reset;
    assign read_trigger = capture_complete;
    assign block_next_streamout = block_next_streamout_flag;
    assign pad_captured_master = |(pad_captured & pad_captured_mask);
    assign blocking_master = |(blocking & pad_captured_mask);
    assign pc_ready_for_next_capture = ~(frame_data_sent | capture_start);
    
    
    
    
    //-----------------------------------------------------------------------------------
    //    State Machine
    //-----------------------------------------------------------------------------------
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end
    
	always @(*) begin
        
        // Default to no movement
        next_state <= state;
		  
		// Default signal states
		capture_idle <= 1'b0;
		frame_data_received <= 1'b0;
		capture_running <= 1'b0;
		refclk_enable <= 1'b0;
		capture_reset <= 1'b0;
		capture_done <= 1'b0;
		block_next_streamout_flag <= 1'b0;
		read_ack_trigger_hold_clear <= 1'b0;
        
        // State machine
        case (state)
        
        	// In the IDLE state, the frame arbiter does nothing but wait for input from the PC
        	// When the PC assertes that frame data has been sent, the controller moves to the WAIT state
            IDLE: begin
                // Outputs 
                capture_idle <= 1'b1;
                
                // Next state
                if (frame_data_sent) begin 
                    next_state <= HANDSHAKE;
                end
            end

            // In the HANDSHAKE state, the frame arbiter responds to frame_data_sent by asserting frame_data_received
            // The frame arbiter then waits until it receives a start signal from the PC
            // If the frame arbiter is being used for segmented histogram capture, the PC asserts capture_start and the frame arbiter moves to the RUN state
            // If the frame arbiter is being used for continuous histogram capture, the PC asserts data_stream_active and the frame arbiter moves to the RUN state
            HANDSHAKE: begin
                // Outputs
                frame_data_received <= 1'b1;
                
                // Next state
                if (capture_start | data_stream_active) begin
                    next_state <= RUN_CAPTURE; 
                end
            end
            
            // In the RUN state, the frame arbiter allows the chip to capture histograms by leaving refclk_enable high
            // The frame arbiter asserts capture running to indicate to the PC that the capture has been started succesfully
            // Outside of the state machine, the logic below monitors the number of histograms collected by the chip
            // When the correct number of frames and patterns have been collected, the capture_complete signal goes high
            // When the capture is complete, the frame arbiter moves to the FINISH_DATATX state
            RUN_CAPTURE: begin
                // Outputs
                capture_running <= 1'b1;
                refclk_enable <= 1'b1;
                
                // Next state
                if (capture_complete) begin
                    next_state <= FINISH_DATATX;
                end
            end
            
			// In the FINISH_DATATX state, the frame arbiter finishes up the histogram collection process
			// To retrieve the data from the final histogram of the capture, refclk_enable must be held high for one more histogram while the DataTx block streams out data
			// The histogram that is captured by the chip in this time is not relevant to the capture, so the frame arbiter will indicate to the TxFlagOut module that the next histogram streamout should be blocked
			// Once the pad has been captured for the final histogram streamout, the frame arbiter moves to the FINISH_CAPTURE state
			FINISH_DATATX: begin
				// Outputs
				capture_running <= 1'b1;
				refclk_enable <= 1'b1;
			 	block_next_streamout_flag <= 1'b1;
				 
				// Next state
				if (pad_captured_pulse) begin
					next_state <= FINISH_CAPTURE;
				end
				
			end
			
			// In the FINISH_CAPTURE state, the frame arbiter finishes running the final DataTx
			// This state plays an important role in ensuring that the DataTx process from the chip is given time to finish before the clock is gated to the chip
			// This prevents a situation where the the clock is gated while TxDataOut from the chip is high, which would cause the TxFlagOut to be asserted erroneously and fill the FIFO while the frame arbiter is idle
			// Once the TxDataOut module asserts that it has finished blocking the current histogram, we know that the Data Tx process from the chip is done, in which case it is safe to gate the clock to the chip, and the frame arbiter moves to the RESET state
			FINISH_CAPTURE: begin
				// Outputs
				capture_running <= 1'b1;
				refclk_enable <= 1'b1;
				 
				// Next state
				if (~blocking_sync) begin
					next_state <= RESET;
				end
				
			end
            
            // In the RESET state, the frame arbiter resets the control logic so that is in the correct state for the next run
            // If this is a segemented capture, the frame arbiter checks to make sure the PC is ready to start another capture by ensuring that frame_data_sent and capture_start have been deasserted from the previous HANDSHAKE state
            // If the above is true, the frame arbiter moves to the IDLE state and waits for the PC to start another capture
            // If this is a continuous capture, the frame arbiter checks that the PC has initiated a read from the FIFOs by checking that read_ack_trigger is asserted
            // If the above is true, the frame arbiter moves to the STREAM_RESUME state and automatically begins the next capture without any further input from the PC
            RESET: begin
                // Outputs
                capture_reset <= 1'b1;
                capture_done <= 1'b1;
			 	block_next_streamout_flag <= 1'b1;
            
                // Next state
				if (data_stream_active) begin
					if (read_ack_trigger_hold) begin
						next_state <= STREAM_RESUME;
					end
                end else if (pc_ready_for_next_capture)  begin
                    next_state <= IDLE;
                end
            end
            
            // In the STREAM_RESUME state, the frame arbiter clears the read_ack_trigger_hold by asserting read_ack_trigger_hold_clear
            // The frame arbiter then moves back to the RUN state automatically
            STREAM_RESUME: begin
                // Outputs
					 read_ack_trigger_hold_clear <= 1'b1;

                // Next state
					 next_state <= RUN_CAPTURE;

            end
            
            
            // Default state, which should never be entered
            default: begin
				// Outputs
				capture_reset <= 1'b1;
				capture_done <= 1'b1;
				block_next_streamout_flag <= 1'b1;
					 
				// Next state
				next_state <= IDLE;
            end
            
        endcase
	end
    
    
    //-----------------------------------------------------------------------------------
    // This block synchronizes important signals from TxRefClk to RefClk domains
    // pad_captured signal originates from the TxFlagOut module
    // When the TxFlagOut module sees the data line go from 0->1, it indicates that the padding bit has been captured and asserts pad_captured
    // pad_captured essentially indicates that a histogram is being transferred from the chip to the FPGA
    // Below, pad_sync_inst takes the pad_captured signal, which is in the txrefclk domain, and synchronizes to refclk domain
    //
    // The blocking signal  originates from the TxFlagOut module
    // When the TxFlagOut module receives block_next_streamout from the frame_arbiter, it responds by asserting blocking during the next histogram streamout
    // The blocking signal essentially indicates whether or not the histogram is going to end up making it to the FIFOs
    // The blocking signal is also synchronized from the txrefclk domain to the refclk domain
    //-----------------------------------------------------------------------------------
    synchronizer			#		(
    								.NumSignals(1),
    								.Stages(2))
    		pad_sync_inst		(
    								.rst(rst),
    								.src_clk(tx_clk),
    								.dest_clk(clk),
    								.src_sig(pad_captured_master), 
    								.dest_sig(pad_captured_sync)
    );
    
    
    synchronizer			#		(
    								.NumSignals(1),
    								.Stages(2))
    		blocking_sync_inst		(
    								.rst(rst),
    								.src_clk(tx_clk),
    								.dest_clk(clk),
    								.src_sig(blocking_master), 
    								.dest_sig(blocking_sync)
    );
    
    
    
    //-----------------------------------------------------------------------------------
    // This block translates the pad_captured signal to a single pulse in the refclk domain
    // pad_captured is a multi-cycle pulse, but we use it to increment the pattern counter
    // To avoid incrementing the pattern counter more than once per pad_captured signal, this block translates it to a single pulse in the refclk domain
    //-----------------------------------------------------------------------------------
    PulseGenerator 
    		pad_pulsegen_inst 	(
    								.rst(logic_reset),
    								.clk(clk),
    								.in(pad_captured_sync),
    								.out(pad_captured_pulse)
    );
    
    
    //-----------------------------------------------------------------------------------
    // Pattern Counter
    // When pad_captured_pulse is asserted while blocking is low, it means that we've completed a pattern
    // This increments the pattern counter
    //-----------------------------------------------------------------------------------
	capped_sync_counter		#		(
									.Width(OKWIDTH))
			PatternCounter		(
									.reset(logic_reset),
									.clk(clk),
									.enable(pad_captured_pulse & ~blocking_sync),
                                    .cap(patterns_per_frame - 16'b1),
									.count(pattern_count)
								);
	
	// Frame is complete when pattern count reaches the patterns_per_frame value
	assign frame_complete = (pattern_count == patterns_per_frame - 16'b1) && |measurement_count;
    

    //-----------------------------------------------------------------------------------
    // Afterpulse generator
    // When frame is complete, a pulse is generated
    //-----------------------------------------------------------------------------------
    AfterPulseGenerator frame_pulse_unit (
                                    .rst(logic_reset),
                                    .clk(clk),
                                    .in(frame_complete),
                                    .out(frame_complete_pulse)
    );
    	
    
    //-----------------------------------------------------------------------------------
    // Frame counter
    // Frame counter increments at the conclusion of the frame when frame_complete_pulse is asserted
    //-----------------------------------------------------------------------------------
	sync_counter_negedge	#   (   .Width      (OKWIDTH))
			FrameCounter		(
									.reset      (logic_reset),
									.clk        (clk),
									.enable     (frame_complete_pulse & ~blocking_sync),
									.count      (frame_count)
								);
    
    // Capture is complete when frame count reaches number_of_frames value
    // When the capture is complete, the state machine will move from RUN to DONE
    assign capture_complete = (frame_count == number_of_frames);
    
    
    //-----------------------------------------------------------------------------------
    // Measurement counter
    // This counter simply acts to count clock cycles within the pattern
    // It is not necessarily synchronized with the chip's measurement counter
    //-----------------------------------------------------------------------------------
	sync_counter		#		(
									.Width(24))
			MeasurementCounter	(
									.reset(measurement_counter_reset),
									.clk(clk),
									.enable(refclk_enable),
									.count(measurement_count)
								);

	assign measurement_counter_reset = logic_reset | pad_captured_pulse;
	
	
	    synchronizer			#		(
    								.NumSignals(1),
    								.Stages(2))
    		tx_sync_inst		(
    								.rst(rst),
    								.src_clk(clk),
    								.dest_clk(tx_clk),
    								.src_sig(~capture_idle), 
    								.dest_sig(tx_refclk_enable)
    );
	
    
    //-----------------------------------------------------------------------------------
    // Emitter controller
    //-----------------------------------------------------------------------------------
//    emitter_controller      #   (
//                                    .OKWidth							(OKWIDTH),
//                                    .NumberOfChips						(NUMBER_OF_CHIPS),
//                                    .BufferSize							(PATTERN_PIPE_BUFFER_SIZE),
//                                    .BufferAddressBits					(PATTERN_PIPE_ADDR_BITS))
//                            ec  (
//                                    .rst                                (logic_reset),
//                                    .clk                                (clk),
//                                    .measurement_count                  (measurement_count),
//                                    .pattern_count                      (pattern_count),
//                                    .emitter_enable                     (emitter_enable),
//                                    .pattern_emitter_packet             (pattern_emitter_packet),
//                                    .emitter_pattern_register_bank      (emitter_pattern_register_bank)
//	);
    
    
    //-----------------------------------------------------------------------------------
    // Data stream delay handler
    //-----------------------------------------------------------------------------------
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_stream_active <= 1'b0;
            data_stream_delay_start <= 1'b0;
        end else if (data_stream) begin
            if (~data_stream_active) begin
                data_stream_delay_start <= 1'b1;
                if (data_stream_delay_finished_alert) begin
                    data_stream_delay_start <= 1'b0;
                    data_stream_active <= 1'b1;
                end
            end
        end else begin
            data_stream_delay_start <= 1'b0;
            data_stream_active <= 1'b0;
        end
    end
    
    
    //-----------------------------------------------------------------------------------
	// Counter to delay the start of the stream process
    // 5,000,000 cycle delay takes 100 ms at 50 MHz
    //-----------------------------------------------------------------------------------
    capped_sync_counter     #   (
                                    .Width              (23))
        stream_delay_counter    (
                                    .reset              (rst),
                                    .clk                (clk),
                                    .enable             (data_stream_delay_start),
                                    .cap                (23'd5000000),
                                    .alert              (data_stream_delay_finished_alert)
	);
	
	
    //-----------------------------------------------------------------------------------
    // Read acknowledge handler
    //-----------------------------------------------------------------------------------
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			read_ack_trigger_hold <= 1'b0;
		end else if (read_ack_trigger) begin
			read_ack_trigger_hold <= 1'b1;
		end else if (read_ack_trigger_hold_clear) begin
			read_ack_trigger_hold <= 1'b0;
		end
	end
    
    
endmodule
