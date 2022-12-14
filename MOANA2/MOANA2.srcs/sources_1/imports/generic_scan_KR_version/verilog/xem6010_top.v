`timescale 1ns / 1ps

// Clock selecion
`define INTERNAL_CLOCKS
//`define EXTERNAL_CLOCKS

// Simulation flag
`define SIMULATION

//=============================================================================
//  Top-level verilog module for the XEM7010 Opal Kelly Board
//=============================================================================
module xem6010_top 	(

`ifdef SIMULATION
	output reg sys_rst, 
	output wire init_calib_complete,
`endif

	// OK interface
	input		wire		[7:0]			hi_in,
	output		wire		[1:0]			hi_out,
	inout		wire		[15:0]		hi_inout,
	inout		wire        				hi_aa,
	output		wire						hi_muxsel,
	
	// System clock
	input		wire						sys_clk_p,
	input		wire						sys_clk_n,  
	
	// LEDs
	output		wire		[7:0]			led,
	
	// User signals
	inout		wire		[25:0]		MC1,
	
	// DRAM connections
	inout  		wire 	[15:0] 		ddr3_dq,
	output 		wire 	[14:0] 		ddr3_addr,
	output 		wire 	[2:0]  		ddr3_ba,
	output 		wire          			ddr3_ras_n,
	output 		wire          			ddr3_cas_n,
	output 		wire          			ddr3_we_n,
	output 		wire          			ddr3_odt,
	output 		wire          			ddr3_cke,
	output 		wire 	[1:0]  		ddr3_dm,
	inout  		wire 	[1:0]  		ddr3_dqs_p,
	inout  		wire 	[1:0]  		ddr3_dqs_n,
	output 		wire          			ddr3_ck_p,
	output 		wire          			ddr3_ck_n,
	output 		wire          			ddr3_reset_n
	
	
    );

    //------------------------------------------------------------------------
    //  Parameters
    //------------------------------------------------------------------------
    localparam	OKWIDTH 														=			16;																				// Width of opal kelly interface, the flit width
    localparam  	PATTERN_PIPE_BUFFER_SIZE 						=			256;																				// Size of buffer for pattern pipe
    localparam  	PATTERN_PIPE_ADDR_BITS 							=			8;																					// Equal to or greater than clog2(PATTERN_PIPE_BUFFER_SIZE)
    localparam 	NUMBER_OF_CHIPS 	    								=			2;																					// This is also the number of patterns that are expected
    localparam  	NUMBER_OF_REF_CLKS     								=			3;																					// This is the number of ref clock outputs in the MMCM
    
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
    localparam 		ADDR_WIREIN_PAD_CAPTURED_MASK				=			8'h10;																			// Wire in for masking pad_captured signal based on functional ICs
    localparam 		ADDR_WIREIN_PACKETS_IN_TRANSFER						= 8'h11;
    localparam  	ADDR_WIREOUT_STATUS 								=			8'h20;																			// Wire out for FPGA status
    localparam  	ADDR_WIREOUT_SIGNAL 								=			8'h21;																			// Wire out for direct python signal monitoring
	localparam  	ADDR_WIREOUT_FIFOC0F2 							=	        8'h22;																			// Data count for Chip 0, FIFO 1
	localparam  	ADDR_WIREOUT_FIFOC1F2 							=	        8'h23;																			// Data count for Chip 1, FIFO 1
	localparam	ADDR_WIREOUT_FIFOSTATUS 						=			8'h24;																			// FIFO status signals for Chip 0 and Chip 1
    localparam  	ADDR_WIREOUT_EMITTERPATTERNLSB 			= 			8'h25;																			// Emitter pattern register bank LSB
    localparam  	ADDR_WIREOUT_EMITTERPATTERNMSB 			= 			8'h26;																			// Emitter pattern register bank MSB
	localparam 	ADDR_WIREOUT_FIFOSIZE 								= 			8'h27;																			// Max number of words in backend FIFO
	localparam	ADDR_WIREOUT_FCSTATE								=			8'h28;																			// Wire out for frame controller state
    localparam ADDR_WIREOUT_RAM_FIRST_ERROR = 8'h29;
    localparam ADDR_WIREOUT_RAM_READ = 8'h30;
    localparam  	ADDR_TRIGGERIN_DATASTREAMREADACK 		=      	8'h40;																			// Trigger in for enabling data stream
    localparam  	ADDR_TRIGGEROUT_DATASTREAMREAD 		=			8'h60;																			// Trigger out for data readout during streaming mode
    localparam  	ADDR_PIPEIN_SCAN 										=			8'h80;																			// Pipe in for scan
    localparam  	ADDR_PIPEIN_PATTERN 								=			8'h81;																			// Pipe in for pattern data
    localparam  	ADDR_PIPEOUT_SCAN 									=			8'ha0;																			// Pipe out for scan
	localparam  	ADDR_PIPEOUT_FIFO_0									=			8'ha1;																			// Pipe out for data (Chip 0)
	localparam  	ADDR_PIPEOUT_FIFO_1 									=			8'ha2;																			// Pipe out for data (Chip 1)
	localparam  	ADDR_PIPEOUT_FIFO_MASTER						=			8'hb8;																			// Pipe out master
    
    //------------------------------------------------------------------------
    // Genvars
    //------------------------------------------------------------------------   
    genvar																	i;
	genvar																	j;

	//------------------------------------------------------------------------
	// Opal kelly Module Interface Connections
	//------------------------------------------------------------------------
	wire																		ti_clk;     																								// Clock from Opal Kelly HI (48 MHz)
	wire																		sys_clk;
	wire		[NUMBER_OF_REF_CLKS-1:0]						ref_clk_mmcm;     																					// mmcm ref clock outputs 
	wire																		ref_clk_mmcm_muxed;     																		// 2:1 muxed ref clock outputs 
	wire																		tx_refclk_mmcm;     																				// 12.5MHz clock from the MMCM 
	wire																		ref_clk_pll;																							// ref clock pll (25,50, or 100MHz)
	wire																		tx_refclk_pll;
	wire																		ref_clk_mmcm_enable;
	wire																		mmcm_rst;
	wire		[1:0]															clk_select;
	wire		[30:0]														ok1;
	wire		[16:0]														ok2;
	
	// Pipes
	wire																		pipeI_ready;     																						// Indicates FPGA is ready for new pipe packet
	wire																		pipeO_valid;     																						// Indicates FPGA has a valid pipe packet
	wire																		pipeI_write;     																						// Flag indicating incoming data ready
	wire		[OKWIDTH-1:0]											pipeI_data;     																						// Opal Kelly HI to ok2core Buffer Data Interface
	wire																		pipeO_read;     																						// Flag indicating outgoing data coming
	wire		[OKWIDTH-1:0]											pipeO_data;     																						// ok2core Buffer to Opal Kelly HI Data Interface 
	wire																		pipeO_master_read; 																		// Master FIFO data 
	
	// Wires
	wire		[OKWIDTH-1:0]											msg_ctrl;     																							// Control Word Input (for soft reset, etc..)
	wire		[OKWIDTH-1:0]											sw_in_signals;     																					// Signals directly controlled by python software
	wire		[OKWIDTH-1:0]											sw_in_power_signals;     																		// Signals for controlling PCB power
	wire		[OKWIDTH-1:0]											sw_in_frame_signals;     																		// Signals for setting number of frames
	wire		[OKWIDTH-1:0]											sw_in_pattern_signals;     																	// Signals for controlling patterns per frame
	wire		[OKWIDTH-1:0]											sw_in_measurementLSB_signals;     														// Signals for controlling measurements per pattern LSB
	wire		[OKWIDTH-1:0]											sw_in_measurementMSB_signals;															// Signals for controlling measurements per pattern MSB
	wire		[OKWIDTH-1:0]											sw_in_frame_control_signals;     															// Signals for controlling the frame controller
    wire		[OKWIDTH-1:0]           								sw_in_pad_catured_mask;               														// Signals for masking pad_captured signal for non-functional chips
	wire		[OKWIDTH-1:0]											sw_in_stream_signals;  																		// Signal for indicating the number of 16 bit transfers to read per chip (frames*patterns_per_frame*4800/16)
	wire		[OKWIDTH-1:0]											sw_in_packets_in_transfer;   																		
	wire		[OKWIDTH-1:0]											sw_out_signals;     																				// Signals directly output to python software
	wire		[OKWIDTH-1:0]											sw_out_ram_first_error;
	wire		[OKWIDTH-1:0]											cmd_fsm_state;     																				// Error message register for Scan Interface
	wire		[OKWIDTH-1:0]											msg_stat;     																						// Status Bits for observation & outputs
	wire		[OKWIDTH-1:0]											fifo_stat;																								// FIFO status bits
	wire		[OKWIDTH-1:0]											sw_datastreamread_trigger_out;
	wire		[OKWIDTH-1:0]											sw_out_ram_read;
	wire		[OKWIDTH-1:0]											sw_trigger_in;

	//------------------------------------------------------------------------
	//  Signals
	//------------------------------------------------------------------------
	// Opal Kelly to Buffer Interface
	wire																		locked;
	wire																		rst;																										// FPGA reset
	wire																		sw_rst;																									// software reset
	wire																		clr_inbuf;																								// signal to clear the ok2core input buffer
	wire																		clr_outbuf;																							// signal to clear the ok2core output buffer
	wire																		pipeIO_err;     																						// error flag indicating data overflow into ok2core buffer
	
	// Chip scan interface
	wire																		s_clk_p;
	wire																		s_clk_n;
	
	wire																		s_clk_p_muxed;
	wire																		s_clk_n_muxed;
	
	//wire                            												s_reset;     																								// Unused
	wire		[NUMBER_OF_CHIPS-1:0]							s_out;
	
	wire		[NUMBER_OF_CHIPS-1:0]							s_in;
	wire		[NUMBER_OF_CHIPS-1:0]							s_enable;
	wire		[NUMBER_OF_CHIPS-1:0]							s_update;
	
	wire																		s_in_shared;
	wire																		s_enable_shared;
	wire																		s_update_shared;
	
	wire		[NUMBER_OF_CHIPS-1:0]							s_enable_muxed;
	wire																		s_update_shared_muxed;
	
	
	// Refclk and TxRefclk driving internal logic
	wire																		refclk_int;
	wire																		tx_refclk_int;
	
	// Refclk and txrefclk coming from external source
	wire																		refclk_ext;
	
	
	// RefclkOut and TxRefclkOut come from ODDR2
	wire																		refclk_out;
	wire																		tx_refclk_out;
	
	wire																		scan_done_refclk_domain;
	wire																		scan_done_ticlk_domain;
	
	wire																		data_stream_refclk_domain;
	wire																		data_stream_ticlk_domain;
	wire																		blitz_mode_ticlk_domain;
	wire																		blitz_mode_refclk_domain;
	wire																		read_trigger;
	wire																		ram_transfer_ready;
	wire																		read_ack_trigger;
	wire																		read_ack_trigger_hold;
	wire		[9:0]															fc_state;
	wire 																	block_next_streamout_refclk_domain;
	wire 																	block_next_streamout_ticlk_domain;
	

	//------------------------------------------------------------------------
	//  Chip Pads
	//------------------------------------------------------------------------
	// Inputs
	wire		[NUMBER_OF_CHIPS-1:0]							pad_tx_dataout;
	wire		[NUMBER_OF_CHIPS-1:0]							pad_s_out;
	
	// Outputs
	wire		[NUMBER_OF_CHIPS-1:0]							pad_s_enable;
	wire																		pad_s_reset;
	wire																		pad_s_clk_p;
	wire																		pad_s_clk_n;
	wire																		pad_s_in;
	wire																		pad_rstasync;
	wire																		pad_refclk;
	wire																		pad_s_update;
	wire																		pad_tx_refclk;
	
	
	//------------------------------------------------------------------------
	// Board signals
	//------------------------------------------------------------------------
	wire																		vdd_sm_reset_bar;
	wire																		vdd_sm_reset;
	wire																		hvdd_ldo_enable;
	wire																		vrst_ldo_enable;
	wire																		clock_ls_direction;
	wire																		clock_ls_oe_bar;
	wire																		vcsel_sm_enable;
	wire																		cath_sm_enable;
	wire																		pot_clk;
	wire																		pot_data;
	wire																		pot_cs1_bar;
	wire																		pot_cs2_bar;
	
	
	//------------------------------------------------------------------------
	//  FIFO Signals
	//------------------------------------------------------------------------
	// Global FIFO wires
	wire		[NUMBER_OF_CHIPS-1:0]							fifo_clr;
	
	// MOANA to FIFO Wires
	wire		[NUMBER_OF_CHIPS-1:0]							tx_flagout;
	wire		[NUMBER_OF_CHIPS-1:0]							tx_dataout;
	wire		[NUMBER_OF_CHIPS-1:0]							pad_captured;
	wire		[NUMBER_OF_CHIPS-1:0]							data_loaded;
    wire    	[NUMBER_OF_CHIPS-1:0]                           next_streamout_will_be_blocked;
	wire		[NUMBER_OF_CHIPS-1:0]							blocking;
	
	// Padding wires
	wire		[NUMBER_OF_CHIPS-1:0]							pad_fifo_valid;
	wire		[NUMBER_OF_CHIPS-1:0]							pad_fifo_empty;
	wire		[NUMBER_OF_CHIPS-1:0]							pad_fifo_full;
	wire		[NUMBER_OF_CHIPS-1:0]							pad_fifo_data;
	wire		[NUMBER_OF_CHIPS-1:0]							pad_fifo_rd;
	wire		[11:0]											pad_fifo_data_count [NUMBER_OF_CHIPS-1:0];
	wire		[NUMBER_OF_CHIPS-1:0]							pad_fifo_overflow;
	wire		[NUMBER_OF_CHIPS-1:0]							tx_dataout_padded;
	wire		[NUMBER_OF_CHIPS-1:0]							tx_flagout_padded;
	
	// Per-chip FIFO signals
	wire		[1:0]											fifo_full						[NUMBER_OF_CHIPS-1:0];
	wire		[1:0]											fifo_overflow					[NUMBER_OF_CHIPS-1:0];
	wire		[1:0]											fifo_empty						[NUMBER_OF_CHIPS-1:0];
	wire		[1:0]											fifo_underflow					[NUMBER_OF_CHIPS-1:0];
	wire		[1:0]											fifo_valid						[NUMBER_OF_CHIPS-1:0];
	wire		[7:0]											pipeO_fifo_data_8b				[NUMBER_OF_CHIPS-1:0];
	wire		[31:0]											pipeO_fifo_data_32b				[NUMBER_OF_CHIPS-1:0];
	wire		[31:0]											pipeO_fifo_data_32b_reversed	[NUMBER_OF_CHIPS-1:0];

	// Master pipe wires
	wire		[NUMBER_OF_CHIPS-1:0]							master_pipe_controller_read;     																		// Flag indicating outgoing data coming
	wire														master_pipe_controller_valid;
	wire		[32-1:0]										master_pipe_controller_data;
	
	// DRAM input buffer signals
	wire 		[127:0]											ib_dout_128b;	
	wire 														ib_rd_en;
	wire 														ib_full;
	wire 														ib_empty;
	wire 														ib_valid;
	wire 														ib_overflow;
	wire 														ib_underflow;
	wire 		[9:0] 											ib_wr_data_count;
	wire 		[7:0] 											ib_rd_data_count;
	
	// DRAM signals
	wire 		[28:0] 											app_addr;
	wire 		[2:0] 											app_cmd;
	wire 														app_en;
	wire 		[127:0] 										app_wdf_data;
	wire 														app_wdf_end;
	wire 														app_wdf_wren;
	wire 		[127:0] 										app_rd_data;
	wire 														app_rd_data_end;
	wire 														app_rd_data_valid;
	wire 														app_rdy;
	wire 														app_wdf_rdy;
	wire 		[15:0] 											app_wdf_mask;
	wire 														sys_rst_sync;
	wire 														ram_underflow;
	wire 														ram_overflow;
	wire 														packet_cnt_full;
	wire 		[15:0] 											ram_error;
	reg 														ram_reset_active;
	
`ifndef SIMULATION
	reg 														sys_rst;
	wire 														init_calib_complete;
