`timescale 1ns/1ps

module mem_arbiter
	(
		
		// Generic signals
		input  wire          clk,
		input  wire          reset,
		input  wire          calib_done,
		input  wire			 writes_en,
		input  wire			 reads_en,
		
		// Input buffer signals
		output reg           ib_re,
		input  wire [127:0]  ib_data,
		input  wire [7:0]    ib_count,
		input  wire          ib_valid,
		input  wire          ib_empty,
		
		//OUtput buffer signals
		output reg           ob_we,
		output reg  [127:0]  ob_data,
		input  wire [7:0]    ob_count,
		input  wire          ob_full,
		
		// MIG command interface
		input  wire          app_rdy,
		output reg           app_en,
		output reg  [2:0]    app_cmd,
		output reg  [28:0]   app_addr,
		
		// MIG read interface
		input  wire [127:0]  app_rd_data,
		input  wire          app_rd_data_end,
		input  wire          app_rd_data_valid,
		
		// MIG write interface
		input  wire          app_wdf_rdy,
		output reg           app_wdf_wren,
		output reg  [127:0]  app_wdf_data,
		output reg           app_wdf_end,
		output wire [15:0]   app_wdf_mask
	);

	// Parameters
	localparam FIFO_SIZE           	= 256;
	localparam WRITES_IN_PACKET 	= 8'd75; // Number of chips * number_of_bins * 32b/128b (Width of ob_count)
	localparam ADDRESS_INCREMENT   	= 5'd8; // UI Address is a word address. BL8 Burst Mode = 8.
	
	// States
	localparam S_IDLE    	= 0,
	           S_CALIB_WAIT = 1,
			   S_WRITE_0 	= 10,
			   S_WRITE_1 	= 11,
			   S_WRITE_2 	= 12,
			   S_WRITE_3	= 13,
			   S_READ_0  	= 20,
			   S_READ_1  	= 21,
			   S_READ_2  	= 22;
			   
	// Commands
	localparam CMD_WRITE 	= 3'd0;
	localparam CMD_READ  	= 3'd1;
	
	//------------------------------------------------------------------------
	// Internal Wires
	//------------------------------------------------------------------------
	
	// State for FSM
	(* KEEP = "TRUE" *)integer 	state;
	
	// Command address
	reg  [28:0] cmd_byte_addr_wr;
	reg  [28:0] cmd_byte_addr_rd;
	reg         reset_d;
	
	// Counter values
	wire [7:0] write_cnt;
	wire [7:0] read_cnt;
	wire [7:0] packet_cnt;
	
	// Read and write requests
	wire		rd_req;
	wire		wr_req;
	
	// Control signals
	reg			inc_write_cnt;
	reg			inc_read_cnt;
	wire		inc_packet_cnt;
	wire		dec_packet_cnt;
	wire		packet_cnt_empty;
	
	// Status signals
	reg fifo_data_not_valid;
	reg	rd_data_not_valid;
	wire reading = (state==S_READ_0) | (state==S_READ_1) | (state==S_READ_2);
	wire writing = (state==S_WRITE_0) | (state==S_WRITE_1) | (state==S_WRITE_2);

	// Mask is unused
	assign app_wdf_mask = 16'h0000;
	
	// Synchronize reset
	always @(posedge clk) reset_d <= reset;
	
	
	//------------------------------------------------------------------------
	// Assignments
	//------------------------------------------------------------------------
	
	// If the input buffer has data, assert write request
	assign wr_req = writes_en;
	//assign wr_req = ~ib_empty;
	
	// If there is data in RAM and the output buffer does not contain a full packet of data, assert read request
	assign rd_req = reads_en;
	//assign rd_req = (~packet_cnt_empty) && (ob_count < WRITES_IN_PACKET);
	
	
	//------------------------------------------------------------------------
	// State Machine
	//------------------------------------------------------------------------
	always @(posedge clk) begin
	
		if (reset_d) begin
			state             <= S_CALIB_WAIT;
			cmd_byte_addr_wr  <= 0;
			cmd_byte_addr_rd  <= 0;
			app_en            <= 1'b0;
			app_cmd           <= 3'b0;
			app_addr          <= 28'b0;
			app_wdf_wren      <= 1'b0;
			app_wdf_end       <= 1'b0;
			
		end else begin
		
			// Default register values
			app_en            	<= 1'b0;
			app_wdf_wren      	<= 1'b0;
			app_wdf_end       	<= 1'b0;
			ib_re             	<= 1'b0;
			ob_we             	<= 1'b0;
			fifo_data_not_valid <= 1'b0;
			rd_data_not_valid 	<= 1'b0;
			inc_write_cnt		<= 1'b0;
			inc_read_cnt		<= 1'b0;
	
	
			case (state)
				
				// State machine waits for calibration to complete before moving to the idle state
				S_CALIB_WAIT: begin
					
					// Wait for calibration to complete
					if (calib_done) begin
						state <= S_IDLE;
					end
				end
			
				// Idle state waits for read or write request
				S_IDLE: begin
					
					// Read request
					// Takes priority over write request
					if (rd_req == 1'b1) begin
					
						// Load read address
						app_addr <= cmd_byte_addr_rd;						
						
						// Move state
						state <= S_READ_0;
						
					end else if (wr_req == 1'b1) begin
					
						// Load write address
						app_addr <= cmd_byte_addr_wr;
						
						// Assert FIFO read enable
						ib_re <= 1'b1;
						
						// Move state
						state <= S_WRITE_0;
					end
				end
				
				// FIFOs are not FWFT, so wait a cycle for data valid
				S_WRITE_0: begin
					state <= S_WRITE_1;
				end
	
				// Check that data from input buffer is valid
				S_WRITE_1: begin
					if(ib_valid==1) begin
					
						// Load data into MIG
						app_wdf_data <= ib_data;
						
						// Proceed to next write state
						state <= S_WRITE_2;
						
					end else begin
					
						// Status flag
						fifo_data_not_valid <= 1'b1;
					
						// Move back to IDLE state if data is not valid in this cycle
						state <= S_IDLE;
					end
				end
	
	
				// Write command
				S_WRITE_2: begin
					app_wdf_wren <= 1'b1;
					app_wdf_end <= 1'b1;
					if ( app_wdf_rdy == 1'b1 ) begin
						app_en    <= 1'b1;
						app_cmd <= CMD_WRITE;
						state <= S_WRITE_3;
					end
				end
	
				// Confirm command accepted
				S_WRITE_3: begin
					if (app_rdy == 1'b1) begin
					
						// Increment write address
						cmd_byte_addr_wr <= cmd_byte_addr_wr + ADDRESS_INCREMENT;
						
						// Increment write counter
						inc_write_cnt <= 1'b1;
						
						// Write finished, move back to idle state
						state <= S_IDLE;
						
					end else begin
					
						// Leave enable and command asserted if write did not complete
						app_en    <= 1'b1;
						app_cmd <= CMD_WRITE;
						
					end
				end
	
				
				// Read command
				S_READ_0: begin
					app_en    <= 1'b1;
					app_cmd <= CMD_READ;
					state <= S_READ_1;
				end
				
				
				// Confirm command accepted or repeat command
				S_READ_1: begin
					if (app_rdy == 1'b1) begin
						cmd_byte_addr_rd <= cmd_byte_addr_rd + ADDRESS_INCREMENT;
						state <= S_READ_2;
					end else begin
						app_en    <= 1'b1;
						app_cmd <= CMD_READ;
					end
				end
	
				
				// Confirm data is valid and push to output buffer
				S_READ_2: begin
					if (app_rd_data_valid == 1'b1) begin
						ob_data <= app_rd_data;
						ob_we <= 1'b1;
						inc_read_cnt <= 1'b1;
						state <= S_IDLE;
					end else begin
						rd_data_not_valid <= 1'b1;
					end
				end
				
			endcase
		end
	end
	
	
	//------------------------------------------------------------------------
	// Write Counter
	//------------------------------------------------------------------------
	flip_sync_counter	
		#		(	.WIDTH		(8), 
					.FLIP_AT_VAL(WRITES_IN_PACKET))
	u_wr_cnt	(
					.reset		(reset),
					.clk		(clk),
					.enable		(inc_write_cnt),
					.count		(write_cnt),
					.flipped	(inc_packet_cnt)
	);
	
	//------------------------------------------------------------------------
	// Read Counter
	//------------------------------------------------------------------------
	flip_sync_counter	
		#		(	.WIDTH		(8), 
					.FLIP_AT_VAL(WRITES_IN_PACKET))
	u_rd_cnt	(
					.reset		(reset),
					.clk		(clk),
					.enable		(inc_read_cnt),
					.count		(read_cnt),
					.flipped	(dec_packet_cnt)
	);
	
	//------------------------------------------------------------------------
	// Packet Counter
	//------------------------------------------------------------------------
	up_down_counter
		#		(	.WIDTH		(8))
	u_packet_cnt(
					.clk		(clk),
					.rst		(reset),
					.inc		(inc_packet_cnt),
					.dec		(dec_packet_cnt),
					.empty		(packet_cnt_empty),
					.count		(packet_cnt)
	);
				
		

endmodule
