// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Sat Jun 11 17:09:54 2022
// Host        : bioeebeanie.bioeelocal running 64-bit Red Hat Enterprise Linux Server release 7.9 (Maipo)
// Command     : write_verilog -force -mode synth_stub
//               /users/jinwonkim/MOANA/ISE/MOANA2/MOANA2.srcs/sources_1/ip/fifo_W1_R8/fifo_W1_R8_stub.v
// Design      : fifo_W1_R8
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a50tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_3,Vivado 2018.3.1" *)
module fifo_W1_R8(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  overflow, empty, valid, underflow, rd_data_count, wr_rst_busy, rd_rst_busy)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[0:0],wr_en,rd_en,dout[7:0],full,overflow,empty,valid,underflow,rd_data_count[9:0],wr_rst_busy,rd_rst_busy" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [0:0]din;
  input wr_en;
  input rd_en;
  output [7:0]dout;
  output full;
  output overflow;
  output empty;
  output valid;
  output underflow;
  output [9:0]rd_data_count;
  output wr_rst_busy;
  output rd_rst_busy;
endmodule
