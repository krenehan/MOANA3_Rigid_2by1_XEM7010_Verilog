`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:22:53 03/01/2022
// Design Name:   xem6010_top
// Module Name:   /users/krenehan/MOANA2/FPGA/generic_scan_4by4_bkp/verilog/sim//xem6010_top_tb.v
// Project Name:  xilinx
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: xem6010_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

//`define SIMULATION_DEBUG_SIGNALS

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

`define  SIMULATION_ONLY
`define TIME_MS 1000000

module xem6010_top_tb;

	// TEST SETTINGS
	localparam NUMBER_OF_CHIPS = 2;
	localparam NUMBER_OF_CAPTURES = 2;
	localparam NUMBER_OF_FRAMES = 16'd2;
	localparam PATTERNS_PER_FRAME = 16'd2;
	localparam PAD_CAPTURED_MASK = 16'b11;
	localparam MEASUREMENTS_PER_PATTERN = 32'd25000;
	localparam TEST_PATTERN_0 = 10'd5;
	localparam TEST_PATTERN_1 = 10'd10;
    
    // Addresses for OK endpoints
    localparam  	ADDR_WIREIN_MSGCTRL 								=			8'h00;																			// Wire in for message control
    localparam  	ADDR_WIREIN_SIGNAL 									=			8'h01;																			// Wire in for direct python signal control  
	localparam	ADDR_WIREIN_POWER									=			8'h02;																			// Wire in for PCB power control
	localparam 	ADDR_WIREIN_FRAME									=			8'h03;																			// Wire in for number of frames
	localparam	ADDR_WIREIN_PATTERN									=			8'h04;																			// Wire in for patterns per frame
	localparam	ADDR_WIREIN_MEASUREMENT_LSB				=        	8'h05;																			// Wire in for measurement control LSB
	localparam	ADDR_WIREIN_MEASUREMENT_MSB				= 			8'h06;																			// Wire in for measurement control MSB
    localparam  	ADDR_WIREIN_FRAMECTRL 							=       	8'h07;																			// Wire in for frame control
    localparam  	ADDR_WIREIN_TRANSFERSIZE 						=       	8'h08;																			// Wire in for specifying expected packet size of emitter pattern 
    localparam  	ADDR_WIREIN_STREAM 									=			8'h09;																			// Wire in for specifying number of transfers to read data
    localparam 	ADDR_WIREIN_PAD_CAPTURED_MASK				=			8'h10;																			// Wire in for masking pad_captured signal based on functional ICs
    localparam  	ADDR_WIREOUT_STATUS 								=			8'h20;																			// Wire out for FPGA status
    localparam  	ADDR_WIREOUT_SIGNAL 								=			8'h21;																			// Wire out for direct python signal monitoring
	localparam  	ADDR_WIREOUT_FIFOC0F2 							=	        8'h22;																			// Data count for Chip 0, FIFO 1
	localparam  	ADDR_WIREOUT_FIFOC1F2 							=	        8'h22;																			// Data count for Chip 1, FIFO 1
	localparam	ADDR_WIREOUT_FIFOSTATUS 						=			8'h24;																			// FIFO status signals for Chip 0 and Chip 1
    localparam  	ADDR_WIREOUT_EMITTERPATTERNLSB 			= 			8'h25;																			// Emitter pattern register bank LSB
    localparam  	ADDR_WIREOUT_EMITTERPATTERNMSB 			= 			8'h26;																			// Emitter pattern register bank MSB
	localparam 	ADDR_WIREOUT_FIFOSIZE 								= 			8'h27;																			// Max number of words in backend FIFO
	localparam	ADDR_WIREOUT_FCSTATE								=			8'h28;																			// Wire out for frame controller state
    localparam  	ADDR_TRIGGERIN_DATASTREAMREADACK 		=      	8'h40;																			// Trigger in for enabling data stream
    localparam  	ADDR_TRIGGEROUT_DATASTREAMREAD 		=			8'h60;																			// Trigger out for data readout during streaming mode
    localparam  	ADDR_PIPEIN_SCAN 										=			8'h80;																			// Pipe in for scan
    localparam  	ADDR_PIPEIN_PATTERN 								=			8'h81;																			// Pipe in for pattern data
    localparam  	ADDR_PIPEOUT_SCAN 									=			8'ha0;																			// Pipe out for scan
	localparam  	ADDR_PIPEOUT_FIFO_0									=			8'ha1;																			// Pipe out for data (Chip 0)
	localparam  	ADDR_PIPEOUT_FIFO_1 									=			8'ha2;																			// Pipe out for data (Chip 1)
	localparam  	ADDR_PIPEOUT_FIFO_MASTER						=			8'hb8;																			// Pipe out master
	
	// Generic empty signal
	localparam NONE = 16'h0000;
	
	// Message control in signals
	localparam MSGCTRL_RST = 16'h0008;
	localparam MSGCTRL_FIFO_RST = 16'h0010;
	
	// Software in signals
	localparam SIGNAL_SCAN_RST = 16'h0001;
	localparam SIGNAL_CELL_RST = 16'h0002;
	
	// Software in power signals
	localparam SIGNAL_REF_CLK_MMCM_ENABLE = 16'h0040;
	localparam SIGNAL_CLK_SELECT_0 = 16'h0080;
	localparam SIGNAL_CLK_SELECT_1 = 16'h0100;
	localparam SIGNAL_MMCM_RST = 16'h0200;
	
	// Software in frame signals
    localparam SIGNAL_SCAN_DONE = 16'h0001;
    localparam SIGNAL_FRAME_DATA_SENT = 16'h0002;
    localparam SIGNAL_CAPTURE_START =  16'h0004;
    localparam SIGNAL_CAPTURE_INTERRUPT = 16'h0008;
    localparam SIGNAL_FRAME_CONTROLLER_RESET = 16'h0010;
    localparam SIGNAL_FSM_BYPASS = 16'h0020;
    localparam SIGNAL_DATA_STREAM = 16'h0040;
	 
    // Software Out Frame Controller Signals
    localparam SIGNAL_CAPTURE_IDLE =           16'h0020;
    localparam SIGNAL_FRAME_DATA_RECEIVED =    16'h0040;
    localparam SIGNAL_CAPTURE_RUNNING =        16'h0080;
    localparam SIGNAL_CAPTURE_DONE =           16'h0100;
    
    localparam NUMBER_OF_BINS = 150;
    localparam BYTES_PER_BIN = 4;
    localparam BITS_PER_BIN = 32;
    localparam BITS_PER_WORD = 16;
	
	// Calculated based on test settings
	localparam WORDS_PER_TRANSFER = NUMBER_OF_FRAMES * PATTERNS_PER_FRAME * NUMBER_OF_BINS * BITS_PER_BIN / BITS_PER_WORD;
	localparam BYTES_PER_TRANSFER = WORDS_PER_TRANSFER * 2;
	
	// For check function - These are the number of packets collected by reading out master fifo
	localparam PACKET_WORDS = NUMBER_OF_CHIPS * WORDS_PER_TRANSFER;
	localparam PACKET_BYTES = PACKET_WORDS * 2;
	localparam PACKET_BITS_UNPADDED = PACKET_WORDS * 20;
	localparam PACKET_BITS = PACKET_WORDS * 16;
	
	genvar i;
	integer k;
	
	//	Pattern #                     16   15   14   13   12   11   10   9    8    7    6    5    4    3    2    1
	wire [255:0] pattern_pipe = 256'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0008_0004_0002_0001;
	
	// Test pattern
	wire [9:0] test_pattern [NUMBER_OF_CHIPS-1:0];
	

	wire [15:0] NO_MASK = 16'hffff;
	reg [15:0] frame_controller_wire_in_register;
	reg [15:0] power_wire_in_register;
	reg [15:0] frame_controller_wire_out_register;
	
	reg [15:0] capture_count;
	wire [15:0] frame_count;
	wire [15:0] pattern_count;
	wire [15:0] measurements_per_pattern_msb = (MEASUREMENTS_PER_PATTERN & 32'hFF0000) >> 16;
	wire [15:0] measurements_per_pattern_lsb = (MEASUREMENTS_PER_PATTERN & 32'hFFFF);
	
	// For scan chain
	localparam GlobalScanLength = `DigitalCore_ScanChainLength;
	reg [GlobalScanLength-1:0] ScanBitsRd [NUMBER_OF_CHIPS-1:0];

	// Inputs
	reg [7:0] hi_in;
	
	//------------------------------------------------------------------------
	// Clocks
	//------------------------------------------------------------------------
	reg refclk_pll;
	reg tx_refclk_pll;
	reg sys_clk_p;
	wire sys_clk_n;
	reg scan_clk;
	always #1000 scan_clk <= ~scan_clk;
	always #10 refclk_pll <= ~refclk_pll;
	always #43 tx_refclk_pll <= ~tx_refclk_pll;
	always #2.5 sys_clk_p <= ~sys_clk_p;
	assign sys_clk_n = ~sys_clk_p;

	// Outputs
	wire [1:0] hi_out;
	wire hi_muxsel;

	// Bidirs
	wire [15:0] hi_inout;
	wire hi_aa;
	wire [25:0] MC1;
	
	// Scan endpoints controlled by FPGA
	wire s_clk_p;
	wire s_clk_n;
	wire s_reset;
	wire [NUMBER_OF_CHIPS-1:0] s_enable;
	wire s_update;
	wire s_in;
	
	// Chip signals
	wire [NUMBER_OF_CHIPS-1:0] s_out;
	wire tx_refclk;
	wire [NUMBER_OF_CHIPS-1:0] tx_dataout;
	wire [NUMBER_OF_CHIPS-1:0] vcsel1_anode;
	wire [NUMBER_OF_CHIPS-1:0] vcsel2_anode;
	wire refclk;
	wire rstasync;
	
	//------------------------------------------------------------------------
	// Begin okHostInterface simulation user configurable  global data
	//------------------------------------------------------------------------
	parameter BlockDelayStates = 5;   // REQUIRED: # of clocks between blocks of pipe data
	parameter ReadyCheckDelay = 5;    // REQUIRED: # of clocks before block transfer before
	                                  //           host interface checks for ready (0-255)
	parameter PostReadyDelay = 5;     // REQUIRED: # of clocks after ready is asserted and
	                                  //           check that the block transfer begins (0-255)
	parameter pipeInSize = 32;      	 // REQUIRED: byte (must be even) length of default
	                                  //           PipeIn; Integer 0-2^32
	parameter pipeOutSize = PACKET_BYTES;     // REQUIRED: byte (must be even) length of default
	                                  //           PipeOut; Integer 0-2^32


	reg  [7:0]  pipeIn [0:(pipeInSize-1)];
	initial for (k=0; k<pipeInSize; k=k+1) pipeIn[k] = 8'h00;

	reg  [7:0]  pipeOut [0:(pipeOutSize-1)];
	initial for (k=0; k<pipeOutSize; k=k+1) pipeOut[k] = 8'h00;

	//------------------------------------------------------------------------
	//  Available User Task and Function Calls:
	//    FrontPanelReset;                  // Always start routine with FrontPanelReset;
	//    SetWireInValue(ep, val, mask);
	//    UpdateWireIns;
	//    UpdateWireOuts;
	//    GetWireOutValue(ep);
	//    ActivateTriggerIn(ep, bit);       // bit is an integer 0-15
	//    UpdateTriggerOuts;
	//    IsTriggered(ep, mask);            // Returns a 1 or 0
	//    WriteToPipeIn(ep, length);        // passes pipeIn array data
	//    ReadFromPipeOut(ep, length);      // passes data to pipeOut array
	//    WriteToBlockPipeIn(ep, blockSize, length);    // pass pipeIn array data; blockSize and length are integers
	//    ReadFromBlockPipeOut(ep, blockSize, length);  // pass data to pipeOut array; blockSize and length are integers
	//
	//    *Pipes operate by passing arrays of data back and forth to the user's
	//    design.  If you need multiple arrays, you can create a new procedure
	//    above and connect it to a differnet array.  More information is
	//    available in Opal Kelly documentation and online support tutorial.
	//------------------------------------------------------------------------
	
	//------------------------------------------------------------------------
	// MC1 Assigns
	//------------------------------------------------------------------------
	
	// Outputs from IC; Inputs to FPGA
	assign MC1[0] = tx_dataout[1];
	assign MC1[1] = s_out[1];
	assign MC1[2] = s_out[0];
	assign MC1[3] = tx_dataout[0];

	// Outputs from FPGA; Inputs to IC
	assign s_enable[1]		= MC1[4];
	assign s_reset				= MC1[5];
	assign s_clk_p				= MC1[6];
	assign s_clk_n				= MC1[7];
	assign s_in					= MC1[8];
	assign rstasync				= MC1[9];
	assign s_update			= MC1[10];
	assign s_enable[0]		= MC1[11];

	// Clock signals - Outputs from FPGA
	assign refclk  				= MC1[12];     // (RefClk)
	assign tx_refclk  			= MC1[13];     // (TxRefClk)
	
	// Unused
	assign MC1[25:14] = 12'b0;
	
	
	//------------------------------------------------------------------------
	// Flatten pipeOut
	//------------------------------------------------------------------------
	wire [PACKET_BITS-1:0] pipeOut_flat;
	generate for (i=0; i<PACKET_BYTES; i=i+2) begin
		assign pipeOut_flat[(i+1)*8 +: 8] = pipeOut[i];
		assign pipeOut_flat[i*8 +: 8] = pipeOut[i+1];
	end endgenerate

	
	//------------------------------------------------------------------------
	
	// Continuously update the ScanBitsRd with the new test pattern
//	generate for (i=0;i<NUMBER_OF_CHIPS;i=i+1) begin
//		always @(*) begin
//			ScanBitsRd[i][`DigitalCore_TestDataIn] = test_pattern[i];
//		end
//	end endgenerate
	


	// Instantiate the FPGA
	xem6010_top uut (
		.hi_in(hi_in), 
		.hi_out(hi_out), 
		.hi_inout(hi_inout), 
		.hi_aa(hi_aa),
		.hi_muxsel(hi_muxsel), 
		.sys_clk_p(sys_clk_p), 
		.sys_clk_n(sys_clk_n), 
//		.ref_clk_pll(refclk_pll),
//		.tx_refclk_mmcm(tx_refclk_pll),
		.led(), 
		.MC1(MC1)
	);
	
	
	
	
	//-----------------------------------------------------------------------------------
    //    Scan Chain Clock Generator
    //-----------------------------------------------------------------------------------
//    ScanClockGen    ClkG    (   .RefClk             (scan_clk),
//                                .Reset              (s_reset_tb),
//                                .ClkEn              (1'b1),
//                                .SClkP              (s_clk_p_tb),
//                                .SClkN              (s_clk_n_tb));    
    //-----------------------------------------------------------------------------------
	
//	 ICs
	generate 
		for (i = 0; i < NUMBER_OF_CHIPS; i = i+1) begin
	
		DigitalCore   IC      (     
			.SClkP(s_clk_p),
			.SClkN(s_clk_n),
			.SReset(s_reset),
			.SEnable(s_enable[i]),
			.SUpdate(s_update),
			.SIn(s_in),
			.SOut(s_out[i]),

			.TxRefClk(tx_refclk),
			.TriggerExt(1'b0),
			.TxDataOut(tx_dataout[i]),
			.VCSEL1_Anode(vcsel1_anode[i]),
			.VCSEL2_Anode(vcsel2_anode[i]),

			.StartExt(1'b0),
			.StopExt(1'b0),
			.RefClk(refclk),
			.RstAsync(rstasync),
			.ScanBitsRd(),
			.ScanBitsWr(ScanBitsRd[i])
			);
			
		end 
	endgenerate
	
	task fpga_logic_reset;
		begin
			$display("Resetting FPGA logic");
			SetWireInValue(ADDR_WIREIN_MSGCTRL, MSGCTRL_RST, NO_MASK);
			UpdateWireIns;
			SetWireInValue(ADDR_WIREIN_MSGCTRL, MSGCTRL_FIFO_RST, NO_MASK);
			UpdateWireIns;
			SetWireInValue(ADDR_WIREIN_MSGCTRL, NONE, NO_MASK);
			UpdateWireIns;
		end
	endtask
	
	
	task cell_reset;
		begin
			// Send WireIn reset signal
			$display("Resetting chips");
			SetWireInValue(ADDR_WIREIN_SIGNAL, SIGNAL_CELL_RST, NO_MASK);
			UpdateWireIns;
			SetWireInValue(ADDR_WIREIN_SIGNAL, NONE, NO_MASK);
			UpdateWireIns;
		end
	endtask
	
	task scan_reset;
		begin
			// Send WireIn scan reset signal
			$display("Resetting scan chains");
			SetWireInValue(ADDR_WIREIN_SIGNAL, SIGNAL_SCAN_RST, NO_MASK);
			UpdateWireIns;
			SetWireInValue(ADDR_WIREIN_SIGNAL, NONE, NO_MASK);
			UpdateWireIns;
		end
	endtask
	
	task reset_mmcm;
		begin
			$display("Resetting MMCM");
			tiehi_power_signal(SIGNAL_MMCM_RST);
			UpdateWireIns;
			tielo_power_signal(SIGNAL_MMCM_RST);
			UpdateWireIns;
		end
	endtask
	
	task start_mmcm;
		begin
			$display("Enabling MMCM");
			tiehi_power_signal(SIGNAL_REF_CLK_MMCM_ENABLE);
			UpdateWireIns;
		end
	endtask
		
	
	task send_frame_data;
		begin
			$display("Sending frame data to FrameController");
			SetWireInValue(ADDR_WIREIN_FRAME, NUMBER_OF_FRAMES, NO_MASK);
			$display("Number of frames is %d", NUMBER_OF_FRAMES);
			SetWireInValue(ADDR_WIREIN_PATTERN, PATTERNS_PER_FRAME, NO_MASK);
			$display("Patterns per frame is %d", PATTERNS_PER_FRAME);
			SetWireInValue(ADDR_WIREIN_MEASUREMENT_LSB, measurements_per_pattern_lsb, NO_MASK);
			SetWireInValue(ADDR_WIREIN_MEASUREMENT_MSB, measurements_per_pattern_msb, NO_MASK);
			$display("Measurements per pattern is %d", MEASUREMENTS_PER_PATTERN);
			SetWireInValue(ADDR_WIREIN_PAD_CAPTURED_MASK, PAD_CAPTURED_MASK, NO_MASK);
			$display("Pad captured mask is %b", PAD_CAPTURED_MASK);
			UpdateWireIns;
		end
	endtask
	
	task send_data_stream_config;
		begin
			$display("Sending stream data to FrameController");
			SetWireInValue(ADDR_WIREIN_STREAM, WORDS_PER_TRANSFER[15:0], NO_MASK);
			UpdateWireIns;
			$display("Words per transfer is %d", WORDS_PER_TRANSFER);
		end
	endtask
	
	task tiehi_fc_signal;
		input [15:0] signal;
		begin
			frame_controller_wire_in_register = frame_controller_wire_in_register | signal;
			SetWireInValue(ADDR_WIREIN_FRAMECTRL, frame_controller_wire_in_register, NO_MASK);
			UpdateWireIns;
		end
	endtask
	
	task tielo_fc_signal;
		input [15:0] signal;
		begin
			frame_controller_wire_in_register = frame_controller_wire_in_register & (~signal);
			SetWireInValue(ADDR_WIREIN_FRAMECTRL, frame_controller_wire_in_register, NO_MASK);
			UpdateWireIns;
		end
	endtask
	
	task tiehi_power_signal;
		input [15:0] signal;
		begin
			power_wire_in_register = power_wire_in_register | signal;
			SetWireInValue(ADDR_WIREIN_POWER, power_wire_in_register, NO_MASK);
			UpdateWireIns;
		end
	endtask
	
	task tielo_power_signal;
		input [15:0] signal;
		begin
			power_wire_in_register = power_wire_in_register & (~signal);
			SetWireInValue(ADDR_WIREIN_POWER, power_wire_in_register, NO_MASK);
			UpdateWireIns;
		end
	endtask
	
	task check_capture_idle;
		begin
			UpdateWireOuts;
			frame_controller_wire_out_register = GetWireOutValue(ADDR_WIREOUT_SIGNAL);
			$display("Capture idle: %d", ~(frame_controller_wire_out_register & SIGNAL_CAPTURE_IDLE));
		end
	endtask
	
	task run_capture;
		begin
			$display("Running capture");
			$display("Set: scan done");
			tiehi_fc_signal(SIGNAL_SCAN_DONE);
			UpdateWireIns;
			$display("Set: frame data sent");
			tiehi_fc_signal(SIGNAL_FRAME_DATA_SENT);
			UpdateWireIns;
			$display("Check: frame data received");
			while (!(frame_controller_wire_out_register & SIGNAL_FRAME_DATA_RECEIVED)) begin
				UpdateWireOuts;
				frame_controller_wire_out_register = GetWireOutValue(ADDR_WIREOUT_SIGNAL);
				#(`TIME_MS);
			end
			$display("Unset: frame data sent");
			tielo_fc_signal(SIGNAL_FRAME_DATA_SENT);
			$display("Set: capture start");
			tiehi_fc_signal(SIGNAL_CAPTURE_START);
			$display("Check: capture done");
			while (!(frame_controller_wire_out_register & SIGNAL_CAPTURE_DONE)) begin
				UpdateWireOuts;
				frame_controller_wire_out_register = GetWireOutValue(ADDR_WIREOUT_SIGNAL);
				#(`TIME_MS);
			end
			$display("Unset: capture start");
			tielo_fc_signal(SIGNAL_CAPTURE_START);
			$display("Unset: frame data sent");
			tielo_fc_signal(SIGNAL_FRAME_DATA_SENT);
			$display("Unset: scan done");
			tielo_fc_signal(SIGNAL_SCAN_DONE);
			$display("Capture complete");
		end
	endtask
	
	task read_master_fifo_data;
		begin
		ReadFromPipeOut(ADDR_PIPEOUT_FIFO_MASTER, pipeOutSize);
		end
	endtask
	
	
//	// Scan in some number of bits
//	task scan_in;
//
//		integer                             i;
//
//		begin
//			@(posedge s_clk_p_tb);
//			scan_tb_control <= 1'b1;
//			@(posedge s_clk_p_master);
//			for (i=0;i<NUMBER_OF_CHIPS;i=i+1) begin
//				ScanBitsRd[i] = global_scan_in_data[i][GlobalScanLength-1:0];
//			end
//			@(posedge s_clk_p_master);
//			scan_update;
//			
//		end
//	endtask
//
//	// Scan update
//	task scan_update;
//	  begin
//			s_update_tb = 1'b1;
//			@(posedge s_clk_p_master);
//			s_update_tb = 1'b0;
//			@(posedge s_clk_p_master);
//			scan_tb_control <= 1'b0;
//			@(posedge s_clk_p_tb);
//	  end
//	endtask
	
	// Print pipeOut values
	task print_pipeOut_flat;
		input [15:0] capture_number;
		integer chip, frame, pattern, bin;
		integer chip_offset, frame_offset, pattern_offset, bin_offset, offset;
		begin
		
			// Loop through each chip
			for (chip=0;chip<NUMBER_OF_CHIPS;chip=chip+1) begin
			
				// Calculate the offset for the chip in the flat pipeout packet
				chip_offset = chip * NUMBER_OF_FRAMES * PATTERNS_PER_FRAME * 150 * 32;
				
				// Loop through each frame
				for (frame=0;frame<NUMBER_OF_FRAMES;frame=frame+1) begin
				
					// Calculate the offset for the frame in the chip's packet
					frame_offset = frame * PATTERNS_PER_FRAME * 150 * 32;
					
					// Loop through each pattern
					for (pattern=0;pattern<PATTERNS_PER_FRAME;pattern=pattern+1) begin
					
					// Calculate the offset for the pattern in the frame packet
					pattern_offset = pattern * 150 * 32;
					
						// Loop through each bin
						for (bin=0;bin<150;bin=bin+1) begin
						
							// Calculate the offset for the bin in the pattern packet
							bin_offset = bin * 32;
							
							// Calculate total offset for the value of the bin
							offset = chip_offset + frame_offset + pattern_offset + bin_offset;
							
							// Calculate the pipe out value
							
							// Print the value
							$display("PIPE OUT: Capture %0d, Chip %0d, Frame %0d, Pattern %0d, Bin %0d: %b %b", capture_number, chip, frame, pattern, bin, pipeOut_flat[offset +: 16], pipeOut_flat[offset + 16 +: 16]);
							
						end
					end
				end
			end
		end
	endtask
	
	
	function [NUMBER_OF_CHIPS-1:0] check_data_packet;
		input [15:0] capture_number;
		input [PACKET_BITS-1:0] fifo_data_flat;
		input [NUMBER_OF_CHIPS*10-1:0] pattern_flat;
		reg [PACKET_BITS-1:0] packet_data;
		reg [PACKET_BITS_UNPADDED-1:0] packet_data_unpadded;
		reg [NUMBER_OF_CHIPS-1:0] passed;
		reg [PACKET_BITS-1:0] shift_reg;
		reg [31:0] i;
		reg [9:0] pattern_holder;		
		reg [31:0] chip, frame, pattern, bin;
		reg [31:0] chip_offset, frame_offset, pattern_offset, bin_offset, offset;
		begin
			
			// Display some info
			$display("check_data_packet function called");
			$display("Number Of Chips: %0d", NUMBER_OF_CHIPS);
			$display("Packet Words: %d0", PACKET_WORDS);
			$display("Packet Bytes: %0d", PACKET_BYTES);
			$display("Packet Bits: %0d", PACKET_BITS);
			$display("Packet Bits Unpadded: %0d", PACKET_BITS_UNPADDED);

		
			// Unpad the data
			shift_reg = fifo_data_flat;
			for (i=0;i<PACKET_WORDS;i=i+1) begin
			
				// Display information
				$display("Shift register data is %b", shift_reg[31:0]);
			
				// Get 20 bits
				packet_data_unpadded[i*20 +: 20] = shift_reg[19:0];
				$display("Packet data is %b", packet_data_unpadded[i*20 +: 20]);
				
				// Shift out 32 bits
				shift_reg = {32'b0, shift_reg[PACKET_BITS-1:32]};
				
			end
			
			// Assume passed
			passed = {NUMBER_OF_CHIPS{1'b1}};
			
			// Check the packets
			for (chip=0;chip<NUMBER_OF_CHIPS;chip=chip+1) begin
				
				// Chip index offset
				chip_offset = chip * NUMBER_OF_FRAMES * PATTERNS_PER_FRAME * 300 * 10;
				
				for (frame=0;frame<NUMBER_OF_FRAMES;frame=frame+1) begin
				
					// Frame index offset
					frame_offset = frame * PATTERNS_PER_FRAME * 300 * 10;
					
					for (pattern=0;pattern<PATTERNS_PER_FRAME;pattern=pattern+1) begin
					
					// Pattern index offset
					pattern_offset = pattern * 300 * 10;
					
						for (bin=0;bin<300;bin=bin+1) begin
						
							// Bin offset
							bin_offset = bin * 10;
							
							// Calculate the actual offset and check the packet is correct
							offset = chip_offset + frame_offset + pattern_offset + bin_offset;
							
							// Calculate the correct test pattern value
							pattern_holder = pattern_flat[10*chip +: 10] + capture_number + frame + pattern;
							$display("PATTERN HOLDER: %d", pattern_holder);
							
							if (packet_data_unpadded[offset +: 10] == pattern_holder) begin
								$display("TEST BIN PASS: Capture %0d, Chip %0d, Frame %0d, Pattern %0d, Bin %0d: %d", capture_number, chip, frame, pattern, bin, packet_data_unpadded[offset +: 10]);
							end else begin
								$display("TEST BIN FAIL: Capture %0d, Chip %0d, Frame %0d, Pattern %0d, Bin %0d: %d", capture_number, chip, frame, pattern, bin, packet_data_unpadded[offset +: 10]);
								passed[chip] = 1'b0;
							end
							
						end
					end
				end
			end
			
			// Report results
			for (chip=0;chip<NUMBER_OF_CHIPS;chip=chip+1) begin
				if (passed[chip]) begin
					$display("TEST CAPTURE PASS: Chip %0d, Capture %0d", chip, capture_number);
				end else begin
					$display("TEST CAPTURE FAIL: Chip %0d, Capture %0d", chip, capture_number);
				end
			end
			
			// Finish function
			check_data_packet = passed;
			
		end
	endfunction
		
		

	initial begin
		// Initialize clocks
		scan_clk = 0;
		sys_clk_p = 0;
		refclk_pll = 0;
		tx_refclk_pll = 0;
		frame_controller_wire_in_register = 0;
		power_wire_in_register = 0;
		frame_controller_wire_out_register = 0;
		for (k=0;k<NUMBER_OF_CHIPS;k=k+1) begin
			//global_scan_in_data[k] = 0;
			ScanBitsRd[k] = 0;
		end

		// Reset FPGA endpoint
		FrontPanelReset;
		
		// Reset MMCM
		reset_mmcm;
		
		// Start MMCM
		start_mmcm;
		
		// Reset the FPGA logic
		fpga_logic_reset;
        
		// Reset scan chain
		scan_reset;
		
		// Reset chips
		cell_reset;
		
		// Set scan bits
		for (k=0;k<NUMBER_OF_CHIPS;k=k+1) begin
			ScanBitsRd[k][`DigitalCore_MeasCountEnable] = 1'b1;
			ScanBitsRd[k][`DigitalCore_TestPattEnable] = 1'b1;
			ScanBitsRd[k][`DigitalCore_DriverDLLWord] = 4'b0010;
			ScanBitsRd[k][`DigitalCore_VCSELEnableControlledByScan] = 1'b0;
			ScanBitsRd[k][`DigitalCore_VCSELWave1Enable] = 1'b1;
			ScanBitsRd[k][`DigitalCore_VCSELWave2Enable] = 1'b1;
			ScanBitsRd[k][`DigitalCore_MeasPerPatt] = MEASUREMENTS_PER_PATTERN[24:0];
		end
		
		// Test data in
		ScanBitsRd[0][`DigitalCore_TestDataIn] = TEST_PATTERN_0;
		ScanBitsRd[1][`DigitalCore_TestDataIn] = TEST_PATTERN_1;

		//Scan configuration settings in
		//scan_in;
		
		// Configure frame controller settings
		send_frame_data;
		for (k=0; k<pipeInSize; k=k+2) begin 
			pipeIn[k] = pattern_pipe[(k+1)*8 +: 8];
			pipeIn[k+1] = pattern_pipe[k*8 +: 8];
		end
		WriteToPipeIn(ADDR_PIPEIN_PATTERN, pipeInSize);
		send_data_stream_config;
		
		// Reset chips
		cell_reset;
		
		// Main capture and readout loop
		for (k=0;k<NUMBER_OF_CAPTURES;k=k+1) begin
		
			// Set the capture count
			capture_count = k;
		
			// Run frame controller
			$display("Starting capture %0d", k);
			run_capture;
		
			// Read data
			read_master_fifo_data;
			
			// Print the pipeout
			print_pipeOut_flat(k);
			
			// Check the data packet
			//check_data_packet(k, pipeOut_flat, test_pattern_flat);
			
			#(`TIME_MS);
			
		end
		
		// End sim
		$finish;
		
		
	end
	
	// Include okHostCalls
	`include "/users/krenehan/MOANA2/FPGA/generic_scan_4by4_bkp/verilog/frontpanel_usb2_sim/okHostCalls.v"
	
      
endmodule





