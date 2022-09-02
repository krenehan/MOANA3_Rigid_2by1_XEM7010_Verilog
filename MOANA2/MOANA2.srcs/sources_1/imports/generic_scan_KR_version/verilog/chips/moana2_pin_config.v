

// Pin configuration for CNSED2

`ifdef MOTHERBOARD_V1P1


    // Include FPGA I/O pin mapping
    `include "../verilog/boards/motherboard_v1p1_mapping.v"

    // Inputs
	assign 	pad_tx_dataout[1] 	= `FPGA_IO_0;
	assign 	pad_s_out[1] 		= `FPGA_IO_1;
	assign 	pad_s_out[0] 		= `FPGA_IO_2;
	assign 	pad_tx_dataout[0]	= `FPGA_IO_3;
	
	// Outputs
	assign	`FPGA_IO_4		= pad_s_enable[1];
	assign	`FPGA_IO_5		= pad_s_reset; //sw_in_signals[0]
	assign 	`FPGA_IO_6		= pad_s_clk_p;
	assign 	`FPGA_IO_7		= pad_s_clk_n;
	assign 	`FPGA_IO_8		= pad_s_in;
	assign  `FPGA_IO_9		= pad_rstasync; // sw_in_signals[1]
	assign 	`FPGA_IO_10 	= pad_s_update;
	assign 	`FPGA_IO_11 	= pad_s_enable[0];
	
    // Clock outputs
    assign 	`FPGA_IO_12 	= pad_refclk;
    assign 	`FPGA_IO_13 	= pad_tx_refclk;
    
    // Clock inputs 
    assign refclk_ext       = `FPGA_IO_14;
	
    // Board Control
	assign 	`FPGA_IO_15		= vdd_sm_reset_bar;
	assign 	`FPGA_IO_16		= hvdd_ldo_enable;
	assign 	`FPGA_IO_17		= vrst_ldo_enable;
    assign  `FPGA_IO_18     = clock_ls_direction;
    assign  `FPGA_IO_19     = clock_ls_oe_bar;
    assign  `FPGA_IO_20     = cath_sm_enable;
    assign  `FPGA_IO_21     = vcsel_sm_enable;
    assign  `FPGA_IO_22     = pot_clk;
    assign  `FPGA_IO_23     = pot_data;
    assign  `FPGA_IO_24     = pot_cs1_bar;
    assign  `FPGA_IO_25     = pot_cs2_bar;



    
`endif
