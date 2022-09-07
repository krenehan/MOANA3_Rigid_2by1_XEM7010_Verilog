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
`define TIME_OK_WAIT 50000

module xem6010_top_tb;

	// TEST SETTINGS
	localparam NUMBER_OF_CHIPS = 2;
	localparam NUMBER_OF_CAPTURES = 2;
	localparam NUMBER_OF_FRAMES = 16'd1;
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
    localparam MASTER_PIPE_BITS_PER_WORD = 32;
	
	// Calculated based on test settings
	localparam MASTER_PIPE_WORDS_PER_TRANSFER = NUMBER_OF_BINS * BITS_PER_BIN / MASTER_PIPE_BITS_PER_WORD;
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
	assign test_pattern[0] = TEST_PATTERN_0;
	assign test_pattern[1] = TEST_PATTERN_1;
	

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
	
	// DDR3 signals
	wire 	[15:0] 		ddr3_dq;
	wire 	[14:0] 		ddr3_addr;
	wire 	[2:0]  		ddr3_ba;
	wire          			ddr3_ras_n;
	wire          			ddr3_cas_n;
	wire          			ddr3_we_n;
	wire          			ddr3_odt;
	wire          			ddr3_cke;
	wire 	[1:0]  		ddr3_dm;
	wire 	[1:0]  		ddr3_dqs_p;
	wire 	[1:0]  		ddr3_dqs_n;
	wire          			ddr3_ck_p;
	wire          			ddr3_ck_n;
	wire          			ddr3_reset_n;
	
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
	


	// XEM7010
	xem6010_top uut (
		.hi_in(hi_in), 
		.hi_out(hi_out), 
		.hi_inout(hi_inout), 
		.hi_aa(hi_aa),
		.hi_muxsel(hi_muxsel), 
		.sys_clk_p(sys_clk_p), 
		.sys_clk_n(sys_clk_n),
		.led(), 
		.MC1(MC1)
//		.ddr3_dq(ddr3_dq),
//		.ddr3_addr(ddr3_addr),
//		.ddr3_ba(ddr3_ba),
//		.ddr3_ras_n(ddr3_ras_n),
//		.ddr3_cas_n(ddr3_cas_n),
//		.ddr3_we_n(ddr3_we_n),
//		.ddr3_odt(ddr3_odt),
//		.ddr3_cke(ddr3_cke),
//		.ddr3_dm(ddr3_dm),
//		.ddr3_dqs_p(ddr3_dqs_p),
//		.ddr3_dqs_n(ddr3_dqs_n),
//		.ddr3_ck_p(ddr3_ck_p),
//		.ddr3_ck_n(ddr3_ck_n),
//		.ddr3_reset_n(ddr3_reset_n)
		
	);
	
	
	// MOANA3 ICs
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
	
//	// DDR3 SDRAM
//	ddr3  u_ddr3(
//			.rst_n				(ddr3_reset_n),
//			.ck					(ddr3_ck_p),
//			.ck_n				(ddr3_ck_n),
//			.cke				(ddr3_cke),
//			.cs_n				(1'b0),
//			.ras_n				(ddr3_ras_n),
//			.cas_n				(ddr3_cas_n),
//			.we_n				(ddr3_we_n),
//			.dm_tdqs			(),
//			.ba					(ddr3_ba),
//			.addr				(ddr3_addr),
//			.dq					(ddr3_dq),
//			.dqs				(ddr3_dqs_p),
//			.dqs_n				(ddr3_dqs_n),
//			.tdqs_n				(),
//			.odt				(ddr3_odt)
//);
	
	
	
	
	task fpga_logic_reset;
		begin
			$display("TIME %0t: INFO: resetting FPGA logic", $time);
			SetWireInValue(ADDR_WIREIN_MSGCTRL, MSGCTRL_RST, NO_MASK);
			UpdateWireIns;
			SetWireInValue(ADDR_WIREIN_MSGCTRL, MSGCTRL_FIFO_RST, NO_MASK);
			UpdateWireIns;
			SetWireInValue(ADDR_WIREIN_MSGCTRL, NONE, NO_MASK);
			UpdateWireIns;
			$display("TIME %0t: INFO: done resetting FPGA logic", $time);
		end
	endtask
	
	
	task cell_reset;
		begin
			// Send WireIn reset signal
			$display("TIME %0t: INFO: resetting chips", $time);
			SetWireInValue(ADDR_WIREIN_SIGNAL, SIGNAL_CELL_RST, NO_MASK);
			UpdateWireIns;
			SetWireInValue(ADDR_WIREIN_SIGNAL, NONE, NO_MASK);
			UpdateWireIns;
			$display("TIME %0t: INFO: done resetting chips", $time);
		end
	endtask
	
	task scan_reset;
		begin
			// Send WireIn scan reset signal
			$display("TIME %0t: INFO: resetting scan chains", $time);
			SetWireInValue(ADDR_WIREIN_SIGNAL, SIGNAL_SCAN_RST, NO_MASK);
			UpdateWireIns;
			SetWireInValue(ADDR_WIREIN_SIGNAL, NONE, NO_MASK);
			UpdateWireIns;
			$display("TIME %0t: INFO: done resetting scan chains", $time);
		end
	endtask
	
	task reset_mmcm;
		begin
			$display("TIME %0t: INFO: resetting MMCM", $time);
			tiehi_power_signal(SIGNAL_MMCM_RST);
			UpdateWireIns;
			tielo_power_signal(SIGNAL_MMCM_RST);
			UpdateWireIns;
			$display("TIME %0t: INFO: done resetting MMCM", $time);
		end
	endtask
	
	task start_mmcm;
		begin
			$display("TIME %0t: INFO: enabling MMCM", $time);
			tiehi_power_signal(SIGNAL_REF_CLK_MMCM_ENABLE);
			UpdateWireIns;
			$display("TIME %0t: INFO: done enabling MMCM", $time);
		end
	endtask
		
	
	task send_frame_data;
		begin
			$display("TIME %0t: INFO: sending frame data to FrameController", $time);
			
			// Set number of frames
			SetWireInValue(ADDR_WIREIN_FRAME, NUMBER_OF_FRAMES, NO_MASK);
			$display("TIME %0t: INFO: number of frames is %d", $time, NUMBER_OF_FRAMES);
			
			// Set patterns per frame
			SetWireInValue(ADDR_WIREIN_PATTERN, PATTERNS_PER_FRAME, NO_MASK);
			$display("TIME %0t: INFO: patterns per frame is %d", $time, PATTERNS_PER_FRAME);
			
			// Set measurements per pattern
			SetWireInValue(ADDR_WIREIN_MEASUREMENT_LSB, measurements_per_pattern_lsb, NO_MASK);
			SetWireInValue(ADDR_WIREIN_MEASUREMENT_MSB, measurements_per_pattern_msb, NO_MASK);
			$display("TIME %0t: INFO: measurements per pattern is %d", $time, MEASUREMENTS_PER_PATTERN);
			
			// Set pad captured mask
			SetWireInValue(ADDR_WIREIN_PAD_CAPTURED_MASK, PAD_CAPTURED_MASK, NO_MASK);
			$display("TIME %0t: INFO: pad captured mask is %b", $time, PAD_CAPTURED_MASK);
			
			// Update wire ins
			UpdateWireIns;
			
			$display("TIME %0t: INFO: done sending frame data to FrameController", $time);
		end
	endtask
	
	task send_data_stream_config;
		begin
			$display("TIME %0t: INFO: sending stream data to FrameController", $time);
			
			// Set words per transfer
			SetWireInValue(ADDR_WIREIN_STREAM, MASTER_PIPE_WORDS_PER_TRANSFER[15:0], NO_MASK);
			$display("TIME %0t: INFO: words per transfer is %d", $time, MASTER_PIPE_WORDS_PER_TRANSFER);
			
			// Update wire ins
			UpdateWireIns;
			
			$display("TIME %0t: INFO: done sending stream data to FrameController", $time);
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
			$display("TIME %0t: INFO: capture idle: %d", $time, ~(frame_controller_wire_out_register & SIGNAL_CAPTURE_IDLE));
		end
	endtask
	
	task run_capture;
		begin
			$display("TIME %0t: INFO: starting capture", $time);
			
			// Set scan done
			$display("TIME %0t: INFO: setting scan done", $time);
			tiehi_fc_signal(SIGNAL_SCAN_DONE);
			UpdateWireIns;
			
			// Set frame data sent
			$display("TIME %0t: INFO: setting frame data sent", $time);
			tiehi_fc_signal(SIGNAL_FRAME_DATA_SENT);
			UpdateWireIns;
			
			// Check frame data received
			$display("TIME %0t: INFO: checking for frame data received", $time);
			UpdateWireOuts;
			frame_controller_wire_out_register = GetWireOutValue(ADDR_WIREOUT_SIGNAL);
			
			// Wait for frame data received to be asserted
			while (!(frame_controller_wire_out_register[6] === 1'b1)) begin
				$display("TIME %0t: INFO: waiting for frame data received", $time);
				UpdateWireOuts;
				frame_controller_wire_out_register = GetWireOutValue(ADDR_WIREOUT_SIGNAL);
				#(`TIME_OK_WAIT);
			end
			$display("TIME %0t: INFO: received frame data received", $time);
			
			// Unset frame data sent
			$display("TIME %0t: INFO: unsetting frame data sent", $time);
			tielo_fc_signal(SIGNAL_FRAME_DATA_SENT);
			
			// Unset capture start
			$display("TIME %0t: INFO: setting capture start", $time);
			tiehi_fc_signal(SIGNAL_CAPTURE_START);
			
			// Check for capture done
			$display("TIME %0t: INFO: checking for capture done", $time);
			UpdateWireOuts;
			frame_controller_wire_out_register = GetWireOutValue(ADDR_WIREOUT_SIGNAL);
			
			// Wait for capture done to be asserted
			while (!( frame_controller_wire_out_register[8] === 1'b1 )) begin
				$display("TIME %0t: INFO: waiting for capture done", $time);
				UpdateWireOuts;
				frame_controller_wire_out_register = GetWireOutValue(ADDR_WIREOUT_SIGNAL);
				#(`TIME_OK_WAIT);
			end
			$display("TIME %0t: INFO: received capture done", $time);
			
			// Unset capture start
			$display("TIME %0t: INFO: unsetting capture start", $time);
			tielo_fc_signal(SIGNAL_CAPTURE_START);
			
			// Unset frame data sent
			$display("TIME %0t: INFO: unsetting frame data sent", $time);
			tielo_fc_signal(SIGNAL_FRAME_DATA_SENT);
			
			// Unset scan done
			$display("TIME %0t: INFO: unsetting scan done", $time);
			tielo_fc_signal(SIGNAL_SCAN_DONE);
			
			// Capture complete
			$display("TIME %0t: INFO: capture complete", $time);
		end
	endtask
	
	task read_master_fifo_data;
		begin
			$display("TIME %0t: INFO: reading from pipe out", $time);
			ReadFromPipeOut(ADDR_PIPEOUT_FIFO_MASTER, pipeOutSize);
			$display("TIME %0t: INFO: done reading from pipe out", $time);
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
		integer unshuffled;
		integer padding, packet_1, packet_2;
		integer correct_packet_value;
		integer failed;
		begin
		
			// Keep track of failures
			failed = 0;
			
			// Loop through each frame
			for (frame=0;frame<NUMBER_OF_FRAMES;frame=frame+1) begin
				
				// Calculate the offset for the frame in the chip's packet
				frame_offset = frame * NUMBER_OF_CHIPS * PATTERNS_PER_FRAME * 150 * 32;
				
				// Loop through each pattern
				for (pattern=0;pattern<PATTERNS_PER_FRAME;pattern=pattern+1) begin
				
				// Calculate the offset for the pattern in the frame packet
				pattern_offset = pattern * NUMBER_OF_CHIPS * 150 * 32;
		
					// Loop through each chip
					for (chip=0;chip<NUMBER_OF_CHIPS;chip=chip+1) begin
				
						// Calculate the offset for the chip in the flat pipeout packet
						chip_offset = chip * 150 * 32;
				
						// Find the correct value for the test pattern
						correct_packet_value = test_pattern[chip];
						$display("%0t: VERIFY DATA: CHIP %2d: %0b", $time, chip, correct_packet_value);
					
						// Loop through each bin
						for (bin=0;bin<150;bin=bin+1) begin
						
							// Calculate the offset for the bin in the pattern packet
							bin_offset = bin * 32;
							
							// Calculate total offset for the value of the bin
							offset = chip_offset + frame_offset + pattern_offset + bin_offset;
							
							// Unshuffle data out packet
							unshuffled = { pipeOut_flat[offset +: 16], pipeOut_flat[offset + 16 +: 16] };
							
							// Get test packets
							packet_1 = unshuffled[0 +: 10];
							packet_2 = unshuffled[10 +: 10];
							padding = unshuffled[20 +: 12];
							
							// Print the value
//							$display("PIPE OUT: Capture %0d, Chip %0d, Frame %0d, Pattern %0d, Bin %0d: %12b %10b %10b", capture_number, chip, frame, pattern, bin, padding, packet_2, packet_1);
							
							// Figure out if it's correct
							if ((padding == 0) && (packet_2 == correct_packet_value) && (packet_1 == correct_packet_value)) begin
								$display("TIME %0t: DATA: Capture %2d: Chip %2d: Frame %2d: Pattern %2d: Bin %2d: %12b_%10b_%10b: CORRECT", $time, capture_number, chip, frame, pattern, bin, padding, packet_2, packet_1);
							end else begin
								$display("TIME %0t: DATA: Capture %2d: Chip %2d: Frame %2d: Pattern %2d: Bin %3d: %12b_%10b_%10b: INCORRECT", $time, capture_number, chip, frame, pattern, bin, padding, packet_2, packet_1);
								failed = failed + 1;
							end
							
						end
					end
				end
			end
			
			// Print the number of failures
			if (failed == 0) begin
				$display("TIME %0t: INFO: data out matches expected", $time);
			end else begin
				$display("TIME %0t: INFO: data out does not match what was expected", $time);
				$display("TIME %0t: INFO: %0d non-matching packets were found", $time, failed);
				$finish;
			end
			
		end
	endtask
		
		

	initial begin
		// Initialize clocks
		scan_clk = 0;
		sys_clk_p = 0;
		refclk_pll = 0;
		tx_refclk_pll = 0;
		frame_controller_wire_in_register = 0;
		power_wire_in_register = 0;
		//frame_controller_wire_out_register = 0;
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
			run_capture;
		
			// Read data
			read_master_fifo_data;
			
			// Print the pipeout
			print_pipeOut_flat(k);
			
			// Check the data packet
			//check_data_packet(k, pipeOut_flat, test_pattern_flat);
			
			#(`TIME_OK_WAIT);
			
		end
		
		// End sim
		$display("TIME %0t: INFO: simulation completed successfully", $time);
		$finish;
		
		
	end
	
	// Include okHostCalls
	`include "/users/krenehan/MOANA2/FPGA/generic_scan_4by4_bkp/verilog/frontpanel_usb2_sim/okHostCalls.v"
	
      
endmodule





