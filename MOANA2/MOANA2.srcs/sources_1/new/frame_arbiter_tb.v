`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2022 10:20:48 AM
// Design Name: 
// Module Name: frame_arbiter_tb
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

//-------------------------------------------------------------------------------------------
//    Scan Chain Length
//-------------------------------------------------------------------------------------------
`define DigitalCore_ScanChainLength  313
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
//    Full Bit Vector Defs
//-------------------------------------------------------------------------------------------
`define DigitalCore_TDCDCBoost                    7:0     
`define DigitalCore_TDCStatus                    15:8     
`define DigitalCore_TDCFineOutRaw                79:16    
`define DigitalCore_TDCCoarseOut                135:80    
`define DigitalCore_DynamicPacket               152:136   
`define DigitalCore_PattResetControlledByTriggerExt    153:153   
`define DigitalCore_PattResetExtEnable          154:154   
`define DigitalCore_MeasPerPatt                 178:155   
`define DigitalCore_MeasCountEnable             179:179   
`define DigitalCore_VCSELEnableWithScan         180:180   
`define DigitalCore_VCSELEnableControlledByScan    181:181   
`define DigitalCore_VCSELWave1Enable            182:182   
`define DigitalCore_VCSELWave2Enable            183:183   
`define DigitalCore_TDCStartSelect              191:184   
`define DigitalCore_TDCStopSelect               199:192   
`define DigitalCore_TDCDisable                  207:200   
`define DigitalCore_SPADEnable                  271:208   
`define DigitalCore_DynamicConfigEnable         272:272   
`define DigitalCore_TestPattEnable              273:273   
`define DigitalCore_TestDataIn                  283:274   
`define DigitalCore_TxDataExtRequestEnable      284:284   
`define DigitalCore_TimeOffsetWord              294:285   
`define DigitalCore_SubtractorBypass            295:295   
`define DigitalCore_ClkBypass                   296:296   
`define DigitalCore_ClkFlip                     297:297   
`define DigitalCore_DriverDLLWordControlledByScan    298:298   
`define DigitalCore_DriverDLLWord               303:299   
`define DigitalCore_AQCDLLWordControlledByScan    304:304   
`define DigitalCore_AQCDLLCoarseWord            308:305   
`define DigitalCore_AQCDLLFineWord              311:309   
`define DigitalCore_AQCDLLFinestWord            312:312   
//-------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
//    Indexed Bit Vector Defs
//-------------------------------------------------------------------------------------------
`define DigitalCore_TDCDCBoost_idx(n)        (n * 1      +      0)+:     1 //      7:0     
`define DigitalCore_TDCStatus_idx(n)         (n * 1      +      8)+:     1 //     15:8     
`define DigitalCore_TDCFineOutRaw_idx(n)     (n * 8      +     16)+:     8 //     79:16    
`define DigitalCore_TDCCoarseOut_idx(n)      (n * 7      +     80)+:     7 //    135:80    
`define DigitalCore_DynamicPacket_idx(n)     (n * 17     +    136)+:    17 //    152:136   
`define DigitalCore_PattResetControlledByTriggerExt_idx(n) (n * 1      +    153)+:     1 //    153:153   
`define DigitalCore_PattResetExtEnable_idx(n) (n * 1      +    154)+:     1 //    154:154   
`define DigitalCore_MeasPerPatt_idx(n)       (n * 24     +    155)+:    24 //    178:155   
`define DigitalCore_MeasCountEnable_idx(n)   (n * 1      +    179)+:     1 //    179:179   
`define DigitalCore_VCSELEnableWithScan_idx(n) (n * 1      +    180)+:     1 //    180:180   
`define DigitalCore_VCSELEnableControlledByScan_idx(n) (n * 1      +    181)+:     1 //    181:181   
`define DigitalCore_VCSELWave1Enable_idx(n)  (n * 1      +    182)+:     1 //    182:182   
`define DigitalCore_VCSELWave2Enable_idx(n)  (n * 1      +    183)+:     1 //    183:183   
`define DigitalCore_TDCStartSelect_idx(n)    (n * 1      +    184)+:     1 //    191:184   
`define DigitalCore_TDCStopSelect_idx(n)     (n * 1      +    192)+:     1 //    199:192   
`define DigitalCore_TDCDisable_idx(n)        (n * 1      +    200)+:     1 //    207:200   
`define DigitalCore_SPADEnable_idx(n)        (n * 1      +    208)+:     1 //    271:208   
`define DigitalCore_DynamicConfigEnable_idx(n) (n * 1      +    272)+:     1 //    272:272   
`define DigitalCore_TestPattEnable_idx(n)    (n * 1      +    273)+:     1 //    273:273   
`define DigitalCore_TestDataIn_idx(n)        (n * 10     +    274)+:    10 //    283:274   
`define DigitalCore_TxDataExtRequestEnable_idx(n) (n * 1      +    284)+:     1 //    284:284   
`define DigitalCore_TimeOffsetWord_idx(n)    (n * 10     +    285)+:    10 //    294:285   
`define DigitalCore_SubtractorBypass_idx(n)  (n * 1      +    295)+:     1 //    295:295   
`define DigitalCore_ClkBypass_idx(n)         (n * 1      +    296)+:     1 //    296:296   
`define DigitalCore_ClkFlip_idx(n)           (n * 1      +    297)+:     1 //    297:297   
`define DigitalCore_DriverDLLWordControlledByScan_idx(n) (n * 1      +    298)+:     1 //    298:298   
`define DigitalCore_DriverDLLWord_idx(n)     (n * 5      +    299)+:     5 //    303:299   
`define DigitalCore_AQCDLLWordControlledByScan_idx(n) (n * 1      +    304)+:     1 //    304:304   
`define DigitalCore_AQCDLLCoarseWord_idx(n)  (n * 4      +    305)+:     4 //    308:305   
`define DigitalCore_AQCDLLFineWord_idx(n)    (n * 3      +    309)+:     3 //    311:309   
`define DigitalCore_AQCDLLFinestWord_idx(n)  (n * 1      +    312)+:     1 //    312:312   
//-------------------------------------------------------------------------------------------


