// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Mon Jun 20 14:50:53 2022
// Host        : linrack9.bioeelocal running 64-bit Red Hat Enterprise Linux Server release 7.9 (Maipo)
// Command     : write_verilog -force -mode synth_stub
//               /users/krenehan/MOANA3/FPGA/generic_scan_2by1_version/MOANA2/MOANA2.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a50tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_50MHz, tx_refclk_mmcm, clk_100MHz, 
  clk_25MHz, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_50MHz,tx_refclk_mmcm,clk_100MHz,clk_25MHz,reset,locked,clk_in1" */;
  output clk_50MHz;
  output tx_refclk_mmcm;
  output clk_100MHz;
  output clk_25MHz;
  input reset;
  output locked;
  input clk_in1;
endmodule