`endif

	// DRAM output buffer signals
	wire 		[127:0] 										ob_din_128b;
	wire  														ob_wr_en;
	wire  														ob_full;
	wire  														ob_empty;
	wire  														ob_valid;
	wire  														ob_overflow;
	wire  														ob_underflow;
	wire		[10:0]											ob_rd_data_count;
	wire 		[7:0] 											ob_wr_data_count;
	wire														urgent_wr_req;

	// FIFO to Computer Pipe
	wire		[OKWIDTH-1:0]									pipeO_fifo_data_16b;
	wire		[OKWIDTH-1:0]									pipeO_fifo_data_16b_shuffled;
    
    
	//------------------------------------------------------------------------
	//  Frame controller
	//------------------------------------------------------------------------
	
	// FSM inputs
	wire																		fsm_bypass_ticlk_domain;
	wire																		fsm_bypass_refclk_domain;
	wire																		fsm_refclk_enable;
	wire																		fsm_tx_refclk_enable;
	wire																		frame_controller_reset;
	wire																		frame_controller_sw_reset;
	wire																		capture_idle_refclk_domain;
	wire																		capture_idle_ticlk_domain;
	wire																		frame_data_sent_refclk_domain;
	wire																		frame_data_sent_ticlk_domain;
	wire																		capture_start_refclk_domain;
	wire																		capture_start_ticlk_domain;
	wire																		capture_interrupt_refclk_domain;
	wire																		capture_interrupt_ticlk_domain;
	wire		[OKWIDTH-1:0]											number_of_frames;
	wire		[OKWIDTH-1:0]											patterns_per_frame;
    wire		[OKWIDTH*2-1:0]										measurements_per_pattern;
    wire		[OKWIDTH-1:0]													packets_in_transfer;
	wire		[NUMBER_OF_CHIPS-1:0]							pad_captured_mask;
	
	// FSM outputs
	wire																		frame_data_received_refclk_domain;
	wire																		frame_data_received_ticlk_domain;
	wire																		capture_running_refclk_domain;
	wire																		capture_running_ticlk_domain;
	wire																		capture_done_refclk_domain;
	wire																		capture_done_ticlk_domain;

	wire 														dynamic_pattern_pipe_in_complete_ticlk_domain;
	wire 														dynamic_pattern_pipe_in_complete_refclk_domain;
	wire														dynamic_mode_enabled_ticlk_domain;
	wire														dynamic_mode_enabled_refclk_domain;
	wire 														pattern_pipe_write;
	wire 		[OKWIDTH-1:0] 									pattern_data_16b;
	wire 														dynamic_pattern_shift_trigger;
	wire 														shift_clk;
	wire 		[NUMBER_OF_CHIPS-1:0] 							shift_data;
	
	

	
	
	//------------------------------------------------------------------------
	// Debug signals
	//------------------------------------------------------------------------
	reg																		verify_refclk_running;
	reg																		verify_tx_refclk_running;
	reg																		verify_scan_clk_p_running;
	reg																		verify_scan_clk_n_running;
	always @(posedge refclk_int) verify_refclk_running <= ~verify_refclk_running;
	always @(posedge tx_refclk_int) verify_tx_refclk_running <= ~verify_tx_refclk_running;
	always @(posedge s_clk_p) verify_scan_clk_p_running <= verify_scan_clk_p_running;
	always @(posedge s_clk_n) verify_scan_clk_n_running <= verify_scan_clk_n_running;
    
    
    //------------------------------------------------------------------------
    // User Interface Connections for Scan Chain
    //------------------------------------------------------------------------
    // Hardware Inputs / Outputs
    assign rst 				=			sw_rst | sys_rst_sync;
    always @(posedge ti_clk) ram_reset_active <= sys_rst_sync;     									// global reset (active high)
    
    // Control/Config Inputs
    assign clr_inbuf 		=			msg_ctrl[1];            					// clear input buffer 
    assign clr_outbuf 		=			msg_ctrl[2];            					// clear output buffer
    assign sw_rst 			=			msg_ctrl[3];            					// software reset (active high)

    // Control Status Outputs
    assign msg_stat[0] 		=			pipeI_ready;
    assign msg_stat[1] 		=			pipeO_valid;
    assign msg_stat[2] 		=			pipeIO_err;
    
    // Observe command FSM state
    assign msg_stat[3] 		=			cmd_fsm_state[0];   
    assign msg_stat[4] 		=			cmd_fsm_state[1];
    assign msg_stat[5] 		=			cmd_fsm_state[2];
    assign msg_stat[6] 		=			cmd_fsm_state[3];

    // Error Flags/Warnings
    assign msg_stat[7] 		=			pipeIO_err;             					// data overflow into ok2core input
	
	// Status signal
	assign scan_done_ticlk_domain 		= 			sw_in_frame_control_signals[0];				// Indicates that scan process is complete, disables scan clocks
    
    // Disable scan clocks when scan_done asserted
    assign s_clk_p_muxed    =           scan_done_refclk_domain ? 1'b0 : s_clk_p;
    assign s_clk_n_muxed    =           scan_done_refclk_domain ? 1'b0 : s_clk_n;
    
    // Dynamic mode
    assign dynamic_mode_enabled_ticlk_domain = sw_in_signals[2];
    assign dynamic_pattern_pipe_in_complete_ticlk_domain = sw_in_signals[3];
    
    // Scan enable and triggerext muxing
    generate
        for (i = 0; i < NUMBER_OF_CHIPS; i = i + 1) begin : s_enable_muxed_generate
            assign s_enable_muxed[i] = s_enable[i] | shift_data[i];
        end
    endgenerate
    assign s_update_shared_muxed = s_update_shared || shift_clk;
    
	//------------------------------------------------------------------------
    //  Clocking Setup
    //------------------------------------------------------------------------
`ifdef INTERNAL_CLOCKS
    
    assign refclk_int = ref_clk_pll;
    assign tx_refclk_int = tx_refclk_mmcm;
    
