`timescale 1ns/1ps

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

//`define SHORTEN_SIM
`define RUN_CONTINUOUS

`define TIME_OK_WAIT 50000

module xem6010_top_tb;

	// Options
	localparam RANDOM_TEST_PATTERN = "False";
	
	// Additional settings derived from options above
	`ifdef SHORTEN_SIM
		localparam OVERRIDE_DATAOUT = "True";
	`else
		localparam OVERRIDE_DATAOUT = "False";
	`endif

	// TEST SETTINGS
	localparam NUMBER_OF_CHIPS = 2;
	localparam NUMBER_OF_CAPTURES = 10;
	localparam NUMBER_OF_FRAMES = 16'd1;
	localparam PATTERNS_PER_FRAME = 16'd1;
	localparam PACKETS_IN_TRANSFER = 16'd1; // Should equal frames * patterns
	localparam PAD_CAPTURED_MASK = 16'b11;
	localparam MEASUREMENTS_PER_PATTERN = 32'd15000;
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
	localparam 		ADDR_WIREIN_PACKETS_IN_TRANSFER						= 8'h11;
    localparam  	ADDR_WIREOUT_STATUS 								=			8'h20;																			// Wire out for FPGA status
    localparam  	ADDR_WIREOUT_SIGNAL 								=			8'h21;																			// Wire out for direct python signal monitoring
	localparam  	ADDR_WIREOUT_FIFOC0F2 							=	        8'h22;																			// Data count for Chip 0, FIFO 1
	localparam  	ADDR_WIREOUT_FIFOC1F2 							=	        8'h22;																			// Data count for Chip 1, FIFO 1
	localparam	ADDR_WIREOUT_FIFOSTATUS 						=			8'h24;																			// FIFO status signals for Chip 0 and Chip 1
    localparam  	ADDR_WIREOUT_EMITTERPATTERNLSB 			= 			8'h25;																			// Emitter pattern register bank LSB
    localparam  	ADDR_WIREOUT_EMITTERPATTERNMSB 			= 			8'h26;																			// Emitter pattern register bank MSB
	localparam 	ADDR_WIREOUT_FIFOSIZE 								= 			8'h27;																			// Max number of words in backend FIFO
	localparam	ADDR_WIREOUT_FCSTATE								=			8'h28;
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
		
	genvar i, dqwd, dqswd;
	integer k;
	wire [31:0] tmp [300:0];
	wire [31:0] tmp2 [300:0];
	
	//	Pattern #                     16   15   14   13   12   11   10   9    8    7    6    5    4    3    2    1
	wire [255:0] pattern_pipe = 256'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0008_0004_0002_0001;
	
	
	//------------------------------------------------------------------------
	// Generate test patterns
	//------------------------------------------------------------------------
	wire [2999:0] test_pattern [NUMBER_OF_CHIPS-1:0];
	wire [2999:0] test_pattern_fixed [NUMBER_OF_CHIPS-1:0];
	wire [2999:0] test_pattern_random [NUMBER_OF_CHIPS-1:0];
	
	// Test pattern 
	assign test_pattern[0] = (RANDOM_TEST_PATTERN == "True") ? test_pattern_random[0]: test_pattern_fixed[0];
	assign test_pattern[1] = (RANDOM_TEST_PATTERN == "True") ? test_pattern_random[1]: test_pattern_fixed[1];
	
	// Random test pattern
	generate for (i=0;i<300;i=i+1) begin
		assign tmp[i] = $urandom();
		assign test_pattern_random[0][(i+1)*10-1:i*10] = tmp[i][9:0];
	end endgenerate

	generate for (i=0;i<300;i=i+1) begin
		assign tmp2[i] = $urandom();
		assign test_pattern_random[1][(i+1)*10-1:i*10] = tmp2[i][9:0];
	end endgenerate
	
	// Fixed test patterns
	assign test_pattern_fixed[0] = {300{TEST_PATTERN_0}};
	assign test_pattern_fixed[1] = {300{TEST_PATTERN_1}};
	
	
	
	
		

	wire [15:0] NO_MASK = 16'hffff;
	reg [15:0] frame_controller_wire_in_register;
	reg [15:0] ram_status_wire_out_register;
	reg [15:0] power_wire_in_register;
	reg [15:0] frame_controller_wire_out_register;
	reg transfer_ready;
	
	reg [15:0] capture_count;
	wire [15:0] frame_count;
	wire [15:0] pattern_count;
	wire [15:0] packets_in_transfer;
	wire [15:0] measurements_per_pattern_msb = (MEASUREMENTS_PER_PATTERN & 32'hFF0000) >> 16;
	wire [15:0] measurements_per_pattern_lsb = (MEASUREMENTS_PER_PATTERN & 32'hFFFF);
	
	// For scan chain
	localparam GlobalScanLength = `DigitalCore_ScanChainLength;
	reg [GlobalScanLength-1:0] ScanBitsRd [NUMBER_OF_CHIPS-1:0];

	// Inputs
	reg [7:0] hi_in;
	
	reg force_dataout;
	
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
  wire                 	ddr3_reset_n;
  wire [15:0]         	ddr3_dq_fpga;
  wire [1:0]          	ddr3_dqs_p_fpga;
  wire [1:0]           	ddr3_dqs_n_fpga;
  wire [14:0]        	ddr3_addr_fpga;
  wire [2:0]        	ddr3_ba_fpga;
  wire         			ddr3_ras_n_fpga;
  wire              	ddr3_cas_n_fpga;
  wire             		ddr3_we_n_fpga;
  wire [1-1:0]       	ddr3_cke_fpga;
  wire [1-1:0]        	ddr3_ck_p_fpga;
  wire [1-1:0]       	ddr3_ck_n_fpga;
  wire 					sys_rst;
  wire					sys_rst_n = ~sys_rst;
  wire                 	init_calib_complete;
  wire              	tg_compare_error;
  wire [1:0]      		ddr3_dm_fpga;
  wire                	ddr3_odt_fpga;
  reg [1:0]           	ddr3_dm_sdram_tmp;
  reg                	ddr3_odt_sdram_tmp;
  wire [15:0]        	ddr3_dq_sdram;
  reg [14:0]          	ddr3_addr_sdram ;
  reg [2:0]          	ddr3_ba_sdram;
  reg              		ddr3_ras_n_sdram;
  reg                	ddr3_cas_n_sdram;
  reg                 	ddr3_we_n_sdram;
  wire  				ddr3_cs_n_sdram;
  wire                	ddr3_odt_sdram;
  reg                 	ddr3_cke_sdram;
  wire [1:0]      		ddr3_dm_sdram;
  wire [1:0]      		ddr3_dqs_p_sdram;
  wire [1:0]         	ddr3_dqs_n_sdram;
  reg                  	ddr3_ck_p_sdram;
  reg                  	ddr3_ck_n_sdram;
	
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
	// Bus control
	//------------------------------------------------------------------------
	always @( * ) begin
		ddr3_ck_p_sdram      <=   ddr3_ck_p_fpga;
		ddr3_ck_n_sdram      <=   ddr3_ck_n_fpga;
		ddr3_addr_sdram   	 <=   ddr3_addr_fpga;
		ddr3_ba_sdram     	 <=   ddr3_ba_fpga;
		ddr3_ras_n_sdram     <=   ddr3_ras_n_fpga;
		ddr3_cas_n_sdram     <=   ddr3_cas_n_fpga;
		ddr3_we_n_sdram      <=   ddr3_we_n_fpga;
		ddr3_cke_sdram       <=   ddr3_cke_fpga;
	end
	
	assign ddr3_cs_n_sdram =  1'b0;
	
	
	always @( * ) ddr3_dm_sdram_tmp <=  ddr3_dm_fpga; //DM signal generation
	assign ddr3_dm_sdram = ddr3_dm_sdram_tmp;
	
	
	always @( * ) ddr3_odt_sdram_tmp  <= ddr3_odt_fpga;
	assign ddr3_odt_sdram =  ddr3_odt_sdram_tmp;
    

	// Controlling the bi-directional BUS
	generate
		for (dqwd = 1;dqwd < 16;dqwd = dqwd+1) begin : dq_delay
		  WireDelay #
		   (
			.Delay_g    (0.0),
			.Delay_rd   (0.0),
			.ERR_INSERT ("OFF")
		   )
		  u_delay_dq
		   (
			.A             (ddr3_dq_fpga[dqwd]),
			.B             (ddr3_dq_sdram[dqwd]),
			.reset         (sys_rst_n),
			.phy_init_done (init_calib_complete)
		   );
		end
			  WireDelay #
		   (
			.Delay_g    (0.0),
			.Delay_rd   (0.0),
			.ERR_INSERT ("OFF")
		   )
		  u_delay_dq_0
		   (
			.A             (ddr3_dq_fpga[0]),
			.B             (ddr3_dq_sdram[0]),
			.reset         (sys_rst_n),
			.phy_init_done (init_calib_complete)
		   );
	endgenerate

	generate
		for (dqswd = 0;dqswd < 2;dqswd = dqswd+1) begin : dqs_delay
		  WireDelay #
		   (
			.Delay_g    (0.0),
			.Delay_rd   (0.0),
			.ERR_INSERT ("OFF")
		   )
		  u_delay_dqs_p
		   (
			.A             (ddr3_dqs_p_fpga[dqswd]),
			.B             (ddr3_dqs_p_sdram[dqswd]),
			.reset         (sys_rst_n),
			.phy_init_done (init_calib_complete)
		   );
		
		  WireDelay #
		   (
			.Delay_g    (0.0),
			.Delay_rd   (0.0),
			.ERR_INSERT ("OFF")
		   )
		  u_delay_dqs_n
		   (
			.A             (ddr3_dqs_n_fpga[dqswd]),
			.B             (ddr3_dqs_n_sdram[dqswd]),
			.reset         (sys_rst_n),
			.phy_init_done (init_calib_complete)
		   );
		end
	endgenerate


	// XEM7010
	xem6010_top uut (
		.hi_in			(hi_in), 
		.hi_out			(hi_out), 
		.hi_inout		(hi_inout), 
		.hi_aa			(hi_aa),
		.hi_muxsel		(hi_muxsel), 
		.sys_clk_p		(sys_clk_p), 
		.sys_clk_n		(sys_clk_n),
		.led			(), 
		.MC1			(MC1),
		.ddr3_dq		(ddr3_dq_fpga),
		.ddr3_addr		(ddr3_addr_fpga),
		.ddr3_ba		(ddr3_ba_fpga),
		.ddr3_ras_n		(ddr3_ras_n_fpga),
		.ddr3_cas_n		(ddr3_cas_n_fpga),
		.ddr3_we_n		(ddr3_we_n_fpga),
		.ddr3_odt		(ddr3_odt_fpga),
		.ddr3_cke		(ddr3_cke_fpga),
		.ddr3_dm		(ddr3_dm_fpga),
		.ddr3_dqs_p		(ddr3_dqs_p_fpga),
		.ddr3_dqs_n		(ddr3_dqs_n_fpga),
		.ddr3_ck_p		(ddr3_ck_p_fpga),
		.ddr3_ck_n		(ddr3_ck_n_fpga),
		.ddr3_reset_n	(ddr3_reset_n), 
		.sys_rst		(sys_rst),
		.init_calib_complete(init_calib_complete)
		
	);
	
	
	// MOANA3 ICs
	generate 
		for (i = 0; i < NUMBER_OF_CHIPS; i = i+1) begin
	
		DigitalCore   
			#(	.OVERRIDE_DATAOUT(OVERRIDE_DATAOUT)) 
			IC       (     
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
			.ScanBitsWr(ScanBitsRd[i]),
			
			.test_pattern(test_pattern[i]),
			.force_dataout(force_dataout)
			);
			
		end 
	endgenerate
	
	
	
	// DDR3 SDRAM
	ddr3_model  u_ddr3(
			.rst_n				(ddr3_reset_n),
			.ck					(ddr3_ck_p_sdram),
			.ck_n				(ddr3_ck_n_sdram),
			.cke				(ddr3_cke_sdram),
			.cs_n				(ddr3_cs_n_sdram),
			.ras_n				(ddr3_ras_n_sdram),
			.cas_n				(ddr3_cas_n_sdram),
			.we_n				(ddr3_we_n_sdram),
			.dm_tdqs			(ddr3_dm_sdram[1:0]),
			.ba					(ddr3_ba_sdram),
			.addr				(ddr3_addr_sdram),
			.dq					(ddr3_dq_sdram),
			.dqs				(ddr3_dqs_p_sdram),
			.dqs_n				(ddr3_dqs_n_sdram),
			.tdqs_n				(),
			.odt				(ddr3_odt_sdram)
);
	
	
	// Include helpful tasks
	`include "/users/krenehan/MOANA3/FPGA/MOANA3_Rigid_2by1_XEM7010_Verilog/MOANA2/MOANA2.srcs/sim_1/imports/sim/xem6010_top_tasks.v"


	initial begin
	
		// Initialize registers
		scan_clk = 0;
		sys_clk_p = 0;
		refclk_pll = 0;
		tx_refclk_pll = 0;
		frame_controller_wire_in_register = 0;
		power_wire_in_register = 0;
		ram_status_wire_out_register = 0;
		frame_controller_wire_out_register = 0;
		force_dataout = 0;
		transfer_ready = 0;
		
		for (k=0;k<NUMBER_OF_CHIPS;k=k+1) begin
			//global_scan_in_data[k] = 0;
			ScanBitsRd[k] = 0;
		end
		
		repeat (10) @(posedge sys_clk_p);

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
		
		`ifdef RUN_CONTINUOUS
		
			// Set FSM bypass
			$display("TIME %0t: INFO: setting FSM bypass", $time);
			tiehi_fc_signal(SIGNAL_FSM_BYPASS);
			#(5000000);
			
		`endif
		
		// Main capture and readout loop
		for (k=0;k<NUMBER_OF_CAPTURES;k=k+1) begin
		
			// Set the capture count
			capture_count = k;
			
			`ifdef RUN_CONTINUOUS
			
				// Wait for transfer ready signal
				check_transfer_ready;
				check_transfer_ready;
				while (!(transfer_ready === 1'b1)) begin
					$display("TIME %0t: INFO: waiting for transfer ready", $time);
					#(`TIME_OK_WAIT);
					check_transfer_ready;
				end
			
			`elsif SHORTEN_SIM
			
				// Force histogram streamout
				init_capture;
				force_histogram;
				#(`TIME_OK_WAIT);
				force_histogram;
			
			`else

				// Run frame controller
				run_capture;
			
			`endif
			
			// Wait before reading from FIFO
			#(`TIME_OK_WAIT);
		
			// Read data
			read_master_fifo_data;
			
			// Print the pipeout
			print_pipeOut_flat(k);
			
	end
	
		`ifdef RUN_CONTINUOUS
		
			// Set FSM bypass
			$display("TIME %0t: INFO: setting FSM bypass", $time);
			tielo_fc_signal(SIGNAL_FSM_BYPASS);
			
		`endif

		// Add some margin at the end of the sim
		#(1000);
		
		// End sim
		$display("TIME %0t: INFO: simulation completed successfully", $time);
		$finish;
		
		
	end
	
	// Include okHostCalls
	`include "/users/krenehan/MOANA2/FPGA/generic_scan_4by4_bkp/verilog/frontpanel_usb2_sim/okHostCalls.v"
	
	
	
      
endmodule