module frame_arbiter_tb(

    );


	//-----------------------------------------------------------------------------------
	// Parameters
	//-----------------------------------------------------------------------------------
	localparam NUMBER_OF_CHIPS = 1;
	localparam OKWIDTH = 16;
	localparam PATTERN_PIPE_BUFFER_SIZE = 256;
	localparam PATTERN_PIPE_ADDR_BITS = 8;
	
	// For scan chain
	localparam GlobalScanLength = `DigitalCore_ScanChainLength;
    //-----------------------------------------------------------------------------------
	// Wires
	//-----------------------------------------------------------------------------------
	reg											rst;
	reg											chip_rst;
	reg											fifo_rst;
	reg											clk;
	reg											tx_clk;
	reg											ti_clk;
	wire											gated_clk;
	wire											gated_tx_clk;
	reg											scan_done;
	wire										capture_idle;
	reg											frame_data_sent;
	wire										frame_data_received;
	reg											capture_start;
	wire										capture_running;
	wire										capture_complete;
	wire										capture_done;
	reg											data_stream;
	wire										read_trigger;
	reg											read_ack_trigger;
	wire										block_next_streamout_ticlk, block_next_streamout_refclk;
	wire										read_ack_trigger_hold;
	reg		[OKWIDTH-1:0]						number_of_frames;
	reg		[OKWIDTH-1:0]						patterns_per_frame;
	reg		[OKWIDTH*2-1:0]						measurements_per_pattern;
	wire		[NUMBER_OF_CHIPS-1:0]				pad_captured;
	reg		[NUMBER_OF_CHIPS-1:0]				pad_captured_mask;
	wire		[NUMBER_OF_CHIPS-1:0]				emitter_enable;
	wire										refclk_enable;
	wire										tx_refclk_enable;
	reg	 	[PATTERN_PIPE_BUFFER_SIZE-1:0] 		emitter_pattern_register_bank;
	wire	[NUMBER_OF_CHIPS-1:0]				pattern_emitter_packet;
	wire	[23:0]						measurement_count;
	wire	[OKWIDTH-1:0]						pattern_count;
	wire	[OKWIDTH-1:0]						frame_count;
	wire										frame_complete_pulse;
	wire										frame_complete;
	wire	[9:0]								state;
	
	// Chip Signals
	wire s_enable = 1'b0;
	wire s_update = 1'b0;
	wire tx_dataout;
	wire vcsel1_anode, vcsel2_anode;
	reg [GlobalScanLength-1:0] ScanBitsWr;
	wire AQCClkOut;
	
	// TxFlagOut signals
	wire tx_flagout;
	wire data_loaded;
	wire next_streamout_will_be_blocked;
	wire blocking;
	
	
	//-----------------------------------------------------------------------------------
	// Clocking
	//-----------------------------------------------------------------------------------
	// 50.0 MHz RefClk
	initial clk = 1'b0;
	always #(10) clk <= #5 ~clk;
	
	// 12.5 MHz TxRefClk
	initial tx_clk = 1'b0;
	always #(40) tx_clk <=   ~tx_clk;
	
	// 48.0 MHz TiClk
	initial ti_clk = 1'b0;
	always #(10.42) ti_clk <= ~ti_clk;
	
	// Gated RefClk
	assign gated_clk = clk & refclk_enable;
	
	// Gated TxRefClk
	assign gated_tx_clk = tx_clk & tx_refclk_enable;
	
	
    //-----------------------------------------------------------------------------------
	// Chip
    //-----------------------------------------------------------------------------------
	DigitalCore   IC      (     
		.SClkP(),
		.SClkN(),
		.SReset(),
		.SEnable(s_enable),
		.SUpdate(s_update),
		.SIn(),
		.SOut(),
		
		.TxRefClk(gated_tx_clk),
		.TriggerExt(1'b0),
		.TxDataOut(tx_dataout),
		.VCSEL1_Anode(vcsel1_anode),
		.VCSEL2_Anode(vcsel2_anode),
		.AQCClkOut(),
		
		.StartExt(1'b0),
		.StopExt(1'b0),
		.RefClk(gated_clk),
		.RstAsync(chip_rst),
		.ScanBitsRd(),
		.ScanBitsWr(ScanBitsWr)
	);
	
	                // Flagout Module for catching padded bit and initializing data read
	TxFlagOut                 flag	(
		.rst(fifo_rst),
		.chip_rst(chip_rst),
		.tx_clk(tx_clk),
		.tx_data(tx_dataout),
		.tx_flagout(tx_flagout),
		.data_loaded(data_loaded),
		.block_next_streamout(block_next_streamout_ticlk),
		.pad_captured(pad_captured), 
		.next_streamout_will_be_blocked(next_streamout_will_be_blocked), 
		.blocking(blocking)
	);
	
	
    //-----------------------------------------------------------------------------------
	// Frame Arbiter
    //-----------------------------------------------------------------------------------
	frame_arbiter # (
			.NUMBER_OF_CHIPS 			(NUMBER_OF_CHIPS),
			.OKWIDTH					(OKWIDTH),
			.PATTERN_PIPE_BUFFER_SIZE 	(PATTERN_PIPE_BUFFER_SIZE),
			.PATTERN_PIPE_ADDR_BITS		(PATTERN_PIPE_ADDR_BITS) )
		frame_arbiter_inst (
			.rst							(rst),
			.clk							(clk),
			.tx_clk							(tx_clk),
			.scan_done						(scan_done),
			.capture_idle					(capture_idle),
			.frame_data_sent				(frame_data_sent),
			.frame_data_received			(frame_data_received),
			.capture_start					(capture_start),
			.capture_running				(capture_running),
			.capture_complete				(capture_complete),
			.capture_done					(capture_done),
			.data_stream					(data_stream),
			.read_trigger					(read_trigger),
			.read_ack_trigger				(read_ack_trigger),
			.block_next_streamout			(block_next_streamout_refclk),
			.read_ack_trigger_hold			(read_ack_trigger_hold),
			.number_of_frames				(number_of_frames),
			.patterns_per_frame				(patterns_per_frame),
			.measurements_per_pattern		(measurements_per_pattern),
			.pad_captured					(pad_captured),
			.pad_captured_mask				(pad_captured_mask),
			.blocking								(blocking),
			.emitter_enable					(emitter_enable),
			.refclk_enable					(refclk_enable),
			.tx_refclk_enable				(tx_refclk_enable),
			.emitter_pattern_register_bank	(emitter_pattern_register_bank),
			.pattern_emitter_packet			(pattern_emitter_packet),
			.measurement_count				(measurement_count),
			.pattern_count					(pattern_count),
			.frame_count					(frame_count),
			.frame_complete_pulse			(frame_complete_pulse),
			.frame_complete					(frame_complete),
			.state							(state),
			.next_state						()
	);
	
	synchronizer #	(
											.NumSignals								(1),
											.Stages									(2)
					)
	stream_block_sync	(
											.rst										(rst),
											.src_clk									(clk),
											.dest_clk								(ti_clk),
											.src_sig									(block_next_streamout_refclk),
											.dest_sig								(block_next_streamout_ticlk)
					);
	
	// Histogram counter
	integer histogram_count;
	initial histogram_count = 0;
	always @(posedge tx_flagout) begin
		histogram_count = histogram_count + 1;
	end
	

	//-----------------------------------------------------------------------------------
	// Tasks
    //-----------------------------------------------------------------------------------
	task run;
		begin
			// Check that FSM is idle
			if (capture_idle) $display("FSM is idle");
			else $display("FSM not idle");

			// Indicate frame data was sent
			//repeat (25000) @(posedge clk);
			frame_data_sent <= 1'b1;
			$display("Sending frame data");
			$display("Number of Frames: %d", number_of_frames);
			$display("Patterns per Frame: %d", patterns_per_frame);
			$display("Measurements per Pattern: %d", measurements_per_pattern);

			// Wait for frame_data_received signal
			@(posedge frame_data_received);
			$display("Frame data received");

			// Send capture start
			//repeat (25000) @(posedge clk);
			$display("Starting capture");
			capture_start <= 1'b1;

			// Check capture_running
			repeat (5) @(posedge clk);
			if (capture_running) $display("Capture running");
			else $display("Capture not running");

			// Wait for capture_complete
			@(posedge capture_done);
			$display("Capture done");

			// Wait a little and then reset
			repeat (25000) @(posedge clk);
			frame_data_sent <= 1'b0;
			capture_start <= 1'b0;
		end
	endtask
	
	task check_histogram_count;
		begin
			if ((number_of_frames * patterns_per_frame * 2) == histogram_count) begin
				$display("Histogram count correct");
			end else begin
				$display("Histogram count was %d but should have been %d",histogram_count , number_of_frames * patterns_per_frame * 2 );
			end
		end
	endtask
	
	
	
	
	//-----------------------------------------------------------------------------------
	// Test
    //-----------------------------------------------------------------------------------
	initial begin
	
		// Initial signal states
		rst <= 1'b0;
		scan_done <= 1'b0;
		frame_data_sent <= 1'b0;
		capture_start <= 1'b0;
		data_stream <= 1'b0;
		read_ack_trigger <= 1'b0;
		emitter_pattern_register_bank <= 0;
		pad_captured_mask <= 16'b1;
		
		repeat (5) @(posedge clk);
		
		// Scan settings
		ScanBitsWr = 0;
		ScanBitsWr[`DigitalCore_MeasCountEnable] = 1'b1;
		ScanBitsWr[`DigitalCore_TestPattEnable] = 1'b1;
		ScanBitsWr[`DigitalCore_TestDataIn] = 10'd4;
		ScanBitsWr[`DigitalCore_AQCDLLCoarseWord] = 0;
		ScanBitsWr[`DigitalCore_AQCDLLFineWord] = 1;
		ScanBitsWr[`DigitalCore_AQCDLLFinestWord] = 1;
		ScanBitsWr[`DigitalCore_DriverDLLWord] = 4'b0010;
		ScanBitsWr[`DigitalCore_VCSELEnableControlledByScan] = 1'b0;
		ScanBitsWr[`DigitalCore_VCSELWave1Enable] = 1'b1;
		ScanBitsWr[`DigitalCore_VCSELWave2Enable] = 1'b1;
		ScanBitsWr[`DigitalCore_MeasPerPatt] = 50000;
		
		// FPGA reset
		repeat (100) @(posedge clk);
		rst <= 1'b1;
		number_of_frames <= 16'd0;
		patterns_per_frame <= 16'd0;
		measurements_per_pattern <= 32'd0;
		repeat (100) @(posedge clk);
		rst <= 1'b0;
		
		// Chip reset
		repeat (100) @(posedge clk);
		chip_rst <= 1'b1;
		repeat (100) @(posedge clk);
		chip_rst <= 1'b0;
		
		
		// FIFO reset
		repeat (100) @(posedge clk);
		fifo_rst <= 1'b1;
		repeat (100) @(posedge clk);
		fifo_rst <= 1'b0;
		
		// Send frame data in
		repeat (100) @(posedge clk);
		number_of_frames <= 16'd1;
		repeat (100) @(posedge clk);
		patterns_per_frame <= 16'd1;
		repeat (100) @(posedge clk);
		measurements_per_pattern <= 32'd50000;
		repeat (100) @(posedge clk);
		
		// Run the frame controller
		run();        

		// Check that FSM is idle
		@(posedge capture_idle);
		$display("FSM is idle");
		
		// Wait for next capture
		repeat (100000) @(posedge tx_clk);

		// Run the frame controller again
		run();
		
		// Check that FSM is idle
		@(posedge capture_idle);
		$display("FSM is idle");

		repeat (1000) @(posedge tx_clk);
		
		check_histogram_count();

		$finish;
		
	
	end
	
endmodule