`elsif EXTERNAL_REFCLK
    
    // Refclk from external SMA, TxRefClk from PLL
    BUFG BUFG_refclk ( .I(refclk_ext), .O(refclk_int) );
    BUFG BUFG_tx_refclk ( .I(tx_refclk_mmcm), .O(tx_refclk_int) );
    
`endif

	//------------------------------------------------------------------------
	//  LEDs
	//------------------------------------------------------------------------
	// Use LEDs as status display
	assign led[0]			=			~pad_fifo_overflow[0];
	assign led[1]			=			~fifo_overflow[0][1];
	assign led[2]			=			~ib_overflow;
	assign led[3]			=			~ob_underflow;
	assign led[4]			=			~ob_overflow;
	assign led[5]			=			~urgent_wr_req;
	assign led[6]           =          ~ram_overflow;
	assign led[7]           =          ~ram_underflow;

    //------------------------------------------------------------------------
	
	//------------------------------------------------------------------------
    //  Opal Kelly pre-configured pins
    //------------------------------------------------------------------------;
	 assign hi_muxsel  		= 			1'b0;
	 //------------------------------------------------------------------------
	
	//------------------------------------------------------------------------
    //  Chip Pad to Internal FPGA Mapping
    //------------------------------------------------------------------------
    // Inputs
	assign tx_dataout[1] 	= 			pad_tx_dataout[1];
	assign s_out[1]			=			pad_s_out[1];
	assign s_out[0]			=			pad_s_out[0];
	assign tx_dataout[0]	=			pad_tx_dataout[0];
	
	// Outputs
	assign pad_s_enable[1]	=			s_enable_muxed[1];//s_enable[1];
	assign pad_s_reset		=			sw_in_signals[0];
	assign pad_s_clk_p		=			s_clk_p_muxed;//s_clk_p;
	assign pad_s_clk_n		=			s_clk_n_muxed;//s_clk_n;
	assign pad_s_in			=			s_in_shared;
	assign pad_rstasync		=			sw_in_signals[1]; 
	assign pad_s_update		=			s_update_shared_muxed;//s_update_shared;
	assign pad_s_enable[0]	=			s_enable_muxed[0];//s_enable[0];


    //------------------------------------------------------------------------
    
	//------------------------------------------------------------------------
    //  Frame controller
    //------------------------------------------------------------------------
    assign frame_data_sent_ticlk_domain  		=           sw_in_frame_control_signals[1];
    assign capture_start_ticlk_domain    		=           sw_in_frame_control_signals[2];
    assign capture_interrupt_ticlk_domain		=           sw_in_frame_control_signals[3];
    assign frame_controller_sw_reset 			=  			sw_in_frame_control_signals[4];
    assign fsm_bypass_ticlk_domain       		=           sw_in_frame_control_signals[5];
    assign data_stream_ticlk_domain      		=           sw_in_frame_control_signals[6];
    assign blitz_mode_ticlk_domain				= 			sw_in_frame_control_signals[7];
    
    assign number_of_frames =           sw_in_frame_signals[15:0];
    assign patterns_per_frame =         sw_in_pattern_signals[15:0];
    assign measurements_per_pattern =   {sw_in_measurementMSB_signals, sw_in_measurementLSB_signals};
    assign packets_in_transfer = 		sw_in_packets_in_transfer[15:0];
    assign pad_captured_mask =          sw_in_pad_catured_mask[NUMBER_OF_CHIPS-1:0];
    
    assign sw_out_signals[0]=			1'b0;
    assign sw_out_signals[1]=			1'b0;
    assign sw_out_signals[2]=			1'b0;
    assign sw_out_signals[3]=			1'b0;
    assign sw_out_signals[5]=           capture_idle_ticlk_domain;
    assign sw_out_signals[6]=           frame_data_received_ticlk_domain;
    assign sw_out_signals[7]=           capture_running_ticlk_domain;
    assign sw_out_signals[8]=           capture_done_ticlk_domain;
    assign sw_out_signals[9]=			1'b0;
    assign sw_out_signals[10]=			1'b0;
    assign sw_out_signals[11]=			1'b0;
    assign sw_out_signals[12]=			1'b0;
    assign sw_out_signals[13]=			1'b0;
    assign sw_out_signals[14]=			1'b0;
    assign sw_out_signals[15]=			1'b0;
    
    assign sw_datastreamread_trigger_out[0]=           read_trigger;
    assign sw_datastreamread_trigger_out[15:1] = 15'b0;
    
    assign sw_out_ram_read[0]=			ram_transfer_ready;
    assign sw_out_ram_read[15:1] = 		15'b0;
	 
	 assign read_ack_trigger = 			sw_trigger_in[0];
    
	//------------------------------------------------------------------------
    //  Board control signals
    //------------------------------------------------------------------------
	// Active low
	assign vdd_sm_reset		=			~vdd_sm_reset_bar;
	
    // Inputs
	assign sw_out_signals[4]=			vdd_sm_reset; // If this goes high, it means that VDD_SM is not acceptable
	
	// Outputs
	assign hvdd_ldo_enable	=			sw_in_power_signals[0];
	assign vrst_ldo_enable	=			sw_in_power_signals[1];
	assign vcsel_sm_enable =       sw_in_power_signals[2];
	assign cath_sm_enable   =           sw_in_power_signals[3];
    assign clock_ls_direction =         sw_in_power_signals[4];
    assign clock_ls_oe_bar =            sw_in_power_signals[5];
    assign ref_clk_mmcm_enable =        sw_in_power_signals[6];
    assign clk_select[0] =              sw_in_power_signals[7];
    assign clk_select[1] =              sw_in_power_signals[8];
    assign mmcm_rst = 					sw_in_power_signals[9];

    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    // Header Interface
    //------------------------------------------------------------------------
	 `include "../verilog/setup.v"
    
    // pad clocks are always driven by ODDR, although source could be PLL or external
    assign pad_refclk = refclk_out;
    assign pad_tx_refclk = tx_refclk_out;
    
    
	//-------------------------------------------------------------------------------
    //  DDR3 MIG Module Reset
    //-------------------------------------------------------------------------------
	reg [31:0] rst_cnt;
	initial rst_cnt = 32'b0;
	always @(posedge ti_clk) begin
		if(rst_cnt < 32'h100) begin
			rst_cnt <= rst_cnt + 1;
			sys_rst <= 1'b1;
		end else begin
			sys_rst <= 1'b0;
		end
	end
    
    
    //------------------------------------------------------------------------
    // Clock MMCM instantiation
    //------------------------------------------------------------------------
    clk_wiz_0 clk_gen_mmcm
   (
		.reset				(mmcm_rst),				// Reset
		.clk_in1			(sys_clk),				// 100MHz Input Clock
		.locked				(locked),				// Indicates that PLL has locked
		
		.clk_25MHz			(ref_clk_mmcm[0]),		// 25MHz Output Clock for RefClk
		.clk_50MHz			(ref_clk_mmcm[1]),		// 50MHz Output Clock for RefClk
		.clk_100MHz			(ref_clk_mmcm[2]),		// 100MHz Output Clock for RefClk
		
		.tx_refclk_mmcm		(tx_refclk_mmcm) 		// 12.5MHz Output Clock for TxRefClk
    );
    
    
    //------------------------------------------------------------------------
    // Clock Multiplexer
    //------------------------------------------------------------------------
	BUFGCTRL #(
		.INIT_OUT			(0), 					// Initial value of BUFGCTRL output ($VALUES;)
		.PRESELECT_I0		("FALSE"), 				// BUFGCTRL output uses I0 input ($VALUES;)
		.PRESELECT_I1		("FALSE") 				// BUFGCTRL output uses I1 input ($VALUES;)
	) 
	
	BUFGCTRL_ref_clk_mmcm_muxed_inst (
		.O              	(ref_clk_pll), 			// 1-bit output: Clock output
		.CE0            	(ref_clk_mmcm_enable), 	// 1-bit input: Clock enable input for I0
		.CE1				(ref_clk_mmcm_enable), 	// 1-bit input: Clock enable input for I1
		.I0					(ref_clk_mmcm_muxed), 	// 1-bit input: Primary clock
		.I1					(ref_clk_mmcm[2]), 		// 1-bit input: Secondary clock
		.IGNORE0			(1'b1), 				// 1-bit input: Clock ignore input for I0
		.IGNORE1			(1'b1), 				// 1-bit input: Clock ignore input for I1
		.S0					(~clk_select[1]), 		// 1-bit input: Clock select for I0
		.S1					(clk_select[1]) 		// 1-bit input: Clock select for I1
	);
	
	// First stage multiplexer for clock
	// clk_select[1] high selects 100MHz
	// When clk_select[1] is low:
	// clk_select[0] high selects 25MHz, low selects 50MHz
	assign ref_clk_mmcm_muxed = clk_select[0] ? ref_clk_mmcm[0] : ref_clk_mmcm[1];
	
	
    //------------------------------------------------------------------------
    // RefClk Output for Chip RefClk
    //------------------------------------------------------------------------
	wire	refclk_enable;
	assign  refclk_enable = fsm_refclk_enable | fsm_bypass_refclk_domain;
	 
	ODDR 	#(
			.DDR_CLK_EDGE("OPPOSITE_EDGE"), 												// Sets output alignment to "NONE", "C0" or "C1"
			.INIT(1'b0), 															// Sets initial state of the Q output to 1'b0 or 1'b1
			.SRTYPE("SYNC")) 														// Specifies "SYNC" or "ASYNC" set/reset
	 	ODDR_refclk_inst (
			.Q(refclk_out), 														// 1-bit DDR output data
			.C(refclk_int), 															// 1-bit clock input
			.CE(refclk_enable), 													// 1-bit clock enable input
			.D1(1'b1), 																// 1-bit data input (associated with C)
			.D2(1'b0), 																// 1-bit data input (associated with ~C)
			.R(rst), 																// 1-bit reset input
			.S(1'b0) 																// 1-bit set input
	);

	
    //------------------------------------------------------------------------
    // Tx_RefClk Output for Chip TxRefClk
    //------------------------------------------------------------------------
	wire	tx_refclk_enable;
	assign tx_refclk_enable = fsm_bypass_refclk_domain | fsm_tx_refclk_enable;
	 
	ODDR 	#(
			.DDR_CLK_EDGE("OPPOSITE_EDGE"), 												// Sets output alignment to "NONE", "C0" or "C1"
			.INIT(1'b0), 															// Sets initial state of the Q output to 1'b0 or 1'b1
			.SRTYPE("SYNC")) 														// Specifies "SYNC" or "ASYNC" set/reset
	 	ODDR_tx_refclk_inst (
			.Q(tx_refclk_out), 														// 1-bit DDR output data
			.C(tx_refclk_int), 														// 1-bit clock input
			.CE(tx_refclk_enable), 													// 1-bit clock enable input
			.D1(1'b1), 																// 1-bit data input (associated with C0)
			.D2(1'b0), 																// 1-bit data input (associated with C1)
			.R(rst), 																// 1-bit reset input
			.S(1'b0) 																// 1-bit set input
	);


    //------------------------------------------------------------------------
    // Instantiate the okHostInterface and connect endpoints to
    // the Opal Kelly Module Interface
    //------------------------------------------------------------------------
	okHost okHI(
	.hi_in(hi_in), .hi_out(hi_out), .hi_inout(hi_inout), .hi_aa(hi_aa), .ti_clk(ti_clk), .ok1(ok1), .ok2(ok2));


    //------------------------------------------------------------------------
    // Endpoint connections: HI to core and core to FPGA connections
    //------------------------------------------------------------------------
     
     // WireOR for switching bus inputs into okHost
	wire [12*17-1:0]  ok2x;
	okWireOR # (.N(12)) wireOR (ok2, ok2x);
    
    // Wire In: Valid Address Range:  0x00-0x1F
    okWireIn ep00(.ok1(ok1), .ep_addr(ADDR_WIREIN_MSGCTRL), .ep_dataout(msg_ctrl));
    okWireIn ep01(.ok1(ok1), .ep_addr(ADDR_WIREIN_SIGNAL), .ep_dataout(sw_in_signals));
	okWireIn ep02(.ok1(ok1), .ep_addr(ADDR_WIREIN_POWER), .ep_dataout(sw_in_power_signals));
	okWireIn ep03(.ok1(ok1), .ep_addr(ADDR_WIREIN_FRAME), .ep_dataout(sw_in_frame_signals));
	okWireIn ep04(.ok1(ok1), .ep_addr(ADDR_WIREIN_PATTERN), .ep_dataout(sw_in_pattern_signals));
	okWireIn ep05(.ok1(ok1), .ep_addr(ADDR_WIREIN_MEASUREMENT_LSB), .ep_dataout(sw_in_measurementLSB_signals));
	okWireIn ep06(.ok1(ok1), .ep_addr(ADDR_WIREIN_MEASUREMENT_MSB), .ep_dataout(sw_in_measurementMSB_signals));
    okWireIn ep07(.ok1(ok1), .ep_addr(ADDR_WIREIN_FRAMECTRL), .ep_dataout(sw_in_frame_control_signals));
    okWireIn ep09(.ok1(ok1), .ep_addr(ADDR_WIREIN_STREAM), .ep_dataout(sw_in_stream_signals));
	okWireIn ep10(.ok1(ok1), .ep_addr(ADDR_WIREIN_PAD_CAPTURED_MASK), .ep_dataout(sw_in_pad_catured_mask));
	okWireIn ep11(.ok1(ok1), .ep_addr(ADDR_WIREIN_PACKETS_IN_TRANSFER), .ep_dataout(sw_in_packets_in_transfer));

    // Wire Out: Valid Address Range:  0x20-0x3F
    okWireOut ep20 (.ok1(ok1), .ok2(ok2x[ 0*17 +: 17 ]), .ep_addr(ADDR_WIREOUT_STATUS), .ep_datain(msg_stat));
    okWireOut ep21 (.ok1(ok1), .ok2(ok2x[ 1*17 +: 17 ]), .ep_addr(ADDR_WIREOUT_SIGNAL), .ep_datain(sw_out_signals));
	okWireOut ep23 (.ok1(ok1), .ok2(ok2x[ 2*17 +: 17 ]), .ep_addr(ADDR_WIREOUT_FIFOC0F2), .ep_datain({ 5'b0, ob_rd_data_count }));
	okWireOut ep29 (.ok1(ok1), .ok2(ok2x[ 3*17 +: 17 ]), .ep_addr(ADDR_WIREOUT_FIFOSIZE), .ep_datain(16'd32767));
	okWireOut ep30 (.ok1(ok1), .ok2(ok2x[ 4*17 +: 17 ]), .ep_addr(ADDR_WIREOUT_FCSTATE), .ep_datain( {6'b0, fc_state} ));
	okWireOut ep31 (.ok1(ok1), .ok2(ok2x[ 5*17 +: 17 ]), .ep_addr(ADDR_WIREOUT_RAM_FIRST_ERROR), .ep_datain( sw_out_ram_first_error));
	okWireOut ep32 (.ok1(ok1), .ok2(ok2x[ 6*17 +: 17 ]), .ep_addr(ADDR_WIREOUT_RAM_READ), .ep_datain(sw_out_ram_read));
    
    // Trigger In: Valid Address Range (0x40 - 0x5F)
    okTriggerIn ep40 (.ok1(ok1), .ep_addr(ADDR_TRIGGERIN_DATASTREAMREADACK), .ep_clk(refclk_int), .ep_trigger(sw_trigger_in));
    
    // Trigger Out: Valid Address Range (0x60-0x7F)
    okTriggerOut ep60 (.ok1(ok1), .ok2(ok2x[ 7*17 +: 17 ]), .ep_addr(ADDR_TRIGGEROUT_DATASTREAMREAD), .ep_clk(refclk_int), .ep_trigger(sw_datastreamread_trigger_out));

    // Pipe In: Valid Address Range:  0x80-0x9F
    okPipeIn ep80 (.ok1(ok1), .ok2(ok2x[ 8*17 +: 17 ]), .ep_addr(ADDR_PIPEIN_SCAN), .ep_write(pipeI_write), .ep_dataout(pipeI_data));
    okPipeIn ep81 (.ok1(ok1), .ok2(ok2x[ 9*17 +: 17 ]), .ep_addr(ADDR_PIPEIN_PATTERN), .ep_write(pattern_pipe_write), .ep_dataout(pattern_data_16b));

    // Pipe Out: Valid Address Range:  0xA0-0xBF
    okPipeOut epA0 (.ok1(ok1), .ok2(ok2x[ 10*17 +: 17 ]), .ep_addr(ADDR_PIPEOUT_SCAN),.ep_read(pipeO_read), .ep_datain(pipeO_data));
	okPipeOut epB0 (.ok1(ok1), .ok2(ok2x[ 11*17 +: 17 ]), .ep_addr(ADDR_PIPEOUT_FIFO_MASTER), .ep_read(pipeO_master_read), .ep_datain(pipeO_fifo_data_16b_shuffled));
	

    //-------------------------------------------------------------------------------
    //  FPGA Control Block
    //-------------------------------------------------------------------------------
    fpga_control    #           (   .ScanClkDiv         (8),
                                    .ScanRows           (NUMBER_OF_CHIPS),
                                    .ScanRowBits        (4))
    
                    fpga_ctrl   (   .clk                (ti_clk),
                                    .rst                (rst),                                    
                                    .clr_inbuf          (clr_inbuf),
                                    .clr_outbuf         (clr_outbuf),
                                    
                                    .pipeI_ready        (pipeI_ready),
                                    .pipeI_write        (pipeI_write),
                                    .pipeI_data         (pipeI_data),
                                    
                                    .pipeO_valid        (pipeO_valid),
                                    .pipeO_read         (pipeO_read),
                                    .pipeO_data         (pipeO_data),
                                    
                                    .pipeIO_err         (pipeIO_err),

                                    .scan_clkp          (s_clk_p),
                                    .scan_clkn          (s_clk_n),
                                    .scan_out           (s_out),

                                    .scan_in            (s_in),
                                    .scan_enable        (s_enable),
                                    .scan_update        (s_update),
                                    
                                    .scan_in_shared     (s_in_shared),
                                    .scan_enable_shared (s_enable_shared),
                                    .scan_update_shared (s_update_shared),

                                    .cmd_fsm_state      (cmd_fsm_state)
	);
    

    //-------------------------------------------------------------------------------
    //  TX Data FIFO for Chip 0
	//  FIFO signals have naming scheme signal_name[chip_number][fifo_number]
    //-------------------------------------------------------------------------------
	assign fifo_stat = 0;
	
    //-------------------------------------------------------------------------------
    //  FIFOs for data readout
    //-------------------------------------------------------------------------------
    generate
        for (i = 0; i < NUMBER_OF_CHIPS; i = i + 1) begin : gen_fifos
		  
				// Reset
				assign fifo_clr[i] = msg_ctrl[4] | msg_ctrl[5];
                
                //-------------------------------------------------------------------------------
                // Flagout Module for catching padded bit and initializing data read
                //-------------------------------------------------------------------------------
                TxFlagOut                 fifo_flagout_1	(
                                                .rst								(fifo_clr[i]),                                             
                                                .chip_rst							(pad_rstasync),
                                                .tx_clk								(tx_refclk_int),
                                                .tx_data							(tx_dataout[i]),
                                                .tx_flagout							(tx_flagout[i]),
                                                .data_loaded						(data_loaded[i]),
                                                .block_next_streamout				(block_next_streamout_ticlk_domain),
                                                .pad_captured						(pad_captured[i]), 
                                                .next_streamout_will_be_blocked		(next_streamout_will_be_blocked[i]), 
                                                .blocking							(blocking[i])
                );
				
				
				//-------------------------------------------------------------------------------
				// FIFO for storing bits that accumulate due to padding 
				//-------------------------------------------------------------------------------
				fifo_W1_R1   pad_fifo         (
                                                            .rst				    (fifo_clr[i]),
                                                            .clk					(tx_refclk_int),
                                                            .data_count				(pad_fifo_data_count[i]), // [11:0]
                                                            
                                                            .wr_en				    (tx_flagout[i]),
                                                            .din				    (tx_dataout[i]),
                                                            .full				    (pad_fifo_full[i]),
                                                            .overflow				(pad_fifo_overflow[i]),
                                                            
                                                            .rd_en				    (pad_fifo_rd[i]),
                                                            .dout				    (pad_fifo_data[i]),
                                                            .empty				    (pad_fifo_empty[i]),
                                                            .valid				    (pad_fifo_valid[i])
				);
				
				
				//-------------------------------------------------------------------------------
				// Padding module for translating 20b bin data to 32b bin data
				//-------------------------------------------------------------------------------
				TxDataOutPadding pad_unit   (
															.rst					(fifo_clr[i]),
															.clk					(tx_refclk_int),
															.prev_fifo_valid		(pad_fifo_valid[i]),
															.prev_fifo_empty		(pad_fifo_empty[i]),
															.prev_fifo_data 		(pad_fifo_data[i]),
															.prev_fifo_rd_en		(pad_fifo_rd[i]),
															.next_fifo_data 		(tx_dataout_padded[i]),
															.next_fifo_wr_en		(tx_flagout_padded[i])
				);
            
            
            //-------------------------------------------------------------------------------
            // FIFO for assembling bytes from bitstream
            //-------------------------------------------------------------------------------
            fifo_W1_R8 	fifo_0 		    (
                                            .rst 				(fifo_clr[i]),
                                            
                                            .wr_clk				(tx_refclk_int),
                                            .wr_en 				(tx_flagout_padded[i]),
                                            .din 				(tx_dataout_padded[i]),
                                            .full 				(fifo_full[i][0]),
                                            .overflow 			(fifo_overflow[i][0]),
                                            
                                            .rd_clk				(sys_clk),
                                            .rd_en 				(~fifo_full[i][1]),
                                            .dout 				(pipeO_fifo_data_8b[i]),  // 8'bit out data
                                            .empty 				(fifo_empty[i][0]),
                                            .valid 				(fifo_valid[i][0]),
                                            .underflow 			(fifo_underflow[i][0])
            );
            
            
            //-------------------------------------------------------------------------------
            // FIFO for assembling uint32 from bytes
            //-------------------------------------------------------------------------------
            fifo_W8_R32     fifo_1  (
									.rst            (fifo_clr[i]),
									.clk            (sys_clk),
									
									.wr_en        (fifo_valid[i][0]),
									.din            (pipeO_fifo_data_8b[i]),
									.full            (fifo_full[i][1]),
									.overflow		(fifo_overflow[i][1]),
									
									.rd_en         (master_pipe_controller_read[i]),
									.dout           (pipeO_fifo_data_32b[i]),
									.empty       (fifo_empty[i][1]),
									.valid          (fifo_valid[i][1])
           );
           
            // Reverse bits
            for (j = 0; j < 32; j = j + 1) begin : pipe_data_reverse
                assign pipeO_fifo_data_32b_reversed[i][j] = pipeO_fifo_data_32b[i][31-j];
            end
            
        end
    endgenerate
    
    
	//-------------------------------------------------------------------------------
    //  Master Data Pipe Out Control
    //-------------------------------------------------------------------------------
    MasterPipeController_v2    #   (   
                                    .NUMBER_OF_CHIPS      							(NUMBER_OF_CHIPS),
                                    .OKWIDTH            							(OKWIDTH),
                                    .DATA_WIDTH										(32),
                                    .CHIP_COUNTER_WIDTH   							(5))
        MasterPipeControllerUnit(   
                                    .rst                							(rst),
                                    .clk             								(sys_clk),
                                    .master_pipe_read	  							(~ib_full),
                                    .master_pipe_data	  							(master_pipe_controller_data),
                                    .word_count         							(sw_in_stream_signals),
                                    .fifo_data_appended  							( {pipeO_fifo_data_32b_reversed[1], pipeO_fifo_data_32b_reversed[0]} ),
                                    .fifo_read           							(master_pipe_controller_read),
                                    .prev_fifos_empty								( { fifo_empty[1][1], fifo_empty[0][1] }),
                                    .prev_fifos_empty_mask							(pad_captured_mask),
                                    .valid											(master_pipe_controller_valid)
	);
	
            
	//-------------------------------------------------------------------------------
    //  FIFO for passing data to DRAM
    //-------------------------------------------------------------------------------
	fifo_W32_R128_FWFT ddr3_ib 	(
							.rst													(|fifo_clr),
							.clk													(sys_clk),
							
							.wr_en													(master_pipe_controller_valid),
							.din													(master_pipe_controller_data),
							.full													(ib_full),
							.overflow												(ib_overflow),
							.wr_data_count											(ib_wr_data_count), // [9:0]
							
							.rd_en													(ib_rd_en),
							.dout													(ib_dout_128b),
							.empty													(ib_empty),
							.underflow												(ib_underflow),
							.valid													(ib_valid),
							.rd_data_count											(ib_rd_data_count) //[7:0]
	);
	
	
	//-------------------------------------------------------------------------------
    //  DRAM Read and Write Controller
    //-------------------------------------------------------------------------------
	mem_arbiter ddr3_arb(
							.clk                		(sys_clk),
							.reset              		(rst),
							.calib_done         		(init_calib_complete),
							
							.ib_re              		(ib_rd_en),
							.ib_data            		(ib_dout_128b),
							.ib_count           		(ib_rd_data_count),
							.ib_valid           		(ib_valid),
							.ib_empty           		(ib_empty),
							
							.ob_we              		(ob_wr_en),
							.ob_data            		(ob_din_128b),
							.ob_count           		(ob_wr_data_count),
							.ob_full            		(ob_full),
							
							.app_rdy            		(app_rdy),
							.app_en             		(app_en),
							.app_cmd            		(app_cmd),
							.app_addr           		(app_addr),
							
							.app_rd_data        		(app_rd_data),
							.app_rd_data_end    		(app_rd_data_end),
							.app_rd_data_valid  		(app_rd_data_valid),
							
							.app_wdf_rdy        		(app_wdf_rdy),
							.app_wdf_wren       		(app_wdf_wren),
							.app_wdf_data       		(app_wdf_data),
							.app_wdf_end        		(app_wdf_end),
							.app_wdf_mask       		(app_wdf_mask), 
							
							.packets_in_transfer		(packets_in_transfer),
							.underflow					(ram_underflow),
							.overflow					(ram_overflow),
							.packet_cnt_full			(packet_cnt_full),
							.error						(ram_error),
							.first_error				(sw_out_ram_first_error), 
							.transfer_ready				(ram_transfer_ready),
							
							.urgent_wr_req				(urgent_wr_req)
	
	);
	
	
    //-------------------------------------------------------------------------------
    //  DDR3 MIG Module
    //-------------------------------------------------------------------------------
    ddr3_256_16 u_ddr3_256_16 (

		// Memory interface ports to DRAM
		.ddr3_addr                      (ddr3_addr),  			// output [14:0]        ddr3_addr
		.ddr3_ba                        (ddr3_ba),  			// output [2:0]        	ddr3_ba
		.ddr3_cas_n                     (ddr3_cas_n),  			// output            	ddr3_cas_n
		.ddr3_ck_n                      (ddr3_ck_n),  			// output [0:0]        	ddr3_ck_n
		.ddr3_ck_p                      (ddr3_ck_p),  			// output [0:0]        	ddr3_ck_p
		.ddr3_cke                       (ddr3_cke),  			// output [0:0]        	ddr3_cke
		.ddr3_ras_n                     (ddr3_ras_n),  			// output            	ddr3_ras_n
		.ddr3_reset_n                   (ddr3_reset_n),  		// output            	ddr3_reset_n
		.ddr3_we_n                      (ddr3_we_n),  			// output            	ddr3_we_n
		.ddr3_dq                        (ddr3_dq),  			// inout [15:0]        	ddr3_dq
		.ddr3_dqs_n                     (ddr3_dqs_n),  			// inout [1:0]        	ddr3_dqs_n
		.ddr3_dqs_p                     (ddr3_dqs_p),  			// inout [1:0]        	ddr3_dqs_p
		.ddr3_dm                        (ddr3_dm),  			// output [1:0]        	ddr3_dm
		.ddr3_odt                       (ddr3_odt),  			// output [0:0]        	ddr3_odt
		
		.init_calib_complete            (init_calib_complete),  // output            	init_calib_complete
		
		// Application interface ports
		.app_addr                       (app_addr),  			// input [28:0]        	app_addr 			(address for current request)
		.app_cmd                        (app_cmd),  			// input [2:0]        	app_cmd 			(command for current request)
		.app_en                         (app_en),  				// input                app_en  			(active high enable for addr, cmd)
		.app_wdf_data                   (app_wdf_data),  		// input [127:0]        app_wdf_data		(data for write commands)
		.app_wdf_end                    (app_wdf_end),  		// input                app_wdf_end			(last cycle of input data)
		.app_wdf_wren                   (app_wdf_wren),  		// input                app_wdf_wren		(write enable)
		.app_rd_data                    (app_rd_data),  		// output [127:0]    	app_rd_data			(data from read commands)
		.app_rd_data_end                (app_rd_data_end),  	// output            	app_rd_data_end		(last cycle of output data)
		.app_rd_data_valid              (app_rd_data_valid),  	// output            	app_rd_data_valid	(read data is valid)
		.app_rdy                        (app_rdy),  			// output            	app_rdy				(ready to accept commands)
		.app_wdf_rdy                    (app_wdf_rdy),  		// output            	app_wdf_rdy			(write FIFO ready to receive data)
		.app_sr_req                     (1'b0),  				// input            	app_sr_req			(always tied to 1'b0)
		.app_ref_req                    (1'b0),  				// input            	app_ref_req			(request refresh)
		.app_zq_req                     (1'b0),  				// input            	app_zq_req
		.app_sr_active                  (),  					// output            	app_sr_active
		.app_ref_ack                    (),  					// output            	app_ref_ack
		.app_zq_ack                     (),  					// output            	app_zq_ack
		.ui_clk                         (sys_clk),  			// output            	ui_clk 				(100MHz clock)
		.ui_clk_sync_rst                (sys_rst_sync),  		// output            	ui_clk_sync_rst 	(synchronous version of sys_rst)
		.app_wdf_mask                   (app_wdf_mask),  		// input [15:0]        	app_wdf_mask		(mask for write data)
		
		// System Clock Ports
		.sys_clk_p                      (sys_clk_p),  			// input                sys_clk_p
		.sys_clk_n                      (sys_clk_n),  			// input                sys_clk_n
		.sys_rst                        (sys_rst) 				// input 				sys_rst
	);
	
	
	//-------------------------------------------------------------------------------
    //  FIFO for collecting transfer from DRAM
    //-------------------------------------------------------------------------------
	fifo_W128_R16 ddr3_ob 	(
							.rst													(|fifo_clr),
							
							.wr_clk													(sys_clk),
							.wr_en													(ob_wr_en),
							.din													(ob_din_128b),
							.full													(ob_full),
							.overflow												(ob_overflow),
							.wr_data_count											(ob_wr_data_count), // [7:0]
							
							.rd_clk													(ti_clk),
							.rd_en													(pipeO_master_read),
							.dout													(pipeO_fifo_data_16b),
							.empty													(ob_empty),
							.valid													(ob_valid), 
							.underflow												(ob_underflow),
							.rd_data_count											(ob_rd_data_count) // [10:0]
	);
	
	// Shuffle bits before bus transfer
	assign pipeO_fifo_data_16b_shuffled[15:8] = pipeO_fifo_data_16b[7:0];
	assign pipeO_fifo_data_16b_shuffled[7:0]  = pipeO_fifo_data_16b[15:8];
                 
    
    //-----------------------------------------------------------------------------------
	// Frame Arbiter
    //-----------------------------------------------------------------------------------
	frame_arbiter # (
			.NUMBER_OF_CHIPS 			(NUMBER_OF_CHIPS),
			.OKWIDTH					(OKWIDTH))
		FrameControllerUnit (
			.rst							(frame_controller_reset),
			.clk							(refclk_int),
			.tx_clk							(tx_refclk_int),
			.scan_done						(scan_done_refclk_domain),
			.capture_idle					(capture_idle_refclk_domain),
			.frame_data_sent				(frame_data_sent_refclk_domain),
			.frame_data_received			(frame_data_received_refclk_domain),
			.capture_start					(capture_start_refclk_domain),
			.capture_running				(capture_running_refclk_domain),
			.capture_done					(capture_done_refclk_domain),
			.data_stream					(data_stream_refclk_domain),
			.blitz_mode						(blitz_mode_refclk_domain),
			.read_trigger					(read_trigger),
			.read_ack_trigger				(read_ack_trigger),
			.block_next_streamout			(block_next_streamout_refclk_domain),
			.number_of_frames				(number_of_frames),
			.patterns_per_frame				(patterns_per_frame),
			.measurements_per_pattern		(measurements_per_pattern),
			.pad_captured					(pad_captured),
			.pad_captured_mask				(pad_captured_mask),
			.blocking						(blocking),
			.refclk_enable					(fsm_refclk_enable),
			.tx_refclk_enable				(fsm_tx_refclk_enable),
			.state                          (fc_state),
			.dynamic_pattern_shift_trigger	(dynamic_pattern_shift_trigger)
	);
	
    assign frame_controller_reset = rst | frame_controller_sw_reset;
    
    
	//-----------------------------------------------------------------------------------
	// Dynamic packet module
    //-----------------------------------------------------------------------------------
    dynamic_packet_module # (
    		.NUMBER_OF_CHIPS				(NUMBER_OF_CHIPS),
    		.OKWIDTH						(OKWIDTH))
    	DPM (
    		.rst							(rst),
    		.clk							(refclk_int),
    		.ti_clk							(ti_clk),
    		
    		.dynamic_mode_enabled			(dynamic_mode_enabled_refclk_domain),
    		.pipe_in_complete				(dynamic_pattern_pipe_in_complete_refclk_domain),
    		
    		.pipe_in_write					(pattern_pipe_write),
    		.pipe_in_16b					(pattern_data_16b),
    		
    		.shift_trigger					(dynamic_pattern_shift_trigger),
    		
    		.shift_clk						(shift_clk),
    		.shift_data						(shift_data)
    );


	//-------------------------------------------------------------------------------
	//  Synchronizer for frame controller
	//-------------------------------------------------------------------------------    
	wire [3:0] fc_signals_refclk_to_ticlk_in;
	wire [3:0] fc_signals_refclk_to_ticlk_out;	
	assign fc_signals_refclk_to_ticlk_in = {
												capture_idle_refclk_domain,
												frame_data_received_refclk_domain,
												capture_running_refclk_domain,
												capture_done_refclk_domain };
	assign capture_idle_ticlk_domain = fc_signals_refclk_to_ticlk_out[3];
	assign frame_data_received_ticlk_domain = fc_signals_refclk_to_ticlk_out[2];
	assign capture_running_ticlk_domain = fc_signals_refclk_to_ticlk_out[1];
	assign capture_done_ticlk_domain = fc_signals_refclk_to_ticlk_out[0];
												
	wire [8:0] fc_signals_ticlk_to_refclk_in;
	wire [8:0] fc_signals_ticlk_to_refclk_out;
	assign fc_signals_ticlk_to_refclk_in = {
												dynamic_pattern_pipe_in_complete_ticlk_domain,
												dynamic_mode_enabled_ticlk_domain,
												blitz_mode_ticlk_domain,
												scan_done_ticlk_domain,
												frame_data_sent_ticlk_domain,
												capture_start_ticlk_domain,
												capture_interrupt_ticlk_domain,
												data_stream_ticlk_domain,
												fsm_bypass_ticlk_domain };
	assign dynamic_pattern_pipe_in_complete_refclk_domain = fc_signals_ticlk_to_refclk_out[8];
	assign dynamic_mode_enabled_refclk_domain = fc_signals_ticlk_to_refclk_out[7];
	assign blitz_mode_refclk_domain = fc_signals_ticlk_to_refclk_out[6];
	assign scan_done_refclk_domain = fc_signals_ticlk_to_refclk_out[5];
	assign frame_data_sent_refclk_domain = fc_signals_ticlk_to_refclk_out[4];
	assign capture_start_refclk_domain = fc_signals_ticlk_to_refclk_out[3];
	assign capture_interrupt_refclk_domain = fc_signals_ticlk_to_refclk_out[2];
	assign data_stream_refclk_domain = fc_signals_ticlk_to_refclk_out[1]; 
	assign fsm_bypass_refclk_domain = fc_signals_ticlk_to_refclk_out[0];
	
												
	synchronizer #	(
												.NumSignals								(9),
												.Stages									(2)
						)
		fc_rc_sync	(
												.rst										(rst),
												.src_clk									(ti_clk),
												.dest_clk								(refclk_int),
												.src_sig									(fc_signals_ticlk_to_refclk_in),
												.dest_sig								(fc_signals_ticlk_to_refclk_out)
						);
						
						
	synchronizer #	(
												.NumSignals								(4),
												.Stages									(2)
						)
		fc_tc_sync	(
												.rst										(rst),
												.src_clk									(refclk_int),
												.dest_clk								(ti_clk),
												.src_sig									(fc_signals_refclk_to_ticlk_in),
												.dest_sig								(fc_signals_refclk_to_ticlk_out)
						);
						

	synchronizer #	(
												.NumSignals								(1),
												.Stages									(2)
						)
		stream_block_sync	(
												.rst										(rst),
												.src_clk									(refclk_int),
												.dest_clk								(tx_refclk_int),
												.src_sig									(block_next_streamout_refclk_domain),
												.dest_sig								(block_next_streamout_ticlk_domain)
						);				



endmodule
