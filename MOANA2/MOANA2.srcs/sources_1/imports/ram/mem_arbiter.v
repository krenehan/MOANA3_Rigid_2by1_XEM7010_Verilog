`timescale 1ns/1ps

module mem_arbiter
#	( 	
		// Adjustable
		parameter IBCNT_WIDTH		= 8,
		parameter IB_NEAR_FULL		= 8'd240,
		
		parameter OBCNT_WIDTH		= 8,
		parameter OB_NEAR_EMPTY		= 8'd15,
		parameter OB_PACKETS		= 8'd225,
		
		
		parameter WRITES_IN_PACKET 	= 8'd75,
		
		// Do not modify
		parameter DATA_WIDTH 		= 128,
		parameter MASK_WIDTH 		= 16,
		parameter OKWIDTH			= 16,
		parameter CMD_WIDTH			= 3,
		parameter UI_ADDR_WIDTH 	= 29,
		parameter ADDR_WIDTH		= 28
	)
	(
		
		// Generic signals
		input  wire          			clk,
		input  wire          			reset,
		input  wire          			calib_done,
		
		// Input buffer signals
		output reg           			ib_re,
		input  wire [DATA_WIDTH-1:0]	ib_data,
		input  wire [IBCNT_WIDTH-1:0]   ib_count,
		input  wire          			ib_valid,
		input  wire          			ib_empty,
		
		//OUtput buffer signals
		output reg           			ob_we,
		output reg  [DATA_WIDTH-1:0]  	ob_data,
		input  wire [OBCNT_WIDTH-1:0]   ob_count,
		input  wire          			ob_full,
		
		// MIG command interface
		input  wire          			app_rdy,
		output reg           			app_en,
		output reg  [CMD_WIDTH-1:0]    	app_cmd,
		output reg  [UI_ADDR_WIDTH-1:0] app_addr, // This address is 29 bits because the MSB is for rank, which is always a 0
		
		// MIG read interface
		input  wire [DATA_WIDTH-1:0]  	app_rd_data,
		input  wire          			app_rd_data_end,
		input  wire          			app_rd_data_valid,
		
		// MIG write interface
		input  wire          			app_wdf_rdy,
		output reg           			app_wdf_wren,
		output reg  [DATA_WIDTH-1:0]  	app_wdf_data,
		output reg           			app_wdf_end,
		output wire [MASK_WIDTH-1:0]   	app_wdf_mask, 
		
		// User input
		input  wire	[OKWIDTH-1:0] 	 	packets_in_transfer,
		
		// User output
		output wire 		 			transfer_ready,
		output wire			 			underflow,
		output wire			 			overflow,
		output wire						packet_cnt_full,
		output wire [OKWIDTH-1:0] 	 	error,
		output wire	[OKWIDTH-1:0]	 	first_error,
		
		output wire 					urgent_wr_req
		
	);

	// Don't modify this
	localparam ADDRESS_INCREMENT   	= 5'd8; 	// UI Address is a word address. BL8 Burst Mode = 8
	localparam MAX_ADDR				= 28'hFFF_FFFF; // Maximum word address
	localparam PACKET_CNT_WIDTH		= 19; // clog2(MAX_ADDR / ADDRESS_INCREMENT / WRITES_IN_PACKET)
	
	// States
	localparam S_IDLE    	= 0,
	           S_CALIB_WAIT = 1,
			   S_WRITE_0 	= 10,
			   S_WRITE_1 	= 11,
			   S_WRITE_2 	= 12,
			   S_WRITE_3	= 13,
			   S_READ_0  	= 20;
			   
	// Commands
	localparam 	CMD_WRITE 	= 3'd0,
				CMD_READ  	= 3'd1;
				
	
	//------------------------------------------------------------------------
	// Internal Wires
	//------------------------------------------------------------------------
	
	// State for FSM
	reg  [31:0] state;
	
	// Command address
	reg  [28:0] cmd_byte_addr_wr;
	reg  [28:0] cmd_byte_addr_rd;
	reg         reset_d;
	
	// Counter values
	wire [7:0] 	write_cnt;
	wire [7:0] 	read_cnt;
	wire [15:0] packet_cnt;
	
	// Read and write requests
	wire		rd_req;
	wire		wr_req;
	wire		ib_near_full;
	wire		ob_near_empty;
	
	// Control signals
	reg			inc_write_cnt;
	reg			inc_read_cnt;
	wire		inc_packet_cnt;
	wire		dec_packet_cnt;
	wire		packet_cnt_empty;
	wire		packet_cnt_empty_next_cycle;
	reg			ob_we_flag;
	reg			ob_we_once_valid;
	wire		rdy_next_rd;
	
	// Status signals
	reg 		fifo_data_not_valid;
	reg			rd_data_not_valid;
	wire 		reading = (state==S_READ_0);
	wire 		writing = (state==S_WRITE_0) | (state==S_WRITE_1) | (state==S_WRITE_2);

	// Mask is unused
	assign app_wdf_mask = 16'h0000;
	
	// Synchronize reset
	always @(posedge clk) reset_d <= reset;
	
	
	//------------------------------------------------------------------------
	// Assignments
	//------------------------------------------------------------------------
	
	// The next read operation only begins if the last read operation has been handled by the read controller
	assign rdy_next_rd = ~(ob_we_once_valid | ob_we_flag);
	
	// If the input buffer has data, assert write request
	assign wr_req = ~ib_empty;
	
	// If the input buffer is near full and the output buffer is still holding enough data, issue an urgent write request to shift priority to write
	assign urgent_wr_req = ib_near_full & ~ob_near_empty;
	
	// If there is data in RAM and the output buffer does not contain a full packet of data, assert read request
	assign rd_req = ~(packet_cnt_empty | packet_cnt_empty_next_cycle) && (ob_count < OB_PACKETS) && rdy_next_rd;
	
	// Input buffer and output buffer conditionals
	assign ib_near_full = (ib_count >= IB_NEAR_FULL);
	assign ob_near_empty = (ob_count <= OB_NEAR_EMPTY);
	
	// Very primitive transfer ready
	// This signal can be connected to an okWireOut endpoint at the top level and polled to determine when data is available for pipe out
	assign transfer_ready = packet_cnt >= packets_in_transfer;
	
	//------------------------------------------------------------------------
	// Main Controller
	//------------------------------------------------------------------------
	always @(posedge clk) begin
	
		if (reset_d) begin
			state             <= S_CALIB_WAIT;
			cmd_byte_addr_wr  <= 28'b0;
			app_en            <= 1'b0;
			app_cmd           <= 3'b0;
			app_addr          <= 28'b0;
			app_wdf_wren      <= 1'b0;
			app_wdf_end       <= 1'b0;
			ib_re			  <= 1'b0;
			fifo_data_not_valid <= 1'b0;
			inc_read_cnt		<= 1'b0;
			inc_write_cnt		<= 1'b0;
			ob_we_flag			<= 1'b0;
			
		end else begin
		
			// Default register values
			app_en            	<= 1'b0;
			app_wdf_wren      	<= 1'b0;
			app_wdf_end       	<= 1'b0;
			ib_re             	<= 1'b0;
			fifo_data_not_valid <= 1'b0;
			inc_read_cnt		<= 1'b0;
			inc_write_cnt		<= 1'b0;
			ob_we_flag 			<= 1'b0;
	
	
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
				
					if 		(urgent_wr_req) init_write;	// 1st priority - Handle urgent write request to prevent input buffer from overflowing
					else if (rd_req)		init_read;	// 2rd priority - Fill output buffer
					else if	(wr_req)		init_write;	// 3th priority - Read from input buffer

				end
				
				// FIFOs are not FWFT, so wait a cycle for data valid
				S_WRITE_0: begin
					state <= S_WRITE_1;
				end
	
				// Check that data from input buffer is valid
				S_WRITE_1: begin
					if (ib_valid==1) begin
					
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
				
					// Write enable
					app_wdf_wren <= 1'b1;
					
					// Indicate that this is the last write
					app_wdf_end <= 1'b1;
					
					// If the interface is ready, send the write command
					if ( app_wdf_rdy == 1'b1 ) begin
						app_en    <= 1'b1;
						app_cmd <= CMD_WRITE;
						inc_write_cnt <= 1'b1;
						state <= S_WRITE_3;
					end
				end
	
				// Confirm command accepted
				S_WRITE_3: begin
					if (app_rdy == 1'b1) begin
					
						// Increment write address
						cmd_byte_addr_wr <= cmd_byte_addr_wr + ADDRESS_INCREMENT;
						
						// Write finished, move back to idle state
						state <= S_IDLE;
						
					end else begin
					
						// Leave enable and command asserted if write did not complete
						app_en    <= 1'b1;
						app_cmd <= CMD_WRITE;
					end
				end
				
				
				// Confirm command accepted or repeat command
				S_READ_0: begin
					if (app_rdy == 1'b1) begin
						ob_we_flag <= 1'b1;
						inc_read_cnt <= 1'b1; // Read must complete, safe to increment read counter here
						state <= S_IDLE;
					end else begin
						app_en    <= 1'b1;
						app_cmd <= CMD_READ;
					end
				end
				
			endcase
		end
	end
	
	//------------------------------------------------------------------------
	// Read controller
	// It takes ~20 cycles for the read data from RAM to be valid, so we'd rather not stall the main controller while we wait
	// Read controller monitors ob_we_flag and handles assertion of ob_we when rd_data becomes valid so that main controller is not stalled
	//------------------------------------------------------------------------
	always @(posedge clk) begin
		if (reset_d) begin
			ob_we <= 1'b0;
			ob_we_once_valid <= 1'b0;
			ob_data <= 0;
			rd_data_not_valid <= 1'b0;
			cmd_byte_addr_rd  <= 28'b0;
		end else begin
		
			// Default
			ob_we <= 1'b0;
			rd_data_not_valid <= 1'b0;
			
			// Write enable flag persists for a single cycle
			// Trigger the controller to wait for a valid signal
			if (ob_we_flag == 1'b1) ob_we_once_valid <= 1'b1;
			
			// If ob_we_once_valid is high and the read data is valid, write proceeds
			// ob_we_once_valid is deasserted after a single cycle
			if ((ob_we_once_valid == 1'b1) || (ob_we_flag == 1'b1)) begin
				if (app_rd_data_valid == 1'b1) begin
					ob_data <= app_rd_data;
					ob_we <= 1'b1;
					cmd_byte_addr_rd <= cmd_byte_addr_rd + ADDRESS_INCREMENT;
					ob_we_once_valid <= 1'b0;
				end else begin
					rd_data_not_valid <= 1'b1;
				end
			end
		end
	end
	
	
	//------------------------------------------------------------------------
	// Write Counter
	//------------------------------------------------------------------------
	flip_sync_counter	
		#		(	.WIDTH				(OBCNT_WIDTH), 
					.FLIP_AT_VAL		(WRITES_IN_PACKET))
	u_wr_cnt	(
					.reset				(reset),
					.clk				(clk),
					.enable				(inc_write_cnt),
					.count				(write_cnt),
					.flipped			(inc_packet_cnt)
	);
	
	//------------------------------------------------------------------------
	// Read Counter
	//------------------------------------------------------------------------
	flip_sync_counter	
		#		(	.WIDTH				(OBCNT_WIDTH), 
					.FLIP_AT_VAL		(WRITES_IN_PACKET))
	u_rd_cnt	(
					.reset				(reset),
					.clk				(clk),
					.enable				(inc_read_cnt),
					.count				(read_cnt),
					.flipped			(dec_packet_cnt)
	);
	
	//------------------------------------------------------------------------
	// Packet Counter
	//------------------------------------------------------------------------
	up_down_counter
		#		(	.WIDTH				(PACKET_CNT_WIDTH))
	u_packet_cnt(
					.clk				(clk),
					.rst				(reset),
					.inc				(inc_packet_cnt),
					.dec				(dec_packet_cnt),
					.empty				(packet_cnt_empty),
					.empty_next_cycle	(packet_cnt_empty_next_cycle),
					.count				(packet_cnt),
					.full				(packet_cnt_full)
	);		
	
	
	//------------------------------------------------------------------------
	// Safety logic to catch situations where writing happens before data is read out
	//------------------------------------------------------------------------
	mem_arbiter_safety
	#			(
					.OKWIDTH			(OKWIDTH),
					.ADDR_WIDTH			(ADDR_WIDTH)
				)
	u_safety	(
					.clk				(clk),
					.reset				(reset),
					.state				(state),
					.wr_addr			(cmd_byte_addr_wr),
					.rd_addr			(cmd_byte_addr_rd),
					.packet_cnt_full	(packet_cnt_full),
					.underflow			(underflow),
					.overflow			(overflow),
					.error				(error),
					.first_error		(first_error)
	);
	
	
	//------------------------------------------------------------------------
	// Initialize read operation
	//------------------------------------------------------------------------
	task init_read;
		begin
			// Load read address
			app_addr <= {1'b0, cmd_byte_addr_rd};						

			// Send read command
			app_en    <= 1'b1;
			app_cmd <= CMD_READ;
			
			// Move state
			state <= S_READ_0;
		end
	endtask
	
	
	//------------------------------------------------------------------------
	// Initialize write operation
	//------------------------------------------------------------------------
	task init_write;
		begin
			// Load write address
			app_addr <= {1'b0, cmd_byte_addr_wr};
			
			// Assert FIFO read enable
			ib_re <= 1'b1;
			
			// Move state
			state <= S_WRITE_0;
		end
	endtask
		

endmodule
