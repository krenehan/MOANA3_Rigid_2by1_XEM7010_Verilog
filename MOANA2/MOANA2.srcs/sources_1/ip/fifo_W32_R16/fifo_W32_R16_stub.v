// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Mon Jun 20 09:29:55 2022
// Host        : linrack10.bioeelocal running 64-bit Red Hat Enterprise Linux Server release 7.9 (Maipo)
// Command     : write_verilog -force -mode synth_stub
//               /users/krenehan/MOANA3/FPGA/generic_scan_2by1_version/MOANA2/MOANA2.srcs/sources_1/ip/fifo_W32_R16/fifo_W32_R16_stub.v
// Design      : fifo_W32_R16
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a50tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_3,Vivado 2018.3.1" *)
module fifo_W32_R16(clk, rst, din, wr_en, rd_en, dout, full, overflow, empty, 
  valid, underflow, rd_data_count, wr_rst_busy, rd_rst_busy)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,din[31:0],wr_en,rd_en,dout[15:0],full,overflow,empty,valid,underflow,rd_data_count[13:0],wr_rst_busy,rd_rst_busy" */;
  input clk;
  input rst;
  input [31:0]din;
  input wr_en;
  input rd_en;
  output [15:0]dout;
  output full;
  output overflow;
  output empty;
  output valid;
  output underflow;
  output [13:0]rd_data_count;
  output wr_rst_busy;
  output rd_rst_busy;
endmodule