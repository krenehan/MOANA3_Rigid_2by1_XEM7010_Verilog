module dynamic_packet_module 
# 	( 	
		parameter OKWIDTH = 16,
		parameter NUMBER_OF_CHIPS = 16, 
		parameter DIVIDER_BITS = 2
	)
	(
		input 	wire						rst,
		input 	wire 						clk,
		input	wire						ti_clk,
		
		input 	wire						dynamic_mode_enabled,
		input 	wire						pipe_in_complete,
		
		input 	wire						pipe_in_write,
		input 	wire [OKWIDTH-1:0] 			pipe_in_16b,
		
		input	wire						shift_trigger,
		
		output 	reg 						shift_clk,
		output 	wire [NUMBER_OF_CHIPS-1:0] 	shift_data
	);
	
	
	//------------------------------------------------------------------------
	// Local parameters
	//------------------------------------------------------------------------
	localparam PACKET_BITS = 5'd17;
	
	//------------------------------------------------------------------------
	// Internal Wires
	//------------------------------------------------------------------------
	reg [15:0] shift_data_int;
	wire input_fifo_full;
	wire input_fifo_overflow;
	wire [OKWIDTH-1:0] pipe_in_16b_shuffled;
	wire [OKWIDTH-1:0] pattern_fifo_din;
	wire [15:0] pattern_data_16b;
	wire input_fifo_empty;
	wire input_fifo_valid;
	wire [15:0] input_fifo_dout_16b;
	wire pattern_fifo_full;
	wire pattern_fifo_empty;
	wire pattern_fifo_valid;
	wire pattern_fifo_overflow;
	wire pattern_fifo_wr_en;
	reg pattern_data_writeback;
	reg [DIVIDER_BITS-1:0] cycle_count;
	wire begin_shift;
	reg shift_active;
	reg shift_active_del;
	wire data_phase; 
	wire shift_phase;
	wire shift_done;
	reg [4:0] shift_pos;
	reg increment_shift_position;
	reg shift_counter_reset;
	wire [12:0] pattern_fifo_data_count;
	
	//------------------------------------------------------------------------
	// Assignments
	//------------------------------------------------------------------------
	
	// Begin shift only goes high if shift_trigger is asserted while dynamic mode is enabled
	assign begin_shift = dynamic_mode_enabled & shift_trigger;
	
	// Shift phase occurs a cycle after cycle count is 0
	assign shift_phase = ~(|cycle_count);
	
	// Data phase occurs when cycle_count is half of flip value
	assign data_phase = cycle_count[DIVIDER_BITS-1] & ~(|cycle_count[DIVIDER_BITS-2:0]);
	
	// Data input to pattern FIFO is initially from previous FIFO
	// Once initial pipe in is complete, input is changed to come from output of pattern FIFO for writeback operation
	assign pattern_fifo_din = pipe_in_complete ? pattern_data_16b : input_fifo_dout_16b;
	
	// Shift data internal is always 16b, but shift_data output is selected to match NUMBER_OF_CHIPS
	assign shift_data = shift_data_int[NUMBER_OF_CHIPS-1:0];
	
	// Shift done signal
	assign shift_done = shift_pos == PACKET_BITS;
	
	// Write enable input to pattern FIFO is initially from previous FIFO
	// Once initial pipe in is complete, input is changed to come from module logic
	assign pattern_fifo_wr_en = pipe_in_complete ? pattern_data_writeback : input_fifo_valid;


	//-----------------------------------------------------------------------------------
	//    Cycle counter for clk to shift_clk division
	//-----------------------------------------------------------------------------------
	always @(posedge clk) if (rst) cycle_count <= 0; else cycle_count <= cycle_count + 1;
	
	
	//-----------------------------------------------------------------------------------
	//    Shuffle bytes coming from pipeIn endpoint
	//-----------------------------------------------------------------------------------
	assign pipe_in_16b_shuffled[7:0] = pipe_in_16b[15:8];
	assign pipe_in_16b_shuffled[15:8] = pipe_in_16b[7:0];
	

	//------------------------------------------------------------------------
	// Input FIFO 16b -> 16b
	// Small FIFO needed only for synchronization
	//------------------------------------------------------------------------
	fifo_W16_R16 u_input_fifo (
		.rst				    (rst),
		
		.wr_clk					(ti_clk),
		.wr_en				    (pipe_in_write),
		.din				    (pipe_in_16b_shuffled),
		.full				    (input_fifo_full),
		.overflow				(input_fifo_overflow),
		
		.rd_clk					(clk),
		.rd_en				    (~pattern_fifo_full),
		.dout				    (input_fifo_dout_16b),
		.empty				    (input_fifo_empty),
		.valid				    (input_fifo_valid)
	);
	
	
	//------------------------------------------------------------------------
	// Pattern FIFO 16b -> 16b FWFT
	// Large FIFO to store 32768b
	// Must be common clock domain to support data loop between input and output
	//------------------------------------------------------------------------
	fifo_W16_R16_FWFT u_pattern_fifo (
		.rst				    (rst),
		.clk					(clk),
		
		.wr_en				    (pattern_fifo_wr_en),
		.din				    (pattern_fifo_din),
		.full				    (pattern_fifo_full),
		.overflow				(pattern_fifo_overflow),
		
		.rd_en				    (pattern_data_writeback),
		.dout				    (pattern_data_16b),
		.empty				    (pattern_fifo_empty),
		.valid				    (pattern_fifo_valid),
		.data_count				(pattern_fifo_data_count) // [12:0]
	);
	
	
	//------------------------------------------------------------------------
	// Shift active logic
	//------------------------------------------------------------------------
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			shift_active <= 1'b0;
			shift_counter_reset <= 1'b0;
		end else if (begin_shift) begin
			shift_active <= 1'b1;
		end else if (shift_done) begin
			shift_active <= 1'b0;
			shift_counter_reset <= 1'b1;
		end else if (shift_counter_reset) begin
			shift_counter_reset <= 1'b0;
		end
	end
	
	
	//------------------------------------------------------------------------
	// Shift active delayed logic
	//------------------------------------------------------------------------
	always @(posedge clk or posedge rst) 
		if (rst) shift_active_del <= 1'b0;
		else shift_active_del <= shift_active;
	
	
	//------------------------------------------------------------------------
	// Shift position counter
	// Counts up to 17
	//------------------------------------------------------------------------
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			shift_pos <= 0;
		end else if (increment_shift_position) begin
			shift_pos <= shift_pos + 1;
		end else if (shift_counter_reset) begin
			shift_pos <= 0;
		end
	end
	
	
	//------------------------------------------------------------------------
	// Shift logic
	//------------------------------------------------------------------------
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			shift_clk <= 1'b0;
			increment_shift_position <= 1'b0;
			pattern_data_writeback <= 1'b0;
			shift_data_int <= 16'b0;
		end else begin
		
			// Defaults
			pattern_data_writeback <= 1'b0;
			increment_shift_position <= 1'b0;
			
			// Default for shift clock
			if (~shift_active_del) shift_clk <= 1'b0;
		
			// Positive clock cycle operations
			if (shift_phase & shift_active_del) begin
				
				// Shift clock high
				shift_clk <= 1'b1;
			
			// Negative clock cycle operations
			end else if (data_phase & shift_active) begin
			
				// Shift clock low
				shift_clk <= 1'b0;
			
				// Update shift data
				shift_data_int <= pattern_data_16b;
				
				// Increment shift position
				increment_shift_position <= 1'b1;
				
				// Move FIFO to next 16b
				pattern_data_writeback <= 1'b1;
				
				
			end
		end
		
	end
	
	

endmodule
