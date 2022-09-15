`timescale 1ns/1ps

module mem_arbiter_safety 
#	(
		parameter OKWIDTH			= 16,
		parameter ADDR_WIDTH 		= 29
	)
	(
		input 	wire 						reset,
		input 	wire 						clk,
		input 	wire	[31:0] 				state,
		input 	wire 	[ADDR_WIDTH-1:0] 	wr_addr,
		input 	wire 	[ADDR_WIDTH-1:0] 	rd_addr,
		
		output 	reg  						underflow,
		output 	reg  						overflow, 
		output 	reg 	[OKWIDTH-1:0] 		error, 
		output 	reg 	[OKWIDTH-1:0] 		first_error
		
	);
	
	//------------------------------------------------------------------------
	// Parameters
	//------------------------------------------------------------------------

	// States (should match state definitions in mem_arbiter)
	localparam S_IDLE    	= 0,
	           S_CALIB_WAIT = 1,
			   S_WRITE_0 	= 10,
			   S_WRITE_1 	= 11,
			   S_WRITE_2 	= 12,
			   S_WRITE_3	= 13,
			   S_READ_0  	= 20,
			   S_READ_1  	= 21,
			   S_READ_2  	= 22;
	
	// Error codes		   
	localparam 	E_NONE					= 16'd0,
				E_UNDERFLOW				= 16'd1,
				E_OVERFLOW				= 16'd2;
				
				
	//------------------------------------------------------------------------
	// Internal wires and registers
	//------------------------------------------------------------------------
	reg rd_addr_msb_prev;
	reg wr_addr_msb_prev;
	reg first_write_initiated;
	reg first_read_initiated;
	reg wr_addr_flipped;
	reg rd_addr_flipped;
	wire rd_addr_should_be_higher_than_wr_addr;
	reg first_error_detected;
	wire [2:0] flip_cnt;
	wire flip_cnt_empty;
	
	
	//------------------------------------------------------------------------
	// Stores past value of read address and write address MSB for overflow detection
	//------------------------------------------------------------------------
	always @(posedge clk) rd_addr_msb_prev <= rd_addr[28];
	always @(posedge clk) wr_addr_msb_prev <= wr_addr[28];
			   
			   
	//------------------------------------------------------------------------
	// Keep track of when write operations have started
	// Set once after reset
	//------------------------------------------------------------------------
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			first_write_initiated <= 1'b0;
		end else begin
			first_write_initiated <= first_write_initiated;
			if (state == S_WRITE_2) first_write_initiated <= 1'b1;
		end
	end
	

	//------------------------------------------------------------------------
	// Keep track of when read operations have started
	// Set once after reset
	//------------------------------------------------------------------------
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			first_read_initiated <= 1'b0;
		end else begin
			first_read_initiated <= first_read_initiated;
			if (state == S_READ_1) first_read_initiated <= 1'b1;
		end
	end
	
	
	//------------------------------------------------------------------------
	// Determines when write address has flipped back to 0
	// By definition, this signal will only persist for a single cycle
	//------------------------------------------------------------------------
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			wr_addr_flipped <= 1'b0;
		end else if (first_write_initiated) begin
			if (wr_addr_msb_prev & ~wr_addr[28]) begin
				wr_addr_flipped <= 1'b1;
			end else begin
				wr_addr_flipped <= 1'b0;
			end
		end
	end
	
	
	//------------------------------------------------------------------------
	// Determines when read address has flipped back to 0
	// By definition, this signal will only persist for a single cycle
	//------------------------------------------------------------------------
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			rd_addr_flipped <= 1'b0;
		end else if (first_read_initiated) begin
			if (rd_addr_msb_prev & ~rd_addr[28]) begin
				rd_addr_flipped <= 1'b1;
			end else begin
				rd_addr_flipped <= 1'b0;
			end
		end
	end
	
	
	//------------------------------------------------------------------------
	// Flip Counter
	// Write address flip will increment the counter to 1
	// Read address flip will decrement the counter back to 0
	// Error will occur if 
	// 1) read address exceeds write address while counter has value 0
	// 1) write address exceeds read address while counter has value 1
	//------------------------------------------------------------------------
	up_down_counter
		#		(	.WIDTH				(3))
	u_flip_cnt	(
					.clk				(clk),
					.rst				(reset),
					.inc				(wr_addr_flipped),
					.dec				(rd_addr_flipped),
					.empty				(flip_cnt_empty),
					.empty_next_cycle	(),
					.count				(flip_cnt)
	);	
	
	
	
	// This is the only case where it's acceptable for the read address to exceed the write address
	assign rd_addr_should_be_higher_than_wr_addr = ~flip_cnt_empty;

	
	//------------------------------------------------------------------------
	// First error value found
	// Updates only once after reset
	// Can be attached to OkWireOut for monitoring initial cause of data errors
	//------------------------------------------------------------------------
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			first_error <= 0;
			first_error_detected = 1'b0;
		end else if (~first_error_detected) begin
			if (|error) begin
				first_error <= error;
				first_error_detected <= 1'b1;
			end
		end
	end


	//------------------------------------------------------------------------
	// Real-time error flag and status bits
	// Can be connected to LEDs for real-time monitoring of errors
	//------------------------------------------------------------------------
	always @(*) begin
	
		// Default
		error <= E_NONE;
		overflow <= 0;
		underflow <= 0;
		
		// Update error and status bits if write or read processes have occurred
		if (first_write_initiated | first_read_initiated) begin
		
			if ((rd_addr > wr_addr) & ~rd_addr_should_be_higher_than_wr_addr) begin
				error <= E_UNDERFLOW;
				underflow <= 1'b1;
			end
			
			if ((wr_addr >= rd_addr) & rd_addr_should_be_higher_than_wr_addr) begin
				error <= E_OVERFLOW;
				overflow <= 1'b1;
			end
		
		end
	
	end

endmodule
		
		
		
		
		
		
		