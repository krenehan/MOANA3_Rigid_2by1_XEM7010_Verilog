`timescale 1ns/1ps

module FPGA_MasterPipeController_v2_test();

	localparam NUMBER_OF_CHIPS = 2;
	localparam OKWIDTH = 16;
	localparam DATA_WIDTH = 32;
	
	localparam NUMBER_OF_8b_PACKETS = 80;
	localparam WORD_COUNT = 16'd10;
	
	// Wires and registers
	reg 										rst;
	reg 										clk;
	wire    [DATA_WIDTH-1:0]              		pipe_data;
	reg                                 		pipe_read;
	wire										last_fifo_full;
	wire										pipe_valid;
	wire    [NUMBER_OF_CHIPS*DATA_WIDTH-1:0]   	fifo_data_appended;
	wire 	[NUMBER_OF_CHIPS-1:0] 				fifo_read;
	wire	[NUMBER_OF_CHIPS-1:0]				fifo_empty;
	reg		[NUMBER_OF_CHIPS-1:0]				pad_captured_mask;
	reg 	[7:0]								fifo_din;
	wire	[31:0]								fifo_dout;
	reg											fifo_wr_en;
	wire										fifo_full;
	wire										fifo_valid;
	integer 									i;
	integer										read_counter;
	wire 	[13:0]								fifo_rd_data_count;
    
    // Set data value
    assign fifo_data_appended = { 32'd0, fifo_dout };
	
	// Clocks
	always #5 clk <= ~clk;
	
	// FIFO
	fifo_W8_R32 fifo_0 (
		.rst            		(rst),
		.clk            		(clk),
		.din            		(fifo_din),
		.wr_en        			(fifo_wr_en),
		.rd_en         			(fifo_read[0]),
		.dout           		(fifo_dout),
		.full            		(fifo_full),
		.empty       			(fifo_empty[0]),
		.valid          		(fifo_valid)
    );
    
    // Fake empty signal for FIFO 1 (which doesn't actually exist)
    assign fifo_empty[1] = 1'b1;
	
	
	// MasterPipeController
	MasterPipeController_v2 # (
	    .OKWIDTH				(OKWIDTH),
	    .NUMBER_OF_CHIPS		(NUMBER_OF_CHIPS), 
	    .DATA_WIDTH				(DATA_WIDTH))
	MasterPipeControllerUnit (
		.rst					(rst),
		.clk					(clk),
		.pipeO_master_read		(~last_fifo_full),
		.pipeO_master_data		(pipe_data),
		.fifo_read				(fifo_read),
		.word_count				(WORD_COUNT),
        .fifo_data_appended		(fifo_data_appended), 
        .prev_fifos_empty		(fifo_empty),
        .prev_fifos_empty_mask	(pad_captured_mask),
        .valid					(pipe_valid)
	);
	
	// FIFO 32 to 16
	fifo_W32_R16 fifo_4 		    (
		.rst					(rst),
		.clk					(clk),
		.din					(pipe_data),	// 8'bit in data
		.wr_en					(pipe_valid),
		.rd_en					(1'b0),
		.dout					(),  // 16'bit out data
		.full					(last_fifo_full),
		.overflow				(),
		.empty					(),
		.valid					(),
		.underflow				(),
		.rd_data_count 			(fifo_rd_data_count)
	);
	
	// FIFO read counter
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			read_counter = 0;
		end else if (|fifo_read) begin
			read_counter <= read_counter + 1;
		end
	end
	
	
	
	
	initial begin
		// Initial states
		clk <= 1'b0;
		rst <= 1'b1;
		pipe_read <= 1'b0;
		fifo_din <= 1'b0;
		fifo_wr_en <= 1'b0;
		pad_captured_mask <= 2'b01;
		
		// Reset 
		repeat (20) @(posedge clk);
		rst <= 1'b0;
		repeat (20) @(posedge clk);
		
		// Fill FIFO with N packets of data
		for (i=0;i<NUMBER_OF_8b_PACKETS;i=i+1) begin
			fifo_wr_en <= 1'b1;
			fifo_din <= 8'b11111111;
			@(posedge clk);
		end
		fifo_wr_en <= 1'b0;
		
		// Add some padding at the end
		repeat (20) @(posedge clk);
		
		// Verify that the read counter was only incremented 10 times
		if (read_counter == (NUMBER_OF_8b_PACKETS / 4 * 2)) begin
			$display("Read counter value correct");
		end else begin
			$display("Read counter should be %0d, but is actually %0d", NUMBER_OF_8b_PACKETS / 4 * 2, read_counter);
		end
		
		// Verify that the fifo_rd_data_count is correct
		if (fifo_rd_data_count == NUMBER_OF_8b_PACKETS) begin
			$display("FIFO read count correct");
		end else begin
			$display("FIFO read count should be %0d, but is actually %0d", NUMBER_OF_8b_PACKETS, fifo_rd_data_count);
		end
		
		
		$finish;
		
	end




endmodule

