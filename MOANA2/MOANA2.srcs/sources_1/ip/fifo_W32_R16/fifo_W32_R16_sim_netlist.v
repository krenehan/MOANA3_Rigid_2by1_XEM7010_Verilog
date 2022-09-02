// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Mon Jun 20 09:29:56 2022
// Host        : linrack10.bioeelocal running 64-bit Red Hat Enterprise Linux Server release 7.9 (Maipo)
// Command     : write_verilog -force -mode funcsim
//               /users/krenehan/MOANA3/FPGA/generic_scan_2by1_version/MOANA2/MOANA2.srcs/sources_1/ip/fifo_W32_R16/fifo_W32_R16_sim_netlist.v
// Design      : fifo_W32_R16
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a50tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_W32_R16,fifo_generator_v13_2_3,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_3,Vivado 2018.3.1" *) 
(* NotValidForBitStream *)
module fifo_W32_R16
   (clk,
    rst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    overflow,
    empty,
    valid,
    underflow,
    rd_data_count,
    wr_rst_busy,
    rd_rst_busy);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input clk;
  input rst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [15:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  output overflow;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;
  output underflow;
  output [13:0]rd_data_count;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [31:0]din;
  wire [15:0]dout;
  wire empty;
  wire full;
  wire overflow;
  wire [13:0]rd_data_count;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire underflow;
  wire valid;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [11:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [12:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "12" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "16" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "1" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "1" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "1" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "4kx9" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "4093" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "4092" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "14" *) 
  (* C_RD_DEPTH = "8192" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "13" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "1" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "13" *) 
  (* C_WR_DEPTH = "4096" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "12" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  fifo_W32_R16_fifo_generator_v13_2_3 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(NLW_U0_data_count_UNCONNECTED[11:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(overflow),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(rd_data_count),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(underflow),
        .valid(valid),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[12:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_W32_R16_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module fifo_W32_R16_blk_mem_gen_generic_cstr
   (\SAFETY_CKT_GEN.POR_A_reg ,
    ENA_dly_D,
    ENB_dly_D,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ,
    dout,
    clk,
    ENA_I,
    ENB_I,
    ram_rstram_b,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    din,
    p_19_out,
    ENA_I_0,
    ENB_I_1,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 );
  output \SAFETY_CKT_GEN.POR_A_reg ;
  output ENA_dly_D;
  output ENB_dly_D;
  output \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  output [15:0]dout;
  input clk;
  input ENA_I;
  input ENB_I;
  input ram_rstram_b;
  input [10:0]Q;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input [31:0]din;
  input p_19_out;
  input ENA_I_0;
  input ENB_I_1;
  input \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;

  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire ENA_I;
  wire ENA_I_0;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_I_1;
  wire ENB_dly_D;
  wire [10:0]Q;
  wire \SAFETY_CKT_GEN.POR_A_reg ;
  wire clk;
  wire [31:0]din;
  wire [15:0]dout;
  wire [31:0]doutb_array;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;
  wire p_19_out;
  wire ram_rstram_b;

  fifo_W32_R16_blk_mem_gen_mux__parameterized0 \has_mux_b.B 
       (.clk(clk),
        .dout(dout),
        .doutb_array(doutb_array),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_1 (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ));
  fifo_W32_R16_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\SAFETY_CKT_GEN.POR_A_reg ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .Q(Q),
        .clk(clk),
        .din({din[24:16],din[8:0]}),
        .doutb_array(doutb_array[8:0]),
        .p_19_out(p_19_out),
        .ram_rstram_b(ram_rstram_b));
  fifo_W32_R16_blk_mem_gen_prim_width__parameterized0 \ramloop[1].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\SAFETY_CKT_GEN.POR_A_reg ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .ENA_I_0(ENA_I_0),
        .ENB_I_1(ENB_I_1),
        .Q(Q),
        .clk(clk),
        .din({din[24:16],din[8:0]}),
        .doutb_array(doutb_array[24:16]),
        .p_19_out(p_19_out),
        .ram_rstram_b(ram_rstram_b));
  fifo_W32_R16_blk_mem_gen_prim_width__parameterized1 \ramloop[2].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .ENA_I(ENA_I),
        .ENA_dly_D(ENA_dly_D),
        .ENB_I(ENB_I),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_A_reg_0 (\SAFETY_CKT_GEN.POR_A_reg ),
        .clk(clk),
        .din({din[31:25],din[15:9]}),
        .doutb_array(doutb_array[15:9]),
        .p_19_out(p_19_out),
        .ram_rstram_b(ram_rstram_b));
  fifo_W32_R16_blk_mem_gen_prim_width__parameterized2 \ramloop[3].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\SAFETY_CKT_GEN.POR_A_reg ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .ENA_I_0(ENA_I_0),
        .ENB_I_1(ENB_I_1),
        .Q(Q),
        .clk(clk),
        .din({din[31:25],din[15:9]}),
        .doutb_array(doutb_array[31:25]),
        .p_19_out(p_19_out),
        .ram_rstram_b(ram_rstram_b));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_mux" *) 
module fifo_W32_R16_blk_mem_gen_mux__parameterized0
   (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ,
    dout,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_1 ,
    clk,
    doutb_array);
  output \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;
  output [15:0]dout;
  input \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_1 ;
  input clk;
  input [31:0]doutb_array;

  wire clk;
  wire [15:0]dout;
  wire [31:0]doutb_array;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_1 ;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[0]_INST_0 
       (.I0(doutb_array[16]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[0]),
        .O(dout[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[10]_INST_0 
       (.I0(doutb_array[26]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[10]),
        .O(dout[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[11]_INST_0 
       (.I0(doutb_array[27]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[11]),
        .O(dout[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[12]_INST_0 
       (.I0(doutb_array[28]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[12]),
        .O(dout[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[13]_INST_0 
       (.I0(doutb_array[29]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[13]),
        .O(dout[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[14]_INST_0 
       (.I0(doutb_array[30]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[14]),
        .O(dout[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[15]_INST_0 
       (.I0(doutb_array[31]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[15]),
        .O(dout[15]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[1]_INST_0 
       (.I0(doutb_array[17]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[1]),
        .O(dout[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[2]_INST_0 
       (.I0(doutb_array[18]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[2]),
        .O(dout[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[3]_INST_0 
       (.I0(doutb_array[19]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[3]),
        .O(dout[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[4]_INST_0 
       (.I0(doutb_array[20]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[4]),
        .O(dout[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[5]_INST_0 
       (.I0(doutb_array[21]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[5]),
        .O(dout[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[6]_INST_0 
       (.I0(doutb_array[22]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[6]),
        .O(dout[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[7]_INST_0 
       (.I0(doutb_array[23]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[7]),
        .O(dout[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[8]_INST_0 
       (.I0(doutb_array[24]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[8]),
        .O(dout[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[9]_INST_0 
       (.I0(doutb_array[25]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(doutb_array[9]),
        .O(dout[9]));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_1 ),
        .Q(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_W32_R16_blk_mem_gen_prim_width
   (doutb_array,
    clk,
    ENA_I,
    ENB_I,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    ram_rstram_b,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    din,
    p_19_out);
  output [8:0]doutb_array;
  input clk;
  input ENA_I;
  input ENB_I;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input ram_rstram_b;
  input [10:0]Q;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input [17:0]din;
  input p_19_out;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire ENA_I;
  wire ENB_I;
  wire [10:0]Q;
  wire clk;
  wire [17:0]din;
  wire [8:0]doutb_array;
  wire p_19_out;
  wire ram_rstram_b;

  fifo_W32_R16_blk_mem_gen_prim_wrapper \prim_noinit.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .Q(Q),
        .clk(clk),
        .din(din),
        .doutb_array(doutb_array),
        .p_19_out(p_19_out),
        .ram_rstram_b(ram_rstram_b));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_W32_R16_blk_mem_gen_prim_width__parameterized0
   (doutb_array,
    clk,
    ENA_I_0,
    ENB_I_1,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    ram_rstram_b,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    din,
    p_19_out);
  output [8:0]doutb_array;
  input clk;
  input ENA_I_0;
  input ENB_I_1;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input ram_rstram_b;
  input [10:0]Q;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input [17:0]din;
  input p_19_out;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire ENA_I_0;
  wire ENB_I_1;
  wire [10:0]Q;
  wire clk;
  wire [17:0]din;
  wire [8:0]doutb_array;
  wire p_19_out;
  wire ram_rstram_b;

  fifo_W32_R16_blk_mem_gen_prim_wrapper__parameterized0 \prim_noinit.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .ENA_I_0(ENA_I_0),
        .ENB_I_1(ENB_I_1),
        .Q(Q),
        .clk(clk),
        .din(din),
        .doutb_array(doutb_array),
        .p_19_out(p_19_out),
        .ram_rstram_b(ram_rstram_b));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_W32_R16_blk_mem_gen_prim_width__parameterized1
   (doutb_array,
    \SAFETY_CKT_GEN.POR_A_reg_0 ,
    ENA_dly_D,
    ENB_dly_D,
    clk,
    ENA_I,
    ENB_I,
    ram_rstram_b,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    din,
    p_19_out);
  output [6:0]doutb_array;
  output \SAFETY_CKT_GEN.POR_A_reg_0 ;
  output ENA_dly_D;
  output ENB_dly_D;
  input clk;
  input ENA_I;
  input ENB_I;
  input ram_rstram_b;
  input [10:0]Q;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input [13:0]din;
  input p_19_out;

  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire ENA_I;
  wire ENA_dly;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_dly;
  wire ENB_dly_D;
  wire [10:0]Q;
  wire \SAFETY_CKT_GEN.POR_A_i_1_n_0 ;
  wire \SAFETY_CKT_GEN.POR_A_reg_0 ;
  wire \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3_n_0 ;
  wire \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg_n_0_[0] ;
  wire \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg_n_0_[4] ;
  wire clk;
  wire [13:0]din;
  wire [6:0]doutb_array;
  wire p_19_out;
  wire ram_rstram_b;

  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_D_reg 
       (.C(clk),
        .CE(1'b1),
        .D(ENA_dly),
        .Q(ENA_dly_D),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg 
       (.C(clk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.POR_A_reg_0 ),
        .Q(ENA_dly),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENB_NO_REG.ENB_dly_D_reg 
       (.C(clk),
        .CE(1'b1),
        .D(ENB_dly),
        .Q(ENB_dly_D),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENB_NO_REG.ENB_dly_reg 
       (.C(clk),
        .CE(1'b1),
        .D(ram_rstram_b),
        .Q(ENB_dly),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \SAFETY_CKT_GEN.POR_A_i_1 
       (.I0(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg_n_0_[0] ),
        .I1(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg_n_0_[4] ),
        .O(\SAFETY_CKT_GEN.POR_A_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.POR_A_reg 
       (.C(clk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.POR_A_i_1_n_0 ),
        .Q(\SAFETY_CKT_GEN.POR_A_reg_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(1'b1),
        .Q(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg_n_0_[0] ),
        .R(1'b0));
  (* srl_bus_name = "U0/\inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/SAFETY_CKT_GEN.RSTA_SHFT_REG_reg " *) 
  (* srl_name = "U0/\inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg_n_0_[0] ),
        .Q(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3_n_0 ),
        .Q(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg_n_0_[4] ),
        .R(1'b0));
  fifo_W32_R16_blk_mem_gen_prim_wrapper__parameterized1 \prim_noinit.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\SAFETY_CKT_GEN.POR_A_reg_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .Q(Q),
        .clk(clk),
        .din(din),
        .doutb_array(doutb_array),
        .p_19_out(p_19_out),
        .ram_rstram_b(ram_rstram_b));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_W32_R16_blk_mem_gen_prim_width__parameterized2
   (doutb_array,
    clk,
    ENA_I_0,
    ENB_I_1,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    ram_rstram_b,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    din,
    p_19_out);
  output [6:0]doutb_array;
  input clk;
  input ENA_I_0;
  input ENB_I_1;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input ram_rstram_b;
  input [10:0]Q;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input [13:0]din;
  input p_19_out;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire ENA_I_0;
  wire ENB_I_1;
  wire [10:0]Q;
  wire clk;
  wire [13:0]din;
  wire [6:0]doutb_array;
  wire p_19_out;
  wire ram_rstram_b;

  fifo_W32_R16_blk_mem_gen_prim_wrapper__parameterized2 \prim_noinit.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .ENA_I_0(ENA_I_0),
        .ENB_I_1(ENB_I_1),
        .Q(Q),
        .clk(clk),
        .din(din),
        .doutb_array(doutb_array),
        .p_19_out(p_19_out),
        .ram_rstram_b(ram_rstram_b));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_W32_R16_blk_mem_gen_prim_wrapper
   (doutb_array,
    clk,
    ENA_I,
    ENB_I,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    ram_rstram_b,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    din,
    p_19_out);
  output [8:0]doutb_array;
  input clk;
  input ENA_I;
  input ENB_I;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input ram_rstram_b;
  input [10:0]Q;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [17:0]din;
  input p_19_out;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire ENA_I;
  wire ENB_I;
  wire [10:0]Q;
  wire clk;
  wire [17:0]din;
  wire [8:0]doutb_array;
  wire p_19_out;
  wire ram_rstram_b;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[7:0],din[16:9]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,din[8],din[17]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:8],doutb_array[7:0]}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:1],doutb_array[8]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA_I),
        .ENBWREN(ENB_I),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .RSTRAMB(ram_rstram_b),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({p_19_out,p_19_out,p_19_out,p_19_out}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_W32_R16_blk_mem_gen_prim_wrapper__parameterized0
   (doutb_array,
    clk,
    ENA_I_0,
    ENB_I_1,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    ram_rstram_b,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    din,
    p_19_out);
  output [8:0]doutb_array;
  input clk;
  input ENA_I_0;
  input ENB_I_1;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input ram_rstram_b;
  input [10:0]Q;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [17:0]din;
  input p_19_out;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire ENA_I_0;
  wire ENB_I_1;
  wire [10:0]Q;
  wire clk;
  wire [17:0]din;
  wire [8:0]doutb_array;
  wire p_19_out;
  wire ram_rstram_b;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[7:0],din[16:9]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,din[8],din[17]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:8],doutb_array[7:0]}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:1],doutb_array[8]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA_I_0),
        .ENBWREN(ENB_I_1),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .RSTRAMB(ram_rstram_b),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({p_19_out,p_19_out,p_19_out,p_19_out}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_W32_R16_blk_mem_gen_prim_wrapper__parameterized1
   (doutb_array,
    clk,
    ENA_I,
    ENB_I,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    ram_rstram_b,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    din,
    p_19_out);
  output [6:0]doutb_array;
  input clk;
  input ENA_I;
  input ENB_I;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input ram_rstram_b;
  input [10:0]Q;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [13:0]din;
  input p_19_out;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_60 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_75 ;
  wire ENA_I;
  wire ENB_I;
  wire [10:0]Q;
  wire clk;
  wire [13:0]din;
  wire [6:0]doutb_array;
  wire p_19_out;
  wire ram_rstram_b;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[6:0],1'b0,din[13:7]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_60 ,doutb_array}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_75 }),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA_I),
        .ENBWREN(ENB_I),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .RSTRAMB(ram_rstram_b),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({p_19_out,p_19_out,p_19_out,p_19_out}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_W32_R16_blk_mem_gen_prim_wrapper__parameterized2
   (doutb_array,
    clk,
    ENA_I_0,
    ENB_I_1,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    ram_rstram_b,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    din,
    p_19_out);
  output [6:0]doutb_array;
  input clk;
  input ENA_I_0;
  input ENB_I_1;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input ram_rstram_b;
  input [10:0]Q;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [13:0]din;
  input p_19_out;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_60 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_75 ;
  wire ENA_I_0;
  wire ENB_I_1;
  wire [10:0]Q;
  wire clk;
  wire [13:0]din;
  wire [6:0]doutb_array;
  wire p_19_out;
  wire ram_rstram_b;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[6:0],1'b0,din[13:7]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_60 ,doutb_array}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_75 }),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA_I_0),
        .ENBWREN(ENB_I_1),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .RSTRAMB(ram_rstram_b),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({p_19_out,p_19_out,p_19_out,p_19_out}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module fifo_W32_R16_blk_mem_gen_top
   (\SAFETY_CKT_GEN.POR_A_reg ,
    ENA_dly_D,
    ENB_dly_D,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ,
    dout,
    clk,
    ENA_I,
    ENB_I,
    ram_rstram_b,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    din,
    p_19_out,
    ENA_I_0,
    ENB_I_1,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 );
  output \SAFETY_CKT_GEN.POR_A_reg ;
  output ENA_dly_D;
  output ENB_dly_D;
  output \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  output [15:0]dout;
  input clk;
  input ENA_I;
  input ENB_I;
  input ram_rstram_b;
  input [10:0]Q;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input [31:0]din;
  input p_19_out;
  input ENA_I_0;
  input ENB_I_1;
  input \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;

  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire ENA_I;
  wire ENA_I_0;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_I_1;
  wire ENB_dly_D;
  wire [10:0]Q;
  wire \SAFETY_CKT_GEN.POR_A_reg ;
  wire clk;
  wire [31:0]din;
  wire [15:0]dout;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;
  wire p_19_out;
  wire ram_rstram_b;

  fifo_W32_R16_blk_mem_gen_generic_cstr \valid.cstr 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .ENA_I(ENA_I),
        .ENA_I_0(ENA_I_0),
        .ENA_dly_D(ENA_dly_D),
        .ENB_I(ENB_I),
        .ENB_I_1(ENB_I_1),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_A_reg (\SAFETY_CKT_GEN.POR_A_reg ),
        .clk(clk),
        .din(din),
        .dout(dout),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .p_19_out(p_19_out),
        .ram_rstram_b(ram_rstram_b));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2" *) 
module fifo_W32_R16_blk_mem_gen_v8_4_2
   (\SAFETY_CKT_GEN.POR_A_reg ,
    ENA_dly_D,
    ENB_dly_D,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ,
    dout,
    clk,
    ENA_I,
    ENB_I,
    ram_rstram_b,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    din,
    p_19_out,
    ENA_I_0,
    ENB_I_1,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 );
  output \SAFETY_CKT_GEN.POR_A_reg ;
  output ENA_dly_D;
  output ENB_dly_D;
  output \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  output [15:0]dout;
  input clk;
  input ENA_I;
  input ENB_I;
  input ram_rstram_b;
  input [10:0]Q;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input [31:0]din;
  input p_19_out;
  input ENA_I_0;
  input ENB_I_1;
  input \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;

  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire ENA_I;
  wire ENA_I_0;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_I_1;
  wire ENB_dly_D;
  wire [10:0]Q;
  wire \SAFETY_CKT_GEN.POR_A_reg ;
  wire clk;
  wire [31:0]din;
  wire [15:0]dout;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;
  wire p_19_out;
  wire ram_rstram_b;

  fifo_W32_R16_blk_mem_gen_v8_4_2_synth inst_blk_mem_gen
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .ENA_I(ENA_I),
        .ENA_I_0(ENA_I_0),
        .ENA_dly_D(ENA_dly_D),
        .ENB_I(ENB_I),
        .ENB_I_1(ENB_I_1),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_A_reg (\SAFETY_CKT_GEN.POR_A_reg ),
        .clk(clk),
        .din(din),
        .dout(dout),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .p_19_out(p_19_out),
        .ram_rstram_b(ram_rstram_b));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2_synth" *) 
module fifo_W32_R16_blk_mem_gen_v8_4_2_synth
   (\SAFETY_CKT_GEN.POR_A_reg ,
    ENA_dly_D,
    ENB_dly_D,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ,
    dout,
    clk,
    ENA_I,
    ENB_I,
    ram_rstram_b,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    din,
    p_19_out,
    ENA_I_0,
    ENB_I_1,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 );
  output \SAFETY_CKT_GEN.POR_A_reg ;
  output ENA_dly_D;
  output ENB_dly_D;
  output \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  output [15:0]dout;
  input clk;
  input ENA_I;
  input ENB_I;
  input ram_rstram_b;
  input [10:0]Q;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input [31:0]din;
  input p_19_out;
  input ENA_I_0;
  input ENB_I_1;
  input \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;

  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire ENA_I;
  wire ENA_I_0;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_I_1;
  wire ENB_dly_D;
  wire [10:0]Q;
  wire \SAFETY_CKT_GEN.POR_A_reg ;
  wire clk;
  wire [31:0]din;
  wire [15:0]dout;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;
  wire p_19_out;
  wire ram_rstram_b;

  fifo_W32_R16_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .ENA_I(ENA_I),
        .ENA_I_0(ENA_I_0),
        .ENA_dly_D(ENA_dly_D),
        .ENB_I(ENB_I),
        .ENB_I_1(ENB_I_1),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_A_reg (\SAFETY_CKT_GEN.POR_A_reg ),
        .clk(clk),
        .din(din),
        .dout(dout),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .p_19_out(p_19_out),
        .ram_rstram_b(ram_rstram_b));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_W32_R16_compare
   (comp0,
    v1_reg,
    ram_empty_i_reg);
  output comp0;
  input [0:0]v1_reg;
  input [5:0]ram_empty_i_reg;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire carrynet_4;
  wire carrynet_5;
  wire comp0;
  wire [5:0]ram_empty_i_reg;
  wire [0:0]v1_reg;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO " *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S({ram_empty_i_reg[2:0],v1_reg}));
  (* OPT_MODIFIED = "MLO " *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3],comp0,carrynet_5,carrynet_4}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3],1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3],ram_empty_i_reg[5:3]}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_W32_R16_compare_1
   (comp1,
    v1_reg_0,
    ram_empty_fb_i_i_2);
  output comp1;
  input [0:0]v1_reg_0;
  input [5:0]ram_empty_fb_i_i_2;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire carrynet_4;
  wire carrynet_5;
  wire comp1;
  wire [5:0]ram_empty_fb_i_i_2;
  wire [0:0]v1_reg_0;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO " *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S({ram_empty_fb_i_i_2[2:0],v1_reg_0}));
  (* OPT_MODIFIED = "MLO " *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3],comp1,carrynet_5,carrynet_4}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3],1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3],ram_empty_fb_i_i_2[5:3]}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_W32_R16_compare__parameterized0
   (comp0,
    v1_reg);
  output comp0;
  input [5:0]v1_reg;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire carrynet_4;
  wire comp0;
  wire [5:0]v1_reg;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO " *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg[3:0]));
  (* OPT_MODIFIED = "MLO " *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:2],comp0,carrynet_4}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:2],1'b0,1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:2],v1_reg[5:4]}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_W32_R16_compare__parameterized0_0
   (comp1,
    v1_reg_0,
    ram_full_fb_i_i_3);
  output comp1;
  input [3:0]v1_reg_0;
  input [1:0]ram_full_fb_i_i_3;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire carrynet_4;
  wire comp1;
  wire [1:0]ram_full_fb_i_i_3;
  wire [3:0]v1_reg_0;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO " *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg_0));
  (* OPT_MODIFIED = "MLO " *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:2],comp1,carrynet_4}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:2],1'b0,1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:2],ram_full_fb_i_i_3}));
endmodule

(* ORIG_REF_NAME = "dc_ss" *) 
module fifo_W32_R16_dc_ss
   (rd_data_count,
    S,
    SR,
    \gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ,
    O,
    clk,
    \gasym_dc.rd_depth_gt_wr2.count_reg[7]_0 ,
    \gasym_dc.rd_depth_gt_wr2.count_reg[11]_0 ,
    \gasym_dc.rd_depth_gt_wr2.count_reg[13]_1 ,
    EMPTY,
    out,
    wr_en,
    rd_en);
  output [13:0]rd_data_count;
  output [0:0]S;
  input [0:0]SR;
  input \gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ;
  input [3:0]O;
  input clk;
  input [3:0]\gasym_dc.rd_depth_gt_wr2.count_reg[7]_0 ;
  input [3:0]\gasym_dc.rd_depth_gt_wr2.count_reg[11]_0 ;
  input [1:0]\gasym_dc.rd_depth_gt_wr2.count_reg[13]_1 ;
  input EMPTY;
  input out;
  input wr_en;
  input rd_en;

  wire EMPTY;
  wire [3:0]O;
  wire [0:0]S;
  wire [0:0]SR;
  wire clk;
  wire [3:0]\gasym_dc.rd_depth_gt_wr2.count_reg[11]_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ;
  wire [1:0]\gasym_dc.rd_depth_gt_wr2.count_reg[13]_1 ;
  wire [3:0]\gasym_dc.rd_depth_gt_wr2.count_reg[7]_0 ;
  wire out;
  wire [13:0]rd_data_count;
  wire rd_en;
  wire wr_en;

  LUT5 #(
    .INIT(32'h9A99AAAA)) 
    \gasym_dc.rd_depth_gt_wr2.count[13]_i_5 
       (.I0(rd_data_count[13]),
        .I1(EMPTY),
        .I2(out),
        .I3(wr_en),
        .I4(rd_en),
        .O(S));
  FDRE #(
    .INIT(1'b0)) 
    \gasym_dc.rd_depth_gt_wr2.count_reg[0] 
       (.C(clk),
        .CE(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ),
        .D(O[0]),
        .Q(rd_data_count[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gasym_dc.rd_depth_gt_wr2.count_reg[10] 
       (.C(clk),
        .CE(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ),
        .D(\gasym_dc.rd_depth_gt_wr2.count_reg[11]_0 [2]),
        .Q(rd_data_count[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gasym_dc.rd_depth_gt_wr2.count_reg[11] 
       (.C(clk),
        .CE(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ),
        .D(\gasym_dc.rd_depth_gt_wr2.count_reg[11]_0 [3]),
        .Q(rd_data_count[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gasym_dc.rd_depth_gt_wr2.count_reg[12] 
       (.C(clk),
        .CE(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ),
        .D(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_1 [0]),
        .Q(rd_data_count[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gasym_dc.rd_depth_gt_wr2.count_reg[13] 
       (.C(clk),
        .CE(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ),
        .D(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_1 [1]),
        .Q(rd_data_count[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gasym_dc.rd_depth_gt_wr2.count_reg[1] 
       (.C(clk),
        .CE(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ),
        .D(O[1]),
        .Q(rd_data_count[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gasym_dc.rd_depth_gt_wr2.count_reg[2] 
       (.C(clk),
        .CE(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ),
        .D(O[2]),
        .Q(rd_data_count[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gasym_dc.rd_depth_gt_wr2.count_reg[3] 
       (.C(clk),
        .CE(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ),
        .D(O[3]),
        .Q(rd_data_count[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gasym_dc.rd_depth_gt_wr2.count_reg[4] 
       (.C(clk),
        .CE(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ),
        .D(\gasym_dc.rd_depth_gt_wr2.count_reg[7]_0 [0]),
        .Q(rd_data_count[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gasym_dc.rd_depth_gt_wr2.count_reg[5] 
       (.C(clk),
        .CE(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ),
        .D(\gasym_dc.rd_depth_gt_wr2.count_reg[7]_0 [1]),
        .Q(rd_data_count[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gasym_dc.rd_depth_gt_wr2.count_reg[6] 
       (.C(clk),
        .CE(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ),
        .D(\gasym_dc.rd_depth_gt_wr2.count_reg[7]_0 [2]),
        .Q(rd_data_count[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gasym_dc.rd_depth_gt_wr2.count_reg[7] 
       (.C(clk),
        .CE(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ),
        .D(\gasym_dc.rd_depth_gt_wr2.count_reg[7]_0 [3]),
        .Q(rd_data_count[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gasym_dc.rd_depth_gt_wr2.count_reg[8] 
       (.C(clk),
        .CE(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ),
        .D(\gasym_dc.rd_depth_gt_wr2.count_reg[11]_0 [0]),
        .Q(rd_data_count[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gasym_dc.rd_depth_gt_wr2.count_reg[9] 
       (.C(clk),
        .CE(\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ),
        .D(\gasym_dc.rd_depth_gt_wr2.count_reg[11]_0 [1]),
        .Q(rd_data_count[9]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "fifo_generator_ramfifo" *) 
module fifo_W32_R16_fifo_generator_ramfifo
   (RD_RST_BUSY,
    EMPTY,
    full,
    underflow,
    overflow,
    dout,
    rd_data_count,
    valid,
    clk,
    rst,
    din,
    rd_en,
    wr_en);
  output RD_RST_BUSY;
  output EMPTY;
  output full;
  output underflow;
  output overflow;
  output [15:0]dout;
  output [13:0]rd_data_count;
  output valid;
  input clk;
  input rst;
  input [31:0]din;
  input rd_en;
  input wr_en;

  wire EMPTY;
  wire RD_RST_BUSY;
  wire clk;
  wire [31:0]din;
  wire [15:0]dout;
  wire full;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ENA_I ;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ENA_dly_D ;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ENB_I ;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ENB_dly_D ;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/POR_A ;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ram_rstram_b ;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/ENA_I ;
  wire \gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/ENB_I ;
  wire \gntv_or_sync_fifo.gl0.rd_n_33 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_34 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_37 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_38 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_39 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_40 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_41 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_42 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_43 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_44 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_45 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_46 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_47 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_48 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_2 ;
  wire \grhf.rhf/p_1_out ;
  wire [6:1]\grss.rsts/c1/v1_reg ;
  wire [6:1]\grss.rsts/c2/v1_reg ;
  wire \grss.rsts/comp0 ;
  wire \grss.rsts/comp1 ;
  wire [5:4]\gwss.wsts/c1/v1_reg ;
  wire \gwss.wsts/comp0 ;
  wire \gwss.wsts/comp1 ;
  wire [13:13]in;
  wire overflow;
  wire [12:0]p_0_out;
  wire [10:0]p_12_out;
  wire [11:8]p_13_out;
  wire p_19_out;
  wire p_2_out;
  wire [13:0]rd_data_count;
  wire rd_en;
  wire [12:2]rd_pntr_plus1;
  wire rst;
  wire rstblk_n_10;
  wire rstblk_n_4;
  wire rstblk_n_5;
  wire rstblk_n_6;
  wire rstblk_n_7;
  wire rstblk_n_9;
  wire [1:0]sckt_wr_rst_cc;
  wire sel_pipe;
  wire underflow;
  wire valid;
  wire wr_en;

  fifo_W32_R16_rd_logic \gntv_or_sync_fifo.gl0.rd 
       (.D(rd_pntr_plus1),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (sckt_wr_rst_cc),
        .DI(in),
        .EMPTY(EMPTY),
        .ENB_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ENB_I ),
        .ENB_I_0(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/ENB_I ),
        .ENB_dly_D(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ENB_dly_D ),
        .FULL_FB(\gntv_or_sync_fifo.gl0.wr_n_2 ),
        .Q(p_0_out),
        .S(\gntv_or_sync_fifo.gl0.rd_n_47 ),
        .SR(rstblk_n_5),
        .clk(clk),
        .comp0(\grss.rsts/comp0 ),
        .comp1(\grss.rsts/comp1 ),
        .\gc0.count_d1_reg[12] (\gntv_or_sync_fifo.gl0.rd_n_48 ),
        .\gmux.gm[0].gm1.m1 (p_12_out[0]),
        .\gmux.gm[5].gms.ms (p_13_out),
        .\gv.ram_valid_d1_reg (rstblk_n_10),
        .out(p_2_out),
        .p_1_out(\grhf.rhf/p_1_out ),
        .ram_empty_fb_i_i_2(\grss.rsts/c2/v1_reg ),
        .ram_empty_fb_i_reg(\gntv_or_sync_fifo.gl0.rd_n_34 ),
        .ram_empty_i_reg(\gntv_or_sync_fifo.gl0.rd_n_33 ),
        .ram_empty_i_reg_0({\gntv_or_sync_fifo.gl0.rd_n_37 ,\gntv_or_sync_fifo.gl0.rd_n_38 }),
        .ram_empty_i_reg_1({\gntv_or_sync_fifo.gl0.rd_n_39 ,\gntv_or_sync_fifo.gl0.rd_n_40 ,\gntv_or_sync_fifo.gl0.rd_n_41 ,\gntv_or_sync_fifo.gl0.rd_n_42 }),
        .ram_empty_i_reg_2({\gntv_or_sync_fifo.gl0.rd_n_43 ,\gntv_or_sync_fifo.gl0.rd_n_44 ,\gntv_or_sync_fifo.gl0.rd_n_45 ,\gntv_or_sync_fifo.gl0.rd_n_46 }),
        .ram_empty_i_reg_3(\grss.rsts/c1/v1_reg ),
        .ram_empty_i_reg_4(rstblk_n_4),
        .ram_full_i_reg(rstblk_n_7),
        .ram_full_i_reg_0(rstblk_n_6),
        .rd_data_count(rd_data_count[0]),
        .rd_en(rd_en),
        .sel_pipe(sel_pipe),
        .underflow(underflow),
        .v1_reg(\gwss.wsts/c1/v1_reg ),
        .valid(valid),
        .wr_en(wr_en));
  fifo_W32_R16_wr_logic \gntv_or_sync_fifo.gl0.wr 
       (.D(p_13_out),
        .DI(in),
        .EMPTY(EMPTY),
        .ENA_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ENA_I ),
        .ENA_I_0(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/ENA_I ),
        .ENA_dly_D(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ENA_dly_D ),
        .FULL_FB(\gntv_or_sync_fifo.gl0.wr_n_2 ),
        .Q(p_12_out),
        .S(\gntv_or_sync_fifo.gl0.rd_n_47 ),
        .SR(rstblk_n_5),
        .clk(clk),
        .comp0(\gwss.wsts/comp0 ),
        .comp1(\gwss.wsts/comp1 ),
        .full(full),
        .\gasym_dc.rd_depth_gt_wr2.count_reg[11] ({\gntv_or_sync_fifo.gl0.rd_n_43 ,\gntv_or_sync_fifo.gl0.rd_n_44 ,\gntv_or_sync_fifo.gl0.rd_n_45 ,\gntv_or_sync_fifo.gl0.rd_n_46 }),
        .\gasym_dc.rd_depth_gt_wr2.count_reg[13] (\gntv_or_sync_fifo.gl0.rd_n_33 ),
        .\gasym_dc.rd_depth_gt_wr2.count_reg[3] ({\gntv_or_sync_fifo.gl0.rd_n_37 ,\gntv_or_sync_fifo.gl0.rd_n_38 }),
        .\gasym_dc.rd_depth_gt_wr2.count_reg[7] ({\gntv_or_sync_fifo.gl0.rd_n_39 ,\gntv_or_sync_fifo.gl0.rd_n_40 ,\gntv_or_sync_fifo.gl0.rd_n_41 ,\gntv_or_sync_fifo.gl0.rd_n_42 }),
        .\gcc0.gc0.count_d1_reg[11] (\grss.rsts/c1/v1_reg ),
        .\gcc0.gc0.count_d1_reg[11]_0 (\grss.rsts/c2/v1_reg ),
        .\gmux.gm[6].gms.ms (p_0_out[12:1]),
        .\gmux.gm[6].gms.ms_0 (rd_pntr_plus1),
        .\gof.gof1.overflow_i_reg (rstblk_n_9),
        .overflow(overflow),
        .p_19_out(p_19_out),
        .ram_full_fb_i_i_3(\gwss.wsts/c1/v1_reg ),
        .ram_full_i_reg(\gntv_or_sync_fifo.gl0.rd_n_34 ),
        .rd_data_count(rd_data_count),
        .rd_en(rd_en),
        .wr_en(wr_en));
  fifo_W32_R16_memory \gntv_or_sync_fifo.mem 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (p_0_out[11:0]),
        .ENA_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ENA_I ),
        .ENA_I_0(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/ENA_I ),
        .ENA_dly_D(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ENA_dly_D ),
        .ENB_I(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ENB_I ),
        .ENB_I_1(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/ENB_I ),
        .ENB_dly_D(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ENB_dly_D ),
        .POR_A(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/POR_A ),
        .Q(p_12_out),
        .clk(clk),
        .din(din),
        .dout(dout),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] (\gntv_or_sync_fifo.gl0.rd_n_48 ),
        .p_19_out(p_19_out),
        .ram_rstram_b(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ram_rstram_b ),
        .sel_pipe(sel_pipe));
  fifo_W32_R16_reset_blk_ramfifo rstblk
       (.EMPTY(EMPTY),
        .FULL_FB(\gntv_or_sync_fifo.gl0.wr_n_2 ),
        .POR_A(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/POR_A ),
        .Q(sckt_wr_rst_cc),
        .SR(rstblk_n_5),
        .clk(clk),
        .comp0(\grss.rsts/comp0 ),
        .comp0_1(\gwss.wsts/comp0 ),
        .comp1(\grss.rsts/comp1 ),
        .comp1_0(\gwss.wsts/comp1 ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_0 (rstblk_n_4),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_1 (rstblk_n_6),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_2 (rstblk_n_7),
        .out(RD_RST_BUSY),
        .p_19_out(p_19_out),
        .p_1_out(\grhf.rhf/p_1_out ),
        .ram_empty_i_reg(rstblk_n_10),
        .ram_empty_i_reg_0(p_2_out),
        .ram_rstram_b(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/ram_rstram_b ),
        .rd_en(rd_en),
        .rst(rst),
        .wr_en(wr_en),
        .wr_en_0(rstblk_n_9));
endmodule

(* ORIG_REF_NAME = "fifo_generator_top" *) 
module fifo_W32_R16_fifo_generator_top
   (WR_RST_BUSY,
    EMPTY,
    full,
    underflow,
    overflow,
    dout,
    rd_data_count,
    valid,
    clk,
    rst,
    din,
    rd_en,
    wr_en);
  output WR_RST_BUSY;
  output EMPTY;
  output full;
  output underflow;
  output overflow;
  output [15:0]dout;
  output [13:0]rd_data_count;
  output valid;
  input clk;
  input rst;
  input [31:0]din;
  input rd_en;
  input wr_en;

  wire EMPTY;
  wire WR_RST_BUSY;
  wire clk;
  wire [31:0]din;
  wire [15:0]dout;
  wire full;
  wire overflow;
  wire [13:0]rd_data_count;
  wire rd_en;
  wire rst;
  wire underflow;
  wire valid;
  wire wr_en;

  fifo_W32_R16_fifo_generator_ramfifo \grf.rf 
       (.EMPTY(EMPTY),
        .RD_RST_BUSY(WR_RST_BUSY),
        .clk(clk),
        .din(din),
        .dout(dout),
        .full(full),
        .overflow(overflow),
        .rd_data_count(rd_data_count),
        .rd_en(rd_en),
        .rst(rst),
        .underflow(underflow),
        .valid(valid),
        .wr_en(wr_en));
endmodule

(* C_ADD_NGC_CONSTRAINT = "0" *) (* C_APPLICATION_TYPE_AXIS = "0" *) (* C_APPLICATION_TYPE_RACH = "0" *) 
(* C_APPLICATION_TYPE_RDCH = "0" *) (* C_APPLICATION_TYPE_WACH = "0" *) (* C_APPLICATION_TYPE_WDCH = "0" *) 
(* C_APPLICATION_TYPE_WRCH = "0" *) (* C_AXIS_TDATA_WIDTH = "8" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TKEEP_WIDTH = "1" *) (* C_AXIS_TSTRB_WIDTH = "1" *) 
(* C_AXIS_TUSER_WIDTH = "4" *) (* C_AXIS_TYPE = "0" *) (* C_AXI_ADDR_WIDTH = "32" *) 
(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) (* C_AXI_LEN_WIDTH = "8" *) 
(* C_AXI_LOCK_WIDTH = "1" *) (* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_TYPE = "1" *) 
(* C_AXI_WUSER_WIDTH = "1" *) (* C_COMMON_CLOCK = "1" *) (* C_COUNT_TYPE = "0" *) 
(* C_DATA_COUNT_WIDTH = "12" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "32" *) 
(* C_DIN_WIDTH_AXIS = "1" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "1" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "16" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "1" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "artix7" *) (* C_FULL_FLAGS_RST_VAL = "1" *) (* C_HAS_ALMOST_EMPTY = "0" *) 
(* C_HAS_ALMOST_FULL = "0" *) (* C_HAS_AXIS_TDATA = "1" *) (* C_HAS_AXIS_TDEST = "0" *) 
(* C_HAS_AXIS_TID = "0" *) (* C_HAS_AXIS_TKEEP = "0" *) (* C_HAS_AXIS_TLAST = "0" *) 
(* C_HAS_AXIS_TREADY = "1" *) (* C_HAS_AXIS_TSTRB = "0" *) (* C_HAS_AXIS_TUSER = "1" *) 
(* C_HAS_AXI_ARUSER = "0" *) (* C_HAS_AXI_AWUSER = "0" *) (* C_HAS_AXI_BUSER = "0" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_AXI_RD_CHANNEL = "1" *) (* C_HAS_AXI_RUSER = "0" *) 
(* C_HAS_AXI_WR_CHANNEL = "1" *) (* C_HAS_AXI_WUSER = "0" *) (* C_HAS_BACKUP = "0" *) 
(* C_HAS_DATA_COUNT = "0" *) (* C_HAS_DATA_COUNTS_AXIS = "0" *) (* C_HAS_DATA_COUNTS_RACH = "0" *) 
(* C_HAS_DATA_COUNTS_RDCH = "0" *) (* C_HAS_DATA_COUNTS_WACH = "0" *) (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
(* C_HAS_DATA_COUNTS_WRCH = "0" *) (* C_HAS_INT_CLK = "0" *) (* C_HAS_MASTER_CE = "0" *) 
(* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "1" *) (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
(* C_HAS_PROG_FLAGS_RACH = "0" *) (* C_HAS_PROG_FLAGS_RDCH = "0" *) (* C_HAS_PROG_FLAGS_WACH = "0" *) 
(* C_HAS_PROG_FLAGS_WDCH = "0" *) (* C_HAS_PROG_FLAGS_WRCH = "0" *) (* C_HAS_RD_DATA_COUNT = "1" *) 
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "1" *) (* C_HAS_SLAVE_CE = "0" *) 
(* C_HAS_SRST = "0" *) (* C_HAS_UNDERFLOW = "1" *) (* C_HAS_VALID = "1" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "0" *) (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "1" *) (* C_IMPLEMENTATION_TYPE_WACH = "1" *) (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "1" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "0" *) 
(* C_MEMORY_TYPE = "1" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "1" *) (* C_PRELOAD_REGS = "0" *) (* C_PRIM_FIFO_TYPE = "4kx9" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
(* C_PRIM_FIFO_TYPE_WACH = "512x36" *) (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "0" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "4093" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "4092" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_PROG_FULL_TYPE_AXIS = "0" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "14" *) 
(* C_RD_DEPTH = "8192" *) (* C_RD_FREQ = "1" *) (* C_RD_PNTR_WIDTH = "13" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) 
(* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "0" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "1" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) 
(* C_WRCH_TYPE = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "13" *) 
(* C_WR_DEPTH = "4096" *) (* C_WR_DEPTH_AXIS = "1024" *) (* C_WR_DEPTH_RACH = "16" *) 
(* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) 
(* C_WR_DEPTH_WRCH = "16" *) (* C_WR_FREQ = "1" *) (* C_WR_PNTR_WIDTH = "12" *) 
(* C_WR_PNTR_WIDTH_AXIS = "10" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) (* ORIG_REF_NAME = "fifo_generator_v13_2_3" *) 
module fifo_W32_R16_fifo_generator_v13_2_3
   (backup,
    backup_marker,
    clk,
    rst,
    srst,
    wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    prog_empty_thresh,
    prog_empty_thresh_assert,
    prog_empty_thresh_negate,
    prog_full_thresh,
    prog_full_thresh_assert,
    prog_full_thresh_negate,
    int_clk,
    injectdbiterr,
    injectsbiterr,
    sleep,
    dout,
    full,
    almost_full,
    wr_ack,
    overflow,
    empty,
    almost_empty,
    valid,
    underflow,
    data_count,
    rd_data_count,
    wr_data_count,
    prog_full,
    prog_empty,
    sbiterr,
    dbiterr,
    wr_rst_busy,
    rd_rst_busy,
    m_aclk,
    s_aclk,
    s_aresetn,
    m_aclk_en,
    s_aclk_en,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awregion,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arregion,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axi_aw_injectsbiterr,
    axi_aw_injectdbiterr,
    axi_aw_prog_full_thresh,
    axi_aw_prog_empty_thresh,
    axi_aw_data_count,
    axi_aw_wr_data_count,
    axi_aw_rd_data_count,
    axi_aw_sbiterr,
    axi_aw_dbiterr,
    axi_aw_overflow,
    axi_aw_underflow,
    axi_aw_prog_full,
    axi_aw_prog_empty,
    axi_w_injectsbiterr,
    axi_w_injectdbiterr,
    axi_w_prog_full_thresh,
    axi_w_prog_empty_thresh,
    axi_w_data_count,
    axi_w_wr_data_count,
    axi_w_rd_data_count,
    axi_w_sbiterr,
    axi_w_dbiterr,
    axi_w_overflow,
    axi_w_underflow,
    axi_w_prog_full,
    axi_w_prog_empty,
    axi_b_injectsbiterr,
    axi_b_injectdbiterr,
    axi_b_prog_full_thresh,
    axi_b_prog_empty_thresh,
    axi_b_data_count,
    axi_b_wr_data_count,
    axi_b_rd_data_count,
    axi_b_sbiterr,
    axi_b_dbiterr,
    axi_b_overflow,
    axi_b_underflow,
    axi_b_prog_full,
    axi_b_prog_empty,
    axi_ar_injectsbiterr,
    axi_ar_injectdbiterr,
    axi_ar_prog_full_thresh,
    axi_ar_prog_empty_thresh,
    axi_ar_data_count,
    axi_ar_wr_data_count,
    axi_ar_rd_data_count,
    axi_ar_sbiterr,
    axi_ar_dbiterr,
    axi_ar_overflow,
    axi_ar_underflow,
    axi_ar_prog_full,
    axi_ar_prog_empty,
    axi_r_injectsbiterr,
    axi_r_injectdbiterr,
    axi_r_prog_full_thresh,
    axi_r_prog_empty_thresh,
    axi_r_data_count,
    axi_r_wr_data_count,
    axi_r_rd_data_count,
    axi_r_sbiterr,
    axi_r_dbiterr,
    axi_r_overflow,
    axi_r_underflow,
    axi_r_prog_full,
    axi_r_prog_empty,
    axis_injectsbiterr,
    axis_injectdbiterr,
    axis_prog_full_thresh,
    axis_prog_empty_thresh,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count,
    axis_sbiterr,
    axis_dbiterr,
    axis_overflow,
    axis_underflow,
    axis_prog_full,
    axis_prog_empty);
  input backup;
  input backup_marker;
  input clk;
  input rst;
  input srst;
  input wr_clk;
  input wr_rst;
  input rd_clk;
  input rd_rst;
  input [31:0]din;
  input wr_en;
  input rd_en;
  input [12:0]prog_empty_thresh;
  input [12:0]prog_empty_thresh_assert;
  input [12:0]prog_empty_thresh_negate;
  input [11:0]prog_full_thresh;
  input [11:0]prog_full_thresh_assert;
  input [11:0]prog_full_thresh_negate;
  input int_clk;
  input injectdbiterr;
  input injectsbiterr;
  input sleep;
  output [15:0]dout;
  output full;
  output almost_full;
  output wr_ack;
  output overflow;
  output empty;
  output almost_empty;
  output valid;
  output underflow;
  output [11:0]data_count;
  output [13:0]rd_data_count;
  output [12:0]wr_data_count;
  output prog_full;
  output prog_empty;
  output sbiterr;
  output dbiterr;
  output wr_rst_busy;
  output rd_rst_busy;
  input m_aclk;
  input s_aclk;
  input s_aresetn;
  input m_aclk_en;
  input s_aclk_en;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [3:0]s_axi_awregion;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [3:0]s_axi_arregion;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [0:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [63:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;
  input s_axis_tvalid;
  output s_axis_tready;
  input [7:0]s_axis_tdata;
  input [0:0]s_axis_tstrb;
  input [0:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [3:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [7:0]m_axis_tdata;
  output [0:0]m_axis_tstrb;
  output [0:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [3:0]m_axis_tuser;
  input axi_aw_injectsbiterr;
  input axi_aw_injectdbiterr;
  input [3:0]axi_aw_prog_full_thresh;
  input [3:0]axi_aw_prog_empty_thresh;
  output [4:0]axi_aw_data_count;
  output [4:0]axi_aw_wr_data_count;
  output [4:0]axi_aw_rd_data_count;
  output axi_aw_sbiterr;
  output axi_aw_dbiterr;
  output axi_aw_overflow;
  output axi_aw_underflow;
  output axi_aw_prog_full;
  output axi_aw_prog_empty;
  input axi_w_injectsbiterr;
  input axi_w_injectdbiterr;
  input [9:0]axi_w_prog_full_thresh;
  input [9:0]axi_w_prog_empty_thresh;
  output [10:0]axi_w_data_count;
  output [10:0]axi_w_wr_data_count;
  output [10:0]axi_w_rd_data_count;
  output axi_w_sbiterr;
  output axi_w_dbiterr;
  output axi_w_overflow;
  output axi_w_underflow;
  output axi_w_prog_full;
  output axi_w_prog_empty;
  input axi_b_injectsbiterr;
  input axi_b_injectdbiterr;
  input [3:0]axi_b_prog_full_thresh;
  input [3:0]axi_b_prog_empty_thresh;
  output [4:0]axi_b_data_count;
  output [4:0]axi_b_wr_data_count;
  output [4:0]axi_b_rd_data_count;
  output axi_b_sbiterr;
  output axi_b_dbiterr;
  output axi_b_overflow;
  output axi_b_underflow;
  output axi_b_prog_full;
  output axi_b_prog_empty;
  input axi_ar_injectsbiterr;
  input axi_ar_injectdbiterr;
  input [3:0]axi_ar_prog_full_thresh;
  input [3:0]axi_ar_prog_empty_thresh;
  output [4:0]axi_ar_data_count;
  output [4:0]axi_ar_wr_data_count;
  output [4:0]axi_ar_rd_data_count;
  output axi_ar_sbiterr;
  output axi_ar_dbiterr;
  output axi_ar_overflow;
  output axi_ar_underflow;
  output axi_ar_prog_full;
  output axi_ar_prog_empty;
  input axi_r_injectsbiterr;
  input axi_r_injectdbiterr;
  input [9:0]axi_r_prog_full_thresh;
  input [9:0]axi_r_prog_empty_thresh;
  output [10:0]axi_r_data_count;
  output [10:0]axi_r_wr_data_count;
  output [10:0]axi_r_rd_data_count;
  output axi_r_sbiterr;
  output axi_r_dbiterr;
  output axi_r_overflow;
  output axi_r_underflow;
  output axi_r_prog_full;
  output axi_r_prog_empty;
  input axis_injectsbiterr;
  input axis_injectdbiterr;
  input [9:0]axis_prog_full_thresh;
  input [9:0]axis_prog_empty_thresh;
  output [10:0]axis_data_count;
  output [10:0]axis_wr_data_count;
  output [10:0]axis_rd_data_count;
  output axis_sbiterr;
  output axis_dbiterr;
  output axis_overflow;
  output axis_underflow;
  output axis_prog_full;
  output axis_prog_empty;

  wire \<const0> ;
  wire \<const1> ;
  wire clk;
  wire [31:0]din;
  wire [15:0]dout;
  wire empty;
  wire full;
  wire overflow;
  wire [13:0]rd_data_count;
  wire rd_en;
  wire rst;
  wire underflow;
  wire valid;
  wire wr_en;
  wire wr_rst_busy;

  assign almost_empty = \<const0> ;
  assign almost_full = \<const0> ;
  assign axi_ar_data_count[4] = \<const0> ;
  assign axi_ar_data_count[3] = \<const0> ;
  assign axi_ar_data_count[2] = \<const0> ;
  assign axi_ar_data_count[1] = \<const0> ;
  assign axi_ar_data_count[0] = \<const0> ;
  assign axi_ar_dbiterr = \<const0> ;
  assign axi_ar_overflow = \<const0> ;
  assign axi_ar_prog_empty = \<const1> ;
  assign axi_ar_prog_full = \<const0> ;
  assign axi_ar_rd_data_count[4] = \<const0> ;
  assign axi_ar_rd_data_count[3] = \<const0> ;
  assign axi_ar_rd_data_count[2] = \<const0> ;
  assign axi_ar_rd_data_count[1] = \<const0> ;
  assign axi_ar_rd_data_count[0] = \<const0> ;
  assign axi_ar_sbiterr = \<const0> ;
  assign axi_ar_underflow = \<const0> ;
  assign axi_ar_wr_data_count[4] = \<const0> ;
  assign axi_ar_wr_data_count[3] = \<const0> ;
  assign axi_ar_wr_data_count[2] = \<const0> ;
  assign axi_ar_wr_data_count[1] = \<const0> ;
  assign axi_ar_wr_data_count[0] = \<const0> ;
  assign axi_aw_data_count[4] = \<const0> ;
  assign axi_aw_data_count[3] = \<const0> ;
  assign axi_aw_data_count[2] = \<const0> ;
  assign axi_aw_data_count[1] = \<const0> ;
  assign axi_aw_data_count[0] = \<const0> ;
  assign axi_aw_dbiterr = \<const0> ;
  assign axi_aw_overflow = \<const0> ;
  assign axi_aw_prog_empty = \<const1> ;
  assign axi_aw_prog_full = \<const0> ;
  assign axi_aw_rd_data_count[4] = \<const0> ;
  assign axi_aw_rd_data_count[3] = \<const0> ;
  assign axi_aw_rd_data_count[2] = \<const0> ;
  assign axi_aw_rd_data_count[1] = \<const0> ;
  assign axi_aw_rd_data_count[0] = \<const0> ;
  assign axi_aw_sbiterr = \<const0> ;
  assign axi_aw_underflow = \<const0> ;
  assign axi_aw_wr_data_count[4] = \<const0> ;
  assign axi_aw_wr_data_count[3] = \<const0> ;
  assign axi_aw_wr_data_count[2] = \<const0> ;
  assign axi_aw_wr_data_count[1] = \<const0> ;
  assign axi_aw_wr_data_count[0] = \<const0> ;
  assign axi_b_data_count[4] = \<const0> ;
  assign axi_b_data_count[3] = \<const0> ;
  assign axi_b_data_count[2] = \<const0> ;
  assign axi_b_data_count[1] = \<const0> ;
  assign axi_b_data_count[0] = \<const0> ;
  assign axi_b_dbiterr = \<const0> ;
  assign axi_b_overflow = \<const0> ;
  assign axi_b_prog_empty = \<const1> ;
  assign axi_b_prog_full = \<const0> ;
  assign axi_b_rd_data_count[4] = \<const0> ;
  assign axi_b_rd_data_count[3] = \<const0> ;
  assign axi_b_rd_data_count[2] = \<const0> ;
  assign axi_b_rd_data_count[1] = \<const0> ;
  assign axi_b_rd_data_count[0] = \<const0> ;
  assign axi_b_sbiterr = \<const0> ;
  assign axi_b_underflow = \<const0> ;
  assign axi_b_wr_data_count[4] = \<const0> ;
  assign axi_b_wr_data_count[3] = \<const0> ;
  assign axi_b_wr_data_count[2] = \<const0> ;
  assign axi_b_wr_data_count[1] = \<const0> ;
  assign axi_b_wr_data_count[0] = \<const0> ;
  assign axi_r_data_count[10] = \<const0> ;
  assign axi_r_data_count[9] = \<const0> ;
  assign axi_r_data_count[8] = \<const0> ;
  assign axi_r_data_count[7] = \<const0> ;
  assign axi_r_data_count[6] = \<const0> ;
  assign axi_r_data_count[5] = \<const0> ;
  assign axi_r_data_count[4] = \<const0> ;
  assign axi_r_data_count[3] = \<const0> ;
  assign axi_r_data_count[2] = \<const0> ;
  assign axi_r_data_count[1] = \<const0> ;
  assign axi_r_data_count[0] = \<const0> ;
  assign axi_r_dbiterr = \<const0> ;
  assign axi_r_overflow = \<const0> ;
  assign axi_r_prog_empty = \<const1> ;
  assign axi_r_prog_full = \<const0> ;
  assign axi_r_rd_data_count[10] = \<const0> ;
  assign axi_r_rd_data_count[9] = \<const0> ;
  assign axi_r_rd_data_count[8] = \<const0> ;
  assign axi_r_rd_data_count[7] = \<const0> ;
  assign axi_r_rd_data_count[6] = \<const0> ;
  assign axi_r_rd_data_count[5] = \<const0> ;
  assign axi_r_rd_data_count[4] = \<const0> ;
  assign axi_r_rd_data_count[3] = \<const0> ;
  assign axi_r_rd_data_count[2] = \<const0> ;
  assign axi_r_rd_data_count[1] = \<const0> ;
  assign axi_r_rd_data_count[0] = \<const0> ;
  assign axi_r_sbiterr = \<const0> ;
  assign axi_r_underflow = \<const0> ;
  assign axi_r_wr_data_count[10] = \<const0> ;
  assign axi_r_wr_data_count[9] = \<const0> ;
  assign axi_r_wr_data_count[8] = \<const0> ;
  assign axi_r_wr_data_count[7] = \<const0> ;
  assign axi_r_wr_data_count[6] = \<const0> ;
  assign axi_r_wr_data_count[5] = \<const0> ;
  assign axi_r_wr_data_count[4] = \<const0> ;
  assign axi_r_wr_data_count[3] = \<const0> ;
  assign axi_r_wr_data_count[2] = \<const0> ;
  assign axi_r_wr_data_count[1] = \<const0> ;
  assign axi_r_wr_data_count[0] = \<const0> ;
  assign axi_w_data_count[10] = \<const0> ;
  assign axi_w_data_count[9] = \<const0> ;
  assign axi_w_data_count[8] = \<const0> ;
  assign axi_w_data_count[7] = \<const0> ;
  assign axi_w_data_count[6] = \<const0> ;
  assign axi_w_data_count[5] = \<const0> ;
  assign axi_w_data_count[4] = \<const0> ;
  assign axi_w_data_count[3] = \<const0> ;
  assign axi_w_data_count[2] = \<const0> ;
  assign axi_w_data_count[1] = \<const0> ;
  assign axi_w_data_count[0] = \<const0> ;
  assign axi_w_dbiterr = \<const0> ;
  assign axi_w_overflow = \<const0> ;
  assign axi_w_prog_empty = \<const1> ;
  assign axi_w_prog_full = \<const0> ;
  assign axi_w_rd_data_count[10] = \<const0> ;
  assign axi_w_rd_data_count[9] = \<const0> ;
  assign axi_w_rd_data_count[8] = \<const0> ;
  assign axi_w_rd_data_count[7] = \<const0> ;
  assign axi_w_rd_data_count[6] = \<const0> ;
  assign axi_w_rd_data_count[5] = \<const0> ;
  assign axi_w_rd_data_count[4] = \<const0> ;
  assign axi_w_rd_data_count[3] = \<const0> ;
  assign axi_w_rd_data_count[2] = \<const0> ;
  assign axi_w_rd_data_count[1] = \<const0> ;
  assign axi_w_rd_data_count[0] = \<const0> ;
  assign axi_w_sbiterr = \<const0> ;
  assign axi_w_underflow = \<const0> ;
  assign axi_w_wr_data_count[10] = \<const0> ;
  assign axi_w_wr_data_count[9] = \<const0> ;
  assign axi_w_wr_data_count[8] = \<const0> ;
  assign axi_w_wr_data_count[7] = \<const0> ;
  assign axi_w_wr_data_count[6] = \<const0> ;
  assign axi_w_wr_data_count[5] = \<const0> ;
  assign axi_w_wr_data_count[4] = \<const0> ;
  assign axi_w_wr_data_count[3] = \<const0> ;
  assign axi_w_wr_data_count[2] = \<const0> ;
  assign axi_w_wr_data_count[1] = \<const0> ;
  assign axi_w_wr_data_count[0] = \<const0> ;
  assign axis_data_count[10] = \<const0> ;
  assign axis_data_count[9] = \<const0> ;
  assign axis_data_count[8] = \<const0> ;
  assign axis_data_count[7] = \<const0> ;
  assign axis_data_count[6] = \<const0> ;
  assign axis_data_count[5] = \<const0> ;
  assign axis_data_count[4] = \<const0> ;
  assign axis_data_count[3] = \<const0> ;
  assign axis_data_count[2] = \<const0> ;
  assign axis_data_count[1] = \<const0> ;
  assign axis_data_count[0] = \<const0> ;
  assign axis_dbiterr = \<const0> ;
  assign axis_overflow = \<const0> ;
  assign axis_prog_empty = \<const1> ;
  assign axis_prog_full = \<const0> ;
  assign axis_rd_data_count[10] = \<const0> ;
  assign axis_rd_data_count[9] = \<const0> ;
  assign axis_rd_data_count[8] = \<const0> ;
  assign axis_rd_data_count[7] = \<const0> ;
  assign axis_rd_data_count[6] = \<const0> ;
  assign axis_rd_data_count[5] = \<const0> ;
  assign axis_rd_data_count[4] = \<const0> ;
  assign axis_rd_data_count[3] = \<const0> ;
  assign axis_rd_data_count[2] = \<const0> ;
  assign axis_rd_data_count[1] = \<const0> ;
  assign axis_rd_data_count[0] = \<const0> ;
  assign axis_sbiterr = \<const0> ;
  assign axis_underflow = \<const0> ;
  assign axis_wr_data_count[10] = \<const0> ;
  assign axis_wr_data_count[9] = \<const0> ;
  assign axis_wr_data_count[8] = \<const0> ;
  assign axis_wr_data_count[7] = \<const0> ;
  assign axis_wr_data_count[6] = \<const0> ;
  assign axis_wr_data_count[5] = \<const0> ;
  assign axis_wr_data_count[4] = \<const0> ;
  assign axis_wr_data_count[3] = \<const0> ;
  assign axis_wr_data_count[2] = \<const0> ;
  assign axis_wr_data_count[1] = \<const0> ;
  assign axis_wr_data_count[0] = \<const0> ;
  assign data_count[11] = \<const0> ;
  assign data_count[10] = \<const0> ;
  assign data_count[9] = \<const0> ;
  assign data_count[8] = \<const0> ;
  assign data_count[7] = \<const0> ;
  assign data_count[6] = \<const0> ;
  assign data_count[5] = \<const0> ;
  assign data_count[4] = \<const0> ;
  assign data_count[3] = \<const0> ;
  assign data_count[2] = \<const0> ;
  assign data_count[1] = \<const0> ;
  assign data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[63] = \<const0> ;
  assign m_axi_wdata[62] = \<const0> ;
  assign m_axi_wdata[61] = \<const0> ;
  assign m_axi_wdata[60] = \<const0> ;
  assign m_axi_wdata[59] = \<const0> ;
  assign m_axi_wdata[58] = \<const0> ;
  assign m_axi_wdata[57] = \<const0> ;
  assign m_axi_wdata[56] = \<const0> ;
  assign m_axi_wdata[55] = \<const0> ;
  assign m_axi_wdata[54] = \<const0> ;
  assign m_axi_wdata[53] = \<const0> ;
  assign m_axi_wdata[52] = \<const0> ;
  assign m_axi_wdata[51] = \<const0> ;
  assign m_axi_wdata[50] = \<const0> ;
  assign m_axi_wdata[49] = \<const0> ;
  assign m_axi_wdata[48] = \<const0> ;
  assign m_axi_wdata[47] = \<const0> ;
  assign m_axi_wdata[46] = \<const0> ;
  assign m_axi_wdata[45] = \<const0> ;
  assign m_axi_wdata[44] = \<const0> ;
  assign m_axi_wdata[43] = \<const0> ;
  assign m_axi_wdata[42] = \<const0> ;
  assign m_axi_wdata[41] = \<const0> ;
  assign m_axi_wdata[40] = \<const0> ;
  assign m_axi_wdata[39] = \<const0> ;
  assign m_axi_wdata[38] = \<const0> ;
  assign m_axi_wdata[37] = \<const0> ;
  assign m_axi_wdata[36] = \<const0> ;
  assign m_axi_wdata[35] = \<const0> ;
  assign m_axi_wdata[34] = \<const0> ;
  assign m_axi_wdata[33] = \<const0> ;
  assign m_axi_wdata[32] = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[7] = \<const0> ;
  assign m_axi_wstrb[6] = \<const0> ;
  assign m_axi_wstrb[5] = \<const0> ;
  assign m_axi_wstrb[4] = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign m_axis_tdata[7] = \<const0> ;
  assign m_axis_tdata[6] = \<const0> ;
  assign m_axis_tdata[5] = \<const0> ;
  assign m_axis_tdata[4] = \<const0> ;
  assign m_axis_tdata[3] = \<const0> ;
  assign m_axis_tdata[2] = \<const0> ;
  assign m_axis_tdata[1] = \<const0> ;
  assign m_axis_tdata[0] = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tlast = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign m_axis_tuser[3] = \<const0> ;
  assign m_axis_tuser[2] = \<const0> ;
  assign m_axis_tuser[1] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign m_axis_tvalid = \<const0> ;
  assign prog_empty = \<const0> ;
  assign prog_full = \<const0> ;
  assign rd_rst_busy = wr_rst_busy;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[63] = \<const0> ;
  assign s_axi_rdata[62] = \<const0> ;
  assign s_axi_rdata[61] = \<const0> ;
  assign s_axi_rdata[60] = \<const0> ;
  assign s_axi_rdata[59] = \<const0> ;
  assign s_axi_rdata[58] = \<const0> ;
  assign s_axi_rdata[57] = \<const0> ;
  assign s_axi_rdata[56] = \<const0> ;
  assign s_axi_rdata[55] = \<const0> ;
  assign s_axi_rdata[54] = \<const0> ;
  assign s_axi_rdata[53] = \<const0> ;
  assign s_axi_rdata[52] = \<const0> ;
  assign s_axi_rdata[51] = \<const0> ;
  assign s_axi_rdata[50] = \<const0> ;
  assign s_axi_rdata[49] = \<const0> ;
  assign s_axi_rdata[48] = \<const0> ;
  assign s_axi_rdata[47] = \<const0> ;
  assign s_axi_rdata[46] = \<const0> ;
  assign s_axi_rdata[45] = \<const0> ;
  assign s_axi_rdata[44] = \<const0> ;
  assign s_axi_rdata[43] = \<const0> ;
  assign s_axi_rdata[42] = \<const0> ;
  assign s_axi_rdata[41] = \<const0> ;
  assign s_axi_rdata[40] = \<const0> ;
  assign s_axi_rdata[39] = \<const0> ;
  assign s_axi_rdata[38] = \<const0> ;
  assign s_axi_rdata[37] = \<const0> ;
  assign s_axi_rdata[36] = \<const0> ;
  assign s_axi_rdata[35] = \<const0> ;
  assign s_axi_rdata[34] = \<const0> ;
  assign s_axi_rdata[33] = \<const0> ;
  assign s_axi_rdata[32] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign s_axis_tready = \<const0> ;
  assign sbiterr = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[12] = \<const0> ;
  assign wr_data_count[11] = \<const0> ;
  assign wr_data_count[10] = \<const0> ;
  assign wr_data_count[9] = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  fifo_W32_R16_fifo_generator_v13_2_3_synth inst_fifo_gen
       (.EMPTY(empty),
        .RD_RST_BUSY(wr_rst_busy),
        .clk(clk),
        .din(din),
        .dout(dout),
        .full(full),
        .overflow(overflow),
        .rd_data_count(rd_data_count),
        .rd_en(rd_en),
        .rst(rst),
        .underflow(underflow),
        .valid(valid),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "fifo_generator_v13_2_3_synth" *) 
module fifo_W32_R16_fifo_generator_v13_2_3_synth
   (RD_RST_BUSY,
    EMPTY,
    full,
    underflow,
    overflow,
    dout,
    rd_data_count,
    valid,
    clk,
    rst,
    din,
    rd_en,
    wr_en);
  output RD_RST_BUSY;
  output EMPTY;
  output full;
  output underflow;
  output overflow;
  output [15:0]dout;
  output [13:0]rd_data_count;
  output valid;
  input clk;
  input rst;
  input [31:0]din;
  input rd_en;
  input wr_en;

  wire EMPTY;
  wire RD_RST_BUSY;
  wire clk;
  wire [31:0]din;
  wire [15:0]dout;
  wire full;
  wire overflow;
  wire [13:0]rd_data_count;
  wire rd_en;
  wire rst;
  wire underflow;
  wire valid;
  wire wr_en;

  fifo_W32_R16_fifo_generator_top \gconvfifo.rf 
       (.EMPTY(EMPTY),
        .WR_RST_BUSY(RD_RST_BUSY),
        .clk(clk),
        .din(din),
        .dout(dout),
        .full(full),
        .overflow(overflow),
        .rd_data_count(rd_data_count),
        .rd_en(rd_en),
        .rst(rst),
        .underflow(underflow),
        .valid(valid),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "memory" *) 
module fifo_W32_R16_memory
   (POR_A,
    ENA_dly_D,
    ENB_dly_D,
    sel_pipe,
    dout,
    clk,
    ENA_I,
    ENB_I,
    ram_rstram_b,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    din,
    p_19_out,
    ENA_I_0,
    ENB_I_1,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] );
  output POR_A;
  output ENA_dly_D;
  output ENB_dly_D;
  output sel_pipe;
  output [15:0]dout;
  input clk;
  input ENA_I;
  input ENB_I;
  input ram_rstram_b;
  input [10:0]Q;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input [31:0]din;
  input p_19_out;
  input ENA_I_0;
  input ENB_I_1;
  input \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;

  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire ENA_I;
  wire ENA_I_0;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_I_1;
  wire ENB_dly_D;
  wire POR_A;
  wire [10:0]Q;
  wire clk;
  wire [31:0]din;
  wire [15:0]dout;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  wire p_19_out;
  wire ram_rstram_b;
  wire sel_pipe;

  fifo_W32_R16_blk_mem_gen_v8_4_2 \gbm.gbmg.gbmga.ngecc.bmg 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .ENA_I(ENA_I),
        .ENA_I_0(ENA_I_0),
        .ENA_dly_D(ENA_dly_D),
        .ENB_I(ENB_I),
        .ENB_I_1(ENB_I_1),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_A_reg (POR_A),
        .clk(clk),
        .din(din),
        .dout(dout),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] (sel_pipe),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ),
        .p_19_out(p_19_out),
        .ram_rstram_b(ram_rstram_b));
endmodule

(* ORIG_REF_NAME = "rd_bin_cntr" *) 
module fifo_W32_R16_rd_bin_cntr
   (D,
    ENB_I,
    Q,
    ENB_I_0,
    v1_reg_0,
    v1_reg_1,
    v1_reg,
    \gc0.count_d1_reg[12]_0 ,
    SR,
    p_8_out,
    clk,
    out,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    rd_en,
    ENB_dly_D,
    \gmux.gm[0].gm1.m1 ,
    \gmux.gm[5].gms.ms ,
    sel_pipe);
  output [10:0]D;
  output ENB_I;
  output [12:0]Q;
  output ENB_I_0;
  output [0:0]v1_reg_0;
  output [0:0]v1_reg_1;
  output [1:0]v1_reg;
  output \gc0.count_d1_reg[12]_0 ;
  input [0:0]SR;
  input p_8_out;
  input clk;
  input out;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input rd_en;
  input ENB_dly_D;
  input [0:0]\gmux.gm[0].gm1.m1 ;
  input [3:0]\gmux.gm[5].gms.ms ;
  input sel_pipe;

  wire [10:0]D;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire ENB_I;
  wire ENB_I_0;
  wire ENB_dly_D;
  wire [12:0]Q;
  wire [0:0]SR;
  wire clk;
  wire \gc0.count[0]_i_2_n_0 ;
  wire \gc0.count_d1_reg[12]_0 ;
  wire \gc0.count_reg[0]_i_1_n_0 ;
  wire \gc0.count_reg[0]_i_1_n_1 ;
  wire \gc0.count_reg[0]_i_1_n_2 ;
  wire \gc0.count_reg[0]_i_1_n_3 ;
  wire \gc0.count_reg[0]_i_1_n_4 ;
  wire \gc0.count_reg[0]_i_1_n_5 ;
  wire \gc0.count_reg[0]_i_1_n_6 ;
  wire \gc0.count_reg[0]_i_1_n_7 ;
  wire \gc0.count_reg[12]_i_1_n_7 ;
  wire \gc0.count_reg[4]_i_1_n_0 ;
  wire \gc0.count_reg[4]_i_1_n_1 ;
  wire \gc0.count_reg[4]_i_1_n_2 ;
  wire \gc0.count_reg[4]_i_1_n_3 ;
  wire \gc0.count_reg[4]_i_1_n_4 ;
  wire \gc0.count_reg[4]_i_1_n_5 ;
  wire \gc0.count_reg[4]_i_1_n_6 ;
  wire \gc0.count_reg[4]_i_1_n_7 ;
  wire \gc0.count_reg[8]_i_1_n_0 ;
  wire \gc0.count_reg[8]_i_1_n_1 ;
  wire \gc0.count_reg[8]_i_1_n_2 ;
  wire \gc0.count_reg[8]_i_1_n_3 ;
  wire \gc0.count_reg[8]_i_1_n_4 ;
  wire \gc0.count_reg[8]_i_1_n_5 ;
  wire \gc0.count_reg[8]_i_1_n_6 ;
  wire \gc0.count_reg[8]_i_1_n_7 ;
  wire [0:0]\gmux.gm[0].gm1.m1 ;
  wire [3:0]\gmux.gm[5].gms.ms ;
  wire out;
  wire p_8_out;
  wire rd_en;
  wire [1:0]rd_pntr_plus1;
  wire sel_pipe;
  wire [1:0]v1_reg;
  wire [0:0]v1_reg_0;
  wire [0:0]v1_reg_1;
  wire [3:0]\NLW_gc0.count_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_gc0.count_reg[12]_i_1_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFFFFF55515550)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2 
       (.I0(Q[12]),
        .I1(out),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [1]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [0]),
        .I4(rd_en),
        .I5(ENB_dly_D),
        .O(ENB_I));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAA2AAA0)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__0 
       (.I0(Q[12]),
        .I1(out),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [1]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [0]),
        .I4(rd_en),
        .I5(ENB_dly_D),
        .O(ENB_I_0));
  LUT1 #(
    .INIT(2'h1)) 
    \gc0.count[0]_i_2 
       (.I0(rd_pntr_plus1[0]),
        .O(\gc0.count[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[0] 
       (.C(clk),
        .CE(p_8_out),
        .D(rd_pntr_plus1[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[10] 
       (.C(clk),
        .CE(p_8_out),
        .D(D[8]),
        .Q(Q[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[11] 
       (.C(clk),
        .CE(p_8_out),
        .D(D[9]),
        .Q(Q[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[12] 
       (.C(clk),
        .CE(p_8_out),
        .D(D[10]),
        .Q(Q[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[1] 
       (.C(clk),
        .CE(p_8_out),
        .D(rd_pntr_plus1[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[2] 
       (.C(clk),
        .CE(p_8_out),
        .D(D[0]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[3] 
       (.C(clk),
        .CE(p_8_out),
        .D(D[1]),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[4] 
       (.C(clk),
        .CE(p_8_out),
        .D(D[2]),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[5] 
       (.C(clk),
        .CE(p_8_out),
        .D(D[3]),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[6] 
       (.C(clk),
        .CE(p_8_out),
        .D(D[4]),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[7] 
       (.C(clk),
        .CE(p_8_out),
        .D(D[5]),
        .Q(Q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[8] 
       (.C(clk),
        .CE(p_8_out),
        .D(D[6]),
        .Q(Q[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[9] 
       (.C(clk),
        .CE(p_8_out),
        .D(D[7]),
        .Q(Q[9]),
        .R(SR));
  FDSE #(
    .INIT(1'b1)) 
    \gc0.count_reg[0] 
       (.C(clk),
        .CE(p_8_out),
        .D(\gc0.count_reg[0]_i_1_n_7 ),
        .Q(rd_pntr_plus1[0]),
        .S(SR));
  CARRY4 \gc0.count_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\gc0.count_reg[0]_i_1_n_0 ,\gc0.count_reg[0]_i_1_n_1 ,\gc0.count_reg[0]_i_1_n_2 ,\gc0.count_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\gc0.count_reg[0]_i_1_n_4 ,\gc0.count_reg[0]_i_1_n_5 ,\gc0.count_reg[0]_i_1_n_6 ,\gc0.count_reg[0]_i_1_n_7 }),
        .S({D[1:0],rd_pntr_plus1[1],\gc0.count[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[10] 
       (.C(clk),
        .CE(p_8_out),
        .D(\gc0.count_reg[8]_i_1_n_5 ),
        .Q(D[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[11] 
       (.C(clk),
        .CE(p_8_out),
        .D(\gc0.count_reg[8]_i_1_n_4 ),
        .Q(D[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[12] 
       (.C(clk),
        .CE(p_8_out),
        .D(\gc0.count_reg[12]_i_1_n_7 ),
        .Q(D[10]),
        .R(SR));
  CARRY4 \gc0.count_reg[12]_i_1 
       (.CI(\gc0.count_reg[8]_i_1_n_0 ),
        .CO(\NLW_gc0.count_reg[12]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_gc0.count_reg[12]_i_1_O_UNCONNECTED [3:1],\gc0.count_reg[12]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,D[10]}));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[1] 
       (.C(clk),
        .CE(p_8_out),
        .D(\gc0.count_reg[0]_i_1_n_6 ),
        .Q(rd_pntr_plus1[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[2] 
       (.C(clk),
        .CE(p_8_out),
        .D(\gc0.count_reg[0]_i_1_n_5 ),
        .Q(D[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[3] 
       (.C(clk),
        .CE(p_8_out),
        .D(\gc0.count_reg[0]_i_1_n_4 ),
        .Q(D[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[4] 
       (.C(clk),
        .CE(p_8_out),
        .D(\gc0.count_reg[4]_i_1_n_7 ),
        .Q(D[2]),
        .R(SR));
  CARRY4 \gc0.count_reg[4]_i_1 
       (.CI(\gc0.count_reg[0]_i_1_n_0 ),
        .CO({\gc0.count_reg[4]_i_1_n_0 ,\gc0.count_reg[4]_i_1_n_1 ,\gc0.count_reg[4]_i_1_n_2 ,\gc0.count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\gc0.count_reg[4]_i_1_n_4 ,\gc0.count_reg[4]_i_1_n_5 ,\gc0.count_reg[4]_i_1_n_6 ,\gc0.count_reg[4]_i_1_n_7 }),
        .S(D[5:2]));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[5] 
       (.C(clk),
        .CE(p_8_out),
        .D(\gc0.count_reg[4]_i_1_n_6 ),
        .Q(D[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[6] 
       (.C(clk),
        .CE(p_8_out),
        .D(\gc0.count_reg[4]_i_1_n_5 ),
        .Q(D[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[7] 
       (.C(clk),
        .CE(p_8_out),
        .D(\gc0.count_reg[4]_i_1_n_4 ),
        .Q(D[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[8] 
       (.C(clk),
        .CE(p_8_out),
        .D(\gc0.count_reg[8]_i_1_n_7 ),
        .Q(D[6]),
        .R(SR));
  CARRY4 \gc0.count_reg[8]_i_1 
       (.CI(\gc0.count_reg[4]_i_1_n_0 ),
        .CO({\gc0.count_reg[8]_i_1_n_0 ,\gc0.count_reg[8]_i_1_n_1 ,\gc0.count_reg[8]_i_1_n_2 ,\gc0.count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\gc0.count_reg[8]_i_1_n_4 ,\gc0.count_reg[8]_i_1_n_5 ,\gc0.count_reg[8]_i_1_n_6 ,\gc0.count_reg[8]_i_1_n_7 }),
        .S(D[9:6]));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[9] 
       (.C(clk),
        .CE(p_8_out),
        .D(\gc0.count_reg[8]_i_1_n_6 ),
        .Q(D[7]),
        .R(SR));
  LUT3 #(
    .INIT(8'h09)) 
    \gmux.gm[0].gm1.m1_i_1__1 
       (.I0(Q[1]),
        .I1(\gmux.gm[0].gm1.m1 ),
        .I2(Q[0]),
        .O(v1_reg_0));
  LUT3 #(
    .INIT(8'h09)) 
    \gmux.gm[0].gm1.m1_i_1__2 
       (.I0(rd_pntr_plus1[1]),
        .I1(\gmux.gm[0].gm1.m1 ),
        .I2(rd_pntr_plus1[0]),
        .O(v1_reg_1));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[4].gms.ms_i_1__2 
       (.I0(Q[10]),
        .I1(\gmux.gm[5].gms.ms [0]),
        .I2(Q[9]),
        .I3(\gmux.gm[5].gms.ms [1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[5].gms.ms_i_1__2 
       (.I0(Q[12]),
        .I1(\gmux.gm[5].gms.ms [2]),
        .I2(Q[11]),
        .I3(\gmux.gm[5].gms.ms [3]),
        .O(v1_reg[1]));
  LUT6 #(
    .INIT(64'hAAAEAAAFAAA2AAA0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe[0]_i_1 
       (.I0(Q[12]),
        .I1(out),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [1]),
        .I3(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [0]),
        .I4(rd_en),
        .I5(sel_pipe),
        .O(\gc0.count_d1_reg[12]_0 ));
endmodule

(* ORIG_REF_NAME = "rd_handshaking_flags" *) 
module fifo_W32_R16_rd_handshaking_flags
   (underflow,
    valid,
    p_1_out,
    clk,
    \gv.ram_valid_d1_reg_0 );
  output underflow;
  output valid;
  input p_1_out;
  input clk;
  input \gv.ram_valid_d1_reg_0 ;

  wire clk;
  wire \gv.ram_valid_d1_reg_0 ;
  wire p_1_out;
  wire underflow;
  wire valid;

  FDRE #(
    .INIT(1'b0)) 
    \guf.guf1.underflow_i_reg 
       (.C(clk),
        .CE(1'b1),
        .D(p_1_out),
        .Q(underflow),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gv.ram_valid_d1_reg 
       (.C(clk),
        .CE(1'b1),
        .D(\gv.ram_valid_d1_reg_0 ),
        .Q(valid),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "rd_logic" *) 
module fifo_W32_R16_rd_logic
   (comp0,
    comp1,
    out,
    EMPTY,
    underflow,
    D,
    valid,
    ENB_I,
    Q,
    ENB_I_0,
    DI,
    ram_empty_i_reg,
    ram_empty_fb_i_reg,
    v1_reg,
    ram_empty_i_reg_0,
    ram_empty_i_reg_1,
    ram_empty_i_reg_2,
    S,
    \gc0.count_d1_reg[12] ,
    ram_empty_i_reg_3,
    ram_empty_fb_i_i_2,
    ram_empty_i_reg_4,
    clk,
    p_1_out,
    SR,
    \gv.ram_valid_d1_reg ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    rd_en,
    ENB_dly_D,
    FULL_FB,
    wr_en,
    ram_full_i_reg,
    ram_full_i_reg_0,
    \gmux.gm[0].gm1.m1 ,
    \gmux.gm[5].gms.ms ,
    rd_data_count,
    sel_pipe);
  output comp0;
  output comp1;
  output out;
  output EMPTY;
  output underflow;
  output [10:0]D;
  output valid;
  output ENB_I;
  output [12:0]Q;
  output ENB_I_0;
  output [0:0]DI;
  output ram_empty_i_reg;
  output ram_empty_fb_i_reg;
  output [1:0]v1_reg;
  output [1:0]ram_empty_i_reg_0;
  output [3:0]ram_empty_i_reg_1;
  output [3:0]ram_empty_i_reg_2;
  output [0:0]S;
  output \gc0.count_d1_reg[12] ;
  input [5:0]ram_empty_i_reg_3;
  input [5:0]ram_empty_fb_i_i_2;
  input ram_empty_i_reg_4;
  input clk;
  input p_1_out;
  input [0:0]SR;
  input \gv.ram_valid_d1_reg ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input rd_en;
  input ENB_dly_D;
  input FULL_FB;
  input wr_en;
  input ram_full_i_reg;
  input ram_full_i_reg_0;
  input [0:0]\gmux.gm[0].gm1.m1 ;
  input [3:0]\gmux.gm[5].gms.ms ;
  input [0:0]rd_data_count;
  input sel_pipe;

  wire [10:0]D;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [0:0]DI;
  wire EMPTY;
  wire ENB_I;
  wire ENB_I_0;
  wire ENB_dly_D;
  wire FULL_FB;
  wire [12:0]Q;
  wire [0:0]S;
  wire [0:0]SR;
  wire [0:0]\c1/v1_reg ;
  wire [0:0]\c2/v1_reg ;
  wire clk;
  wire comp0;
  wire comp1;
  wire \gc0.count_d1_reg[12] ;
  wire [0:0]\gmux.gm[0].gm1.m1 ;
  wire [3:0]\gmux.gm[5].gms.ms ;
  wire \gv.ram_valid_d1_reg ;
  wire out;
  wire p_1_out;
  wire p_8_out;
  wire [5:0]ram_empty_fb_i_i_2;
  wire ram_empty_fb_i_reg;
  wire ram_empty_i_reg;
  wire [1:0]ram_empty_i_reg_0;
  wire [3:0]ram_empty_i_reg_1;
  wire [3:0]ram_empty_i_reg_2;
  wire [5:0]ram_empty_i_reg_3;
  wire ram_empty_i_reg_4;
  wire ram_full_i_reg;
  wire ram_full_i_reg_0;
  wire [0:0]rd_data_count;
  wire rd_en;
  wire sel_pipe;
  wire underflow;
  wire [1:0]v1_reg;
  wire valid;
  wire wr_en;

  fifo_W32_R16_rd_handshaking_flags \grhf.rhf 
       (.clk(clk),
        .\gv.ram_valid_d1_reg_0 (\gv.ram_valid_d1_reg ),
        .p_1_out(p_1_out),
        .underflow(underflow),
        .valid(valid));
  fifo_W32_R16_rd_status_flags_ss \grss.rsts 
       (.DI(DI),
        .FULL_FB(FULL_FB),
        .Q(Q[0]),
        .S(S),
        .clk(clk),
        .comp0(comp0),
        .comp1(comp1),
        .out(out),
        .p_8_out(p_8_out),
        .ram_empty_fb_i_i_2(ram_empty_fb_i_i_2),
        .ram_empty_fb_i_reg_0(ram_empty_fb_i_reg),
        .ram_empty_i_reg_0(EMPTY),
        .ram_empty_i_reg_1(ram_empty_i_reg),
        .ram_empty_i_reg_2(ram_empty_i_reg_0),
        .ram_empty_i_reg_3(ram_empty_i_reg_1),
        .ram_empty_i_reg_4(ram_empty_i_reg_2),
        .ram_empty_i_reg_5(ram_empty_i_reg_3),
        .ram_empty_i_reg_6(ram_empty_i_reg_4),
        .ram_full_i_reg(ram_full_i_reg),
        .ram_full_i_reg_0(ram_full_i_reg_0),
        .rd_data_count(rd_data_count),
        .rd_en(rd_en),
        .v1_reg(\c1/v1_reg ),
        .v1_reg_0(\c2/v1_reg ),
        .wr_en(wr_en));
  fifo_W32_R16_rd_bin_cntr rpntr
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .ENB_I(ENB_I),
        .ENB_I_0(ENB_I_0),
        .ENB_dly_D(ENB_dly_D),
        .Q(Q),
        .SR(SR),
        .clk(clk),
        .\gc0.count_d1_reg[12]_0 (\gc0.count_d1_reg[12] ),
        .\gmux.gm[0].gm1.m1 (\gmux.gm[0].gm1.m1 ),
        .\gmux.gm[5].gms.ms (\gmux.gm[5].gms.ms ),
        .out(out),
        .p_8_out(p_8_out),
        .rd_en(rd_en),
        .sel_pipe(sel_pipe),
        .v1_reg(v1_reg),
        .v1_reg_0(\c1/v1_reg ),
        .v1_reg_1(\c2/v1_reg ));
endmodule

(* ORIG_REF_NAME = "rd_status_flags_ss" *) 
module fifo_W32_R16_rd_status_flags_ss
   (comp0,
    comp1,
    out,
    ram_empty_i_reg_0,
    DI,
    ram_empty_i_reg_1,
    p_8_out,
    ram_empty_fb_i_reg_0,
    ram_empty_i_reg_2,
    ram_empty_i_reg_3,
    ram_empty_i_reg_4,
    S,
    v1_reg,
    ram_empty_i_reg_5,
    v1_reg_0,
    ram_empty_fb_i_i_2,
    ram_empty_i_reg_6,
    clk,
    FULL_FB,
    wr_en,
    rd_en,
    ram_full_i_reg,
    Q,
    ram_full_i_reg_0,
    rd_data_count);
  output comp0;
  output comp1;
  output out;
  output ram_empty_i_reg_0;
  output [0:0]DI;
  output ram_empty_i_reg_1;
  output p_8_out;
  output ram_empty_fb_i_reg_0;
  output [1:0]ram_empty_i_reg_2;
  output [3:0]ram_empty_i_reg_3;
  output [3:0]ram_empty_i_reg_4;
  output [0:0]S;
  input [0:0]v1_reg;
  input [5:0]ram_empty_i_reg_5;
  input [0:0]v1_reg_0;
  input [5:0]ram_empty_fb_i_i_2;
  input ram_empty_i_reg_6;
  input clk;
  input FULL_FB;
  input wr_en;
  input rd_en;
  input ram_full_i_reg;
  input [0:0]Q;
  input ram_full_i_reg_0;
  input [0:0]rd_data_count;

  wire [0:0]DI;
  wire FULL_FB;
  wire [0:0]Q;
  wire [0:0]S;
  wire clk;
  wire comp0;
  wire comp1;
  wire p_8_out;
  (* DONT_TOUCH *) wire ram_empty_fb_i;
  wire [5:0]ram_empty_fb_i_i_2;
  wire ram_empty_fb_i_reg_0;
  (* DONT_TOUCH *) wire ram_empty_i;
  wire ram_empty_i_reg_1;
  wire [1:0]ram_empty_i_reg_2;
  wire [3:0]ram_empty_i_reg_3;
  wire [3:0]ram_empty_i_reg_4;
  wire [5:0]ram_empty_i_reg_5;
  wire ram_empty_i_reg_6;
  wire ram_full_i_reg;
  wire ram_full_i_reg_0;
  wire [0:0]rd_data_count;
  wire rd_en;
  wire [0:0]v1_reg;
  wire [0:0]v1_reg_0;
  wire wr_en;

  assign out = ram_empty_fb_i;
  assign ram_empty_i_reg_0 = ram_empty_i;
  fifo_W32_R16_compare c1
       (.comp0(comp0),
        .ram_empty_i_reg(ram_empty_i_reg_5),
        .v1_reg(v1_reg));
  fifo_W32_R16_compare_1 c2
       (.comp1(comp1),
        .ram_empty_fb_i_i_2(ram_empty_fb_i_i_2),
        .v1_reg_0(v1_reg_0));
  LUT4 #(
    .INIT(16'h4500)) 
    \gasym_dc.rd_depth_gt_wr2.count[11]_i_2 
       (.I0(ram_empty_i),
        .I1(FULL_FB),
        .I2(wr_en),
        .I3(rd_en),
        .O(ram_empty_i_reg_4[3]));
  LUT4 #(
    .INIT(16'h4500)) 
    \gasym_dc.rd_depth_gt_wr2.count[11]_i_3 
       (.I0(ram_empty_i),
        .I1(FULL_FB),
        .I2(wr_en),
        .I3(rd_en),
        .O(ram_empty_i_reg_4[2]));
  LUT4 #(
    .INIT(16'h4500)) 
    \gasym_dc.rd_depth_gt_wr2.count[11]_i_4 
       (.I0(ram_empty_i),
        .I1(FULL_FB),
        .I2(wr_en),
        .I3(rd_en),
        .O(ram_empty_i_reg_4[1]));
  LUT4 #(
    .INIT(16'h4500)) 
    \gasym_dc.rd_depth_gt_wr2.count[11]_i_5 
       (.I0(ram_empty_i),
        .I1(FULL_FB),
        .I2(wr_en),
        .I3(rd_en),
        .O(ram_empty_i_reg_4[0]));
  LUT4 #(
    .INIT(16'h44F4)) 
    \gasym_dc.rd_depth_gt_wr2.count[13]_i_2 
       (.I0(ram_empty_i),
        .I1(rd_en),
        .I2(wr_en),
        .I3(FULL_FB),
        .O(ram_empty_i_reg_1));
  LUT4 #(
    .INIT(16'h4500)) 
    \gasym_dc.rd_depth_gt_wr2.count[13]_i_4 
       (.I0(ram_empty_i),
        .I1(FULL_FB),
        .I2(wr_en),
        .I3(rd_en),
        .O(DI));
  LUT4 #(
    .INIT(16'h4500)) 
    \gasym_dc.rd_depth_gt_wr2.count[3]_i_2 
       (.I0(ram_empty_i),
        .I1(FULL_FB),
        .I2(wr_en),
        .I3(rd_en),
        .O(ram_empty_i_reg_2[1]));
  LUT4 #(
    .INIT(16'h4500)) 
    \gasym_dc.rd_depth_gt_wr2.count[3]_i_3 
       (.I0(ram_empty_i),
        .I1(FULL_FB),
        .I2(wr_en),
        .I3(rd_en),
        .O(ram_empty_i_reg_2[0]));
  LUT3 #(
    .INIT(8'hB4)) 
    \gasym_dc.rd_depth_gt_wr2.count[3]_i_7 
       (.I0(ram_empty_i),
        .I1(rd_en),
        .I2(rd_data_count),
        .O(S));
  LUT4 #(
    .INIT(16'h4500)) 
    \gasym_dc.rd_depth_gt_wr2.count[7]_i_2 
       (.I0(ram_empty_i),
        .I1(FULL_FB),
        .I2(wr_en),
        .I3(rd_en),
        .O(ram_empty_i_reg_3[3]));
  LUT4 #(
    .INIT(16'h4500)) 
    \gasym_dc.rd_depth_gt_wr2.count[7]_i_3 
       (.I0(ram_empty_i),
        .I1(FULL_FB),
        .I2(wr_en),
        .I3(rd_en),
        .O(ram_empty_i_reg_3[2]));
  LUT4 #(
    .INIT(16'h4500)) 
    \gasym_dc.rd_depth_gt_wr2.count[7]_i_4 
       (.I0(ram_empty_i),
        .I1(FULL_FB),
        .I2(wr_en),
        .I3(rd_en),
        .O(ram_empty_i_reg_3[1]));
  LUT4 #(
    .INIT(16'h4500)) 
    \gasym_dc.rd_depth_gt_wr2.count[7]_i_5 
       (.I0(ram_empty_i),
        .I1(FULL_FB),
        .I2(wr_en),
        .I3(rd_en),
        .O(ram_empty_i_reg_3[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \gc0.count_d1[12]_i_1 
       (.I0(rd_en),
        .I1(ram_empty_fb_i),
        .O(p_8_out));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ram_empty_fb_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(ram_empty_i_reg_6),
        .Q(ram_empty_fb_i),
        .R(1'b0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ram_empty_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(ram_empty_i_reg_6),
        .Q(ram_empty_i),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    ram_full_fb_i_i_1
       (.I0(ram_empty_fb_i),
        .I1(ram_full_i_reg),
        .I2(rd_en),
        .I3(Q),
        .I4(ram_full_i_reg_0),
        .O(ram_empty_fb_i_reg_0));
endmodule

(* ORIG_REF_NAME = "reset_blk_ramfifo" *) 
module fifo_W32_R16_reset_blk_ramfifo
   (out,
    Q,
    ram_rstram_b,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_0 ,
    SR,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_1 ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_2 ,
    p_1_out,
    wr_en_0,
    ram_empty_i_reg,
    rst,
    clk,
    POR_A,
    p_19_out,
    comp0,
    ram_empty_i_reg_0,
    FULL_FB,
    wr_en,
    rd_en,
    comp1,
    comp1_0,
    comp0_1,
    EMPTY);
  output out;
  output [1:0]Q;
  output ram_rstram_b;
  output \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_0 ;
  output [0:0]SR;
  output \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_1 ;
  output \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_2 ;
  output p_1_out;
  output wr_en_0;
  output ram_empty_i_reg;
  input rst;
  input clk;
  input POR_A;
  input p_19_out;
  input comp0;
  input ram_empty_i_reg_0;
  input FULL_FB;
  input wr_en;
  input rd_en;
  input comp1;
  input comp1_0;
  input comp0_1;
  input EMPTY;

  wire EMPTY;
  wire FULL_FB;
  wire POR_A;
  wire [1:0]Q;
  wire [0:0]SR;
  wire clk;
  wire comp0;
  wire comp0_1;
  wire comp1;
  wire comp1_0;
  wire dest_rst;
  wire \grstd1.grst_full.grst_f.rst_d3_i_1_n_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_1 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_2 ;
  wire p_19_out;
  wire p_1_out;
  wire ram_empty_fb_i_i_2_n_0;
  wire ram_empty_i_reg;
  wire ram_empty_i_reg_0;
  wire ram_rstram_b;
  wire rd_en;
  wire rst;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d2;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d3;
  wire [3:2]sckt_wr_rst_cc;
  wire wr_en;
  wire wr_en_0;
  wire wr_rst_busy_i;

  assign out = wr_rst_busy_i;
  LUT3 #(
    .INIT(8'hFE)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_3 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(POR_A),
        .O(ram_rstram_b));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \gasym_dc.rd_depth_gt_wr2.count[13]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(SR));
  LUT3 #(
    .INIT(8'hC8)) 
    \gof.gof1.overflow_i_i_1 
       (.I0(wr_rst_busy_i),
        .I1(wr_en),
        .I2(FULL_FB),
        .O(wr_en_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d1_reg 
       (.C(clk),
        .CE(1'b1),
        .D(wr_rst_busy_i),
        .Q(rst_d1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d2_reg 
       (.C(clk),
        .CE(1'b1),
        .D(rst_d1),
        .Q(rst_d2),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hFE)) 
    \grstd1.grst_full.grst_f.rst_d3_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(rst_d2),
        .O(\grstd1.grst_full.grst_f.rst_d3_i_1_n_0 ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d3_reg 
       (.C(clk),
        .CE(1'b1),
        .D(\grstd1.grst_full.grst_f.rst_d3_i_1_n_0 ),
        .Q(rst_d3),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hE0)) 
    \guf.guf1.underflow_i_i_1 
       (.I0(wr_rst_busy_i),
        .I1(EMPTY),
        .I2(rd_en),
        .O(p_1_out));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \gv.ram_valid_d1_i_1 
       (.I0(EMPTY),
        .I1(rd_en),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(ram_empty_i_reg));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(dest_rst),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(Q[0]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(Q[1]),
        .Q(sckt_wr_rst_cc[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(sckt_wr_rst_cc[2]),
        .Q(sckt_wr_rst_cc[3]),
        .R(1'b0));
  (* DEF_VAL = "1'b1" *) 
  (* DEST_SYNC_FF = "5" *) 
  (* INIT = "1" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  fifo_W32_R16_xpm_cdc_sync_rst \ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst 
       (.dest_clk(clk),
        .dest_rst(dest_rst),
        .src_rst(rst));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFBF0000)) 
    ram_empty_fb_i_i_1
       (.I0(Q[0]),
        .I1(p_19_out),
        .I2(comp0),
        .I3(Q[1]),
        .I4(ram_empty_i_reg_0),
        .I5(ram_empty_fb_i_i_2_n_0),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFB000)) 
    ram_empty_fb_i_i_2
       (.I0(FULL_FB),
        .I1(wr_en),
        .I2(rd_en),
        .I3(comp1),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(ram_empty_fb_i_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFAABA)) 
    ram_full_fb_i_i_2
       (.I0(Q[0]),
        .I1(rst_d3),
        .I2(FULL_FB),
        .I3(comp0_1),
        .I4(Q[1]),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_2 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAEAFFEA)) 
    ram_full_fb_i_i_3
       (.I0(Q[0]),
        .I1(wr_en),
        .I2(comp1_0),
        .I3(FULL_FB),
        .I4(rst_d3),
        .I5(Q[1]),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gcc_rst.sckt_wr_rst_cc_reg[0]_1 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    wr_rst_busy_i_inferred_i_1
       (.I0(sckt_wr_rst_cc[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(sckt_wr_rst_cc[3]),
        .O(wr_rst_busy_i));
endmodule

(* ORIG_REF_NAME = "wr_bin_cntr" *) 
module fifo_W32_R16_wr_bin_cntr
   (D,
    ENA_I,
    ENA_I_0,
    v1_reg,
    \gcc0.gc0.count_d1_reg[11]_0 ,
    v1_reg_0,
    Q,
    \gcc0.gc0.count_d1_reg[11]_1 ,
    SR,
    E,
    clk,
    wr_en,
    out,
    ENA_dly_D,
    \gmux.gm[6].gms.ms ,
    \gmux.gm[6].gms.ms_0 );
  output [3:0]D;
  output ENA_I;
  output ENA_I_0;
  output [3:0]v1_reg;
  output [5:0]\gcc0.gc0.count_d1_reg[11]_0 ;
  output [5:0]v1_reg_0;
  output [10:0]Q;
  output [5:0]\gcc0.gc0.count_d1_reg[11]_1 ;
  input [0:0]SR;
  input [0:0]E;
  input clk;
  input wr_en;
  input out;
  input ENA_dly_D;
  input [11:0]\gmux.gm[6].gms.ms ;
  input [10:0]\gmux.gm[6].gms.ms_0 ;

  wire [3:0]D;
  wire [0:0]E;
  wire ENA_I;
  wire ENA_I_0;
  wire ENA_dly_D;
  wire [10:0]Q;
  wire [0:0]SR;
  wire clk;
  wire \gcc0.gc0.count[0]_i_2_n_0 ;
  wire [5:0]\gcc0.gc0.count_d1_reg[11]_0 ;
  wire [5:0]\gcc0.gc0.count_d1_reg[11]_1 ;
  wire \gcc0.gc0.count_reg[0]_i_1_n_0 ;
  wire \gcc0.gc0.count_reg[0]_i_1_n_1 ;
  wire \gcc0.gc0.count_reg[0]_i_1_n_2 ;
  wire \gcc0.gc0.count_reg[0]_i_1_n_3 ;
  wire \gcc0.gc0.count_reg[0]_i_1_n_4 ;
  wire \gcc0.gc0.count_reg[0]_i_1_n_5 ;
  wire \gcc0.gc0.count_reg[0]_i_1_n_6 ;
  wire \gcc0.gc0.count_reg[0]_i_1_n_7 ;
  wire \gcc0.gc0.count_reg[4]_i_1_n_0 ;
  wire \gcc0.gc0.count_reg[4]_i_1_n_1 ;
  wire \gcc0.gc0.count_reg[4]_i_1_n_2 ;
  wire \gcc0.gc0.count_reg[4]_i_1_n_3 ;
  wire \gcc0.gc0.count_reg[4]_i_1_n_4 ;
  wire \gcc0.gc0.count_reg[4]_i_1_n_5 ;
  wire \gcc0.gc0.count_reg[4]_i_1_n_6 ;
  wire \gcc0.gc0.count_reg[4]_i_1_n_7 ;
  wire \gcc0.gc0.count_reg[8]_i_1_n_1 ;
  wire \gcc0.gc0.count_reg[8]_i_1_n_2 ;
  wire \gcc0.gc0.count_reg[8]_i_1_n_3 ;
  wire \gcc0.gc0.count_reg[8]_i_1_n_4 ;
  wire \gcc0.gc0.count_reg[8]_i_1_n_5 ;
  wire \gcc0.gc0.count_reg[8]_i_1_n_6 ;
  wire \gcc0.gc0.count_reg[8]_i_1_n_7 ;
  wire [11:0]\gmux.gm[6].gms.ms ;
  wire [10:0]\gmux.gm[6].gms.ms_0 ;
  wire out;
  wire [11:11]p_12_out;
  wire [7:0]p_13_out;
  wire [3:0]v1_reg;
  wire [5:0]v1_reg_0;
  wire wr_en;
  wire [3:3]\NLW_gcc0.gc0.count_reg[8]_i_1_CO_UNCONNECTED ;

  LUT4 #(
    .INIT(16'hFF04)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1 
       (.I0(p_12_out),
        .I1(wr_en),
        .I2(out),
        .I3(ENA_dly_D),
        .O(ENA_I));
  LUT4 #(
    .INIT(16'hFF08)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__0 
       (.I0(p_12_out),
        .I1(wr_en),
        .I2(out),
        .I3(ENA_dly_D),
        .O(ENA_I_0));
  LUT1 #(
    .INIT(2'h1)) 
    \gcc0.gc0.count[0]_i_2 
       (.I0(p_13_out[0]),
        .O(\gcc0.gc0.count[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[0] 
       (.C(clk),
        .CE(E),
        .D(p_13_out[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[10] 
       (.C(clk),
        .CE(E),
        .D(D[2]),
        .Q(Q[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[11] 
       (.C(clk),
        .CE(E),
        .D(D[3]),
        .Q(p_12_out),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[1] 
       (.C(clk),
        .CE(E),
        .D(p_13_out[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[2] 
       (.C(clk),
        .CE(E),
        .D(p_13_out[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[3] 
       (.C(clk),
        .CE(E),
        .D(p_13_out[3]),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[4] 
       (.C(clk),
        .CE(E),
        .D(p_13_out[4]),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[5] 
       (.C(clk),
        .CE(E),
        .D(p_13_out[5]),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[6] 
       (.C(clk),
        .CE(E),
        .D(p_13_out[6]),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[7] 
       (.C(clk),
        .CE(E),
        .D(p_13_out[7]),
        .Q(Q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[8] 
       (.C(clk),
        .CE(E),
        .D(D[0]),
        .Q(Q[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[9] 
       (.C(clk),
        .CE(E),
        .D(D[1]),
        .Q(Q[9]),
        .R(SR));
  FDSE #(
    .INIT(1'b1)) 
    \gcc0.gc0.count_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc0.count_reg[0]_i_1_n_7 ),
        .Q(p_13_out[0]),
        .S(SR));
  CARRY4 \gcc0.gc0.count_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\gcc0.gc0.count_reg[0]_i_1_n_0 ,\gcc0.gc0.count_reg[0]_i_1_n_1 ,\gcc0.gc0.count_reg[0]_i_1_n_2 ,\gcc0.gc0.count_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\gcc0.gc0.count_reg[0]_i_1_n_4 ,\gcc0.gc0.count_reg[0]_i_1_n_5 ,\gcc0.gc0.count_reg[0]_i_1_n_6 ,\gcc0.gc0.count_reg[0]_i_1_n_7 }),
        .S({p_13_out[3:1],\gcc0.gc0.count[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[10] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc0.count_reg[8]_i_1_n_5 ),
        .Q(D[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[11] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc0.count_reg[8]_i_1_n_4 ),
        .Q(D[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc0.count_reg[0]_i_1_n_6 ),
        .Q(p_13_out[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc0.count_reg[0]_i_1_n_5 ),
        .Q(p_13_out[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc0.count_reg[0]_i_1_n_4 ),
        .Q(p_13_out[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[4] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc0.count_reg[4]_i_1_n_7 ),
        .Q(p_13_out[4]),
        .R(SR));
  CARRY4 \gcc0.gc0.count_reg[4]_i_1 
       (.CI(\gcc0.gc0.count_reg[0]_i_1_n_0 ),
        .CO({\gcc0.gc0.count_reg[4]_i_1_n_0 ,\gcc0.gc0.count_reg[4]_i_1_n_1 ,\gcc0.gc0.count_reg[4]_i_1_n_2 ,\gcc0.gc0.count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\gcc0.gc0.count_reg[4]_i_1_n_4 ,\gcc0.gc0.count_reg[4]_i_1_n_5 ,\gcc0.gc0.count_reg[4]_i_1_n_6 ,\gcc0.gc0.count_reg[4]_i_1_n_7 }),
        .S(p_13_out[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[5] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc0.count_reg[4]_i_1_n_6 ),
        .Q(p_13_out[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[6] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc0.count_reg[4]_i_1_n_5 ),
        .Q(p_13_out[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[7] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc0.count_reg[4]_i_1_n_4 ),
        .Q(p_13_out[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[8] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc0.count_reg[8]_i_1_n_7 ),
        .Q(D[0]),
        .R(SR));
  CARRY4 \gcc0.gc0.count_reg[8]_i_1 
       (.CI(\gcc0.gc0.count_reg[4]_i_1_n_0 ),
        .CO({\NLW_gcc0.gc0.count_reg[8]_i_1_CO_UNCONNECTED [3],\gcc0.gc0.count_reg[8]_i_1_n_1 ,\gcc0.gc0.count_reg[8]_i_1_n_2 ,\gcc0.gc0.count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\gcc0.gc0.count_reg[8]_i_1_n_4 ,\gcc0.gc0.count_reg[8]_i_1_n_5 ,\gcc0.gc0.count_reg[8]_i_1_n_6 ,\gcc0.gc0.count_reg[8]_i_1_n_7 }),
        .S(D));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[9] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc0.count_reg[8]_i_1_n_6 ),
        .Q(D[1]),
        .R(SR));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[0].gm1.m1_i_1 
       (.I0(p_13_out[1]),
        .I1(p_13_out[0]),
        .I2(\gmux.gm[6].gms.ms [0]),
        .I3(\gmux.gm[6].gms.ms [1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[0].gm1.m1_i_1__0 
       (.I0(Q[1]),
        .I1(\gmux.gm[6].gms.ms [0]),
        .I2(Q[0]),
        .I3(\gmux.gm[6].gms.ms [1]),
        .O(v1_reg_0[0]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[1].gms.ms_i_1 
       (.I0(Q[3]),
        .I1(\gmux.gm[6].gms.ms [2]),
        .I2(Q[2]),
        .I3(\gmux.gm[6].gms.ms [3]),
        .O(v1_reg_0[1]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[1].gms.ms_i_1__0 
       (.I0(Q[1]),
        .I1(\gmux.gm[6].gms.ms [2]),
        .I2(Q[2]),
        .I3(\gmux.gm[6].gms.ms [1]),
        .O(\gcc0.gc0.count_d1_reg[11]_0 [0]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[1].gms.ms_i_1__1 
       (.I0(Q[1]),
        .I1(\gmux.gm[6].gms.ms_0 [1]),
        .I2(Q[2]),
        .I3(\gmux.gm[6].gms.ms_0 [0]),
        .O(\gcc0.gc0.count_d1_reg[11]_1 [0]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[1].gms.ms_i_1__2 
       (.I0(p_13_out[3]),
        .I1(p_13_out[2]),
        .I2(\gmux.gm[6].gms.ms [2]),
        .I3(\gmux.gm[6].gms.ms [3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[2].gms.ms_i_1 
       (.I0(Q[5]),
        .I1(\gmux.gm[6].gms.ms [4]),
        .I2(Q[4]),
        .I3(\gmux.gm[6].gms.ms [5]),
        .O(v1_reg_0[2]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[2].gms.ms_i_1__0 
       (.I0(Q[3]),
        .I1(\gmux.gm[6].gms.ms [4]),
        .I2(Q[4]),
        .I3(\gmux.gm[6].gms.ms [3]),
        .O(\gcc0.gc0.count_d1_reg[11]_0 [1]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[2].gms.ms_i_1__1 
       (.I0(Q[3]),
        .I1(\gmux.gm[6].gms.ms_0 [3]),
        .I2(Q[4]),
        .I3(\gmux.gm[6].gms.ms_0 [2]),
        .O(\gcc0.gc0.count_d1_reg[11]_1 [1]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[2].gms.ms_i_1__2 
       (.I0(p_13_out[5]),
        .I1(p_13_out[4]),
        .I2(\gmux.gm[6].gms.ms [4]),
        .I3(\gmux.gm[6].gms.ms [5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[3].gms.ms_i_1 
       (.I0(Q[7]),
        .I1(Q[6]),
        .I2(\gmux.gm[6].gms.ms [6]),
        .I3(\gmux.gm[6].gms.ms [7]),
        .O(v1_reg_0[3]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[3].gms.ms_i_1__0 
       (.I0(Q[5]),
        .I1(Q[6]),
        .I2(\gmux.gm[6].gms.ms [6]),
        .I3(\gmux.gm[6].gms.ms [5]),
        .O(\gcc0.gc0.count_d1_reg[11]_0 [2]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[3].gms.ms_i_1__1 
       (.I0(Q[5]),
        .I1(\gmux.gm[6].gms.ms_0 [5]),
        .I2(Q[6]),
        .I3(\gmux.gm[6].gms.ms_0 [4]),
        .O(\gcc0.gc0.count_d1_reg[11]_1 [2]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[3].gms.ms_i_1__2 
       (.I0(p_13_out[7]),
        .I1(p_13_out[6]),
        .I2(\gmux.gm[6].gms.ms [6]),
        .I3(\gmux.gm[6].gms.ms [7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[4].gms.ms_i_1 
       (.I0(Q[9]),
        .I1(Q[8]),
        .I2(\gmux.gm[6].gms.ms [8]),
        .I3(\gmux.gm[6].gms.ms [9]),
        .O(v1_reg_0[4]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[4].gms.ms_i_1__0 
       (.I0(Q[7]),
        .I1(Q[8]),
        .I2(\gmux.gm[6].gms.ms [8]),
        .I3(\gmux.gm[6].gms.ms [7]),
        .O(\gcc0.gc0.count_d1_reg[11]_0 [3]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[4].gms.ms_i_1__1 
       (.I0(Q[7]),
        .I1(\gmux.gm[6].gms.ms_0 [7]),
        .I2(Q[8]),
        .I3(\gmux.gm[6].gms.ms_0 [6]),
        .O(\gcc0.gc0.count_d1_reg[11]_1 [3]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[5].gms.ms_i_1 
       (.I0(p_12_out),
        .I1(Q[10]),
        .I2(\gmux.gm[6].gms.ms [10]),
        .I3(\gmux.gm[6].gms.ms [11]),
        .O(v1_reg_0[5]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[5].gms.ms_i_1__0 
       (.I0(Q[9]),
        .I1(Q[10]),
        .I2(\gmux.gm[6].gms.ms [10]),
        .I3(\gmux.gm[6].gms.ms [9]),
        .O(\gcc0.gc0.count_d1_reg[11]_0 [4]));
  LUT4 #(
    .INIT(16'h8241)) 
    \gmux.gm[5].gms.ms_i_1__1 
       (.I0(Q[9]),
        .I1(\gmux.gm[6].gms.ms_0 [9]),
        .I2(Q[10]),
        .I3(\gmux.gm[6].gms.ms_0 [8]),
        .O(\gcc0.gc0.count_d1_reg[11]_1 [4]));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[6].gms.ms_i_1 
       (.I0(p_12_out),
        .I1(\gmux.gm[6].gms.ms [11]),
        .O(\gcc0.gc0.count_d1_reg[11]_0 [5]));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[6].gms.ms_i_1__0 
       (.I0(p_12_out),
        .I1(\gmux.gm[6].gms.ms_0 [10]),
        .O(\gcc0.gc0.count_d1_reg[11]_1 [5]));
endmodule

(* ORIG_REF_NAME = "wr_handshaking_flags" *) 
module fifo_W32_R16_wr_handshaking_flags
   (overflow,
    \gof.gof1.overflow_i_reg_0 ,
    clk);
  output overflow;
  input \gof.gof1.overflow_i_reg_0 ;
  input clk;

  wire clk;
  wire \gof.gof1.overflow_i_reg_0 ;
  wire overflow;

  FDRE #(
    .INIT(1'b0)) 
    \gof.gof1.overflow_i_reg 
       (.C(clk),
        .CE(1'b1),
        .D(\gof.gof1.overflow_i_reg_0 ),
        .Q(overflow),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "wr_logic" *) 
module fifo_W32_R16_wr_logic
   (comp0,
    comp1,
    FULL_FB,
    full,
    overflow,
    D,
    p_19_out,
    rd_data_count,
    ENA_I,
    Q,
    ENA_I_0,
    \gcc0.gc0.count_d1_reg[11] ,
    \gcc0.gc0.count_d1_reg[11]_0 ,
    ram_full_fb_i_i_3,
    ram_full_i_reg,
    clk,
    \gof.gof1.overflow_i_reg ,
    SR,
    \gasym_dc.rd_depth_gt_wr2.count_reg[13] ,
    \gasym_dc.rd_depth_gt_wr2.count_reg[3] ,
    S,
    \gasym_dc.rd_depth_gt_wr2.count_reg[7] ,
    \gasym_dc.rd_depth_gt_wr2.count_reg[11] ,
    DI,
    EMPTY,
    wr_en,
    rd_en,
    ENA_dly_D,
    \gmux.gm[6].gms.ms ,
    \gmux.gm[6].gms.ms_0 );
  output comp0;
  output comp1;
  output FULL_FB;
  output full;
  output overflow;
  output [3:0]D;
  output p_19_out;
  output [13:0]rd_data_count;
  output ENA_I;
  output [10:0]Q;
  output ENA_I_0;
  output [5:0]\gcc0.gc0.count_d1_reg[11] ;
  output [5:0]\gcc0.gc0.count_d1_reg[11]_0 ;
  input [1:0]ram_full_fb_i_i_3;
  input ram_full_i_reg;
  input clk;
  input \gof.gof1.overflow_i_reg ;
  input [0:0]SR;
  input \gasym_dc.rd_depth_gt_wr2.count_reg[13] ;
  input [1:0]\gasym_dc.rd_depth_gt_wr2.count_reg[3] ;
  input [0:0]S;
  input [3:0]\gasym_dc.rd_depth_gt_wr2.count_reg[7] ;
  input [3:0]\gasym_dc.rd_depth_gt_wr2.count_reg[11] ;
  input [0:0]DI;
  input EMPTY;
  input wr_en;
  input rd_en;
  input ENA_dly_D;
  input [11:0]\gmux.gm[6].gms.ms ;
  input [10:0]\gmux.gm[6].gms.ms_0 ;

  wire [3:0]D;
  wire [0:0]DI;
  wire EMPTY;
  wire ENA_I;
  wire ENA_I_0;
  wire ENA_dly_D;
  wire FULL_FB;
  wire [10:0]Q;
  wire [0:0]S;
  wire [0:0]SR;
  wire [5:0]\c0/v1_reg ;
  wire [3:0]\c1/v1_reg ;
  wire clk;
  wire comp0;
  wire comp1;
  wire full;
  wire [3:0]\gasym_dc.rd_depth_gt_wr2.count_reg[11] ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[13] ;
  wire [1:0]\gasym_dc.rd_depth_gt_wr2.count_reg[3] ;
  wire [3:0]\gasym_dc.rd_depth_gt_wr2.count_reg[7] ;
  wire [5:0]\gcc0.gc0.count_d1_reg[11] ;
  wire [5:0]\gcc0.gc0.count_d1_reg[11]_0 ;
  wire [11:0]\gmux.gm[6].gms.ms ;
  wire [10:0]\gmux.gm[6].gms.ms_0 ;
  wire \gof.gof1.overflow_i_reg ;
  wire \gwss.gwdc1.wdcext_n_14 ;
  wire \gwss.wsts_n_10 ;
  wire \gwss.wsts_n_11 ;
  wire \gwss.wsts_n_12 ;
  wire \gwss.wsts_n_13 ;
  wire \gwss.wsts_n_14 ;
  wire \gwss.wsts_n_15 ;
  wire \gwss.wsts_n_16 ;
  wire \gwss.wsts_n_17 ;
  wire \gwss.wsts_n_4 ;
  wire \gwss.wsts_n_5 ;
  wire \gwss.wsts_n_6 ;
  wire \gwss.wsts_n_7 ;
  wire \gwss.wsts_n_8 ;
  wire \gwss.wsts_n_9 ;
  wire overflow;
  wire p_19_out;
  wire [1:0]ram_full_fb_i_i_3;
  wire ram_full_i_reg;
  wire [13:0]rd_data_count;
  wire rd_en;
  wire wr_en;

  fifo_W32_R16_wr_handshaking_flags \gwhf.whf 
       (.clk(clk),
        .\gof.gof1.overflow_i_reg_0 (\gof.gof1.overflow_i_reg ),
        .overflow(overflow));
  fifo_W32_R16_dc_ss \gwss.gwdc1.wdcext 
       (.EMPTY(EMPTY),
        .O({\gwss.wsts_n_4 ,\gwss.wsts_n_5 ,\gwss.wsts_n_6 ,\gwss.wsts_n_7 }),
        .S(\gwss.gwdc1.wdcext_n_14 ),
        .SR(SR),
        .clk(clk),
        .\gasym_dc.rd_depth_gt_wr2.count_reg[11]_0 ({\gwss.wsts_n_12 ,\gwss.wsts_n_13 ,\gwss.wsts_n_14 ,\gwss.wsts_n_15 }),
        .\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 (\gasym_dc.rd_depth_gt_wr2.count_reg[13] ),
        .\gasym_dc.rd_depth_gt_wr2.count_reg[13]_1 ({\gwss.wsts_n_16 ,\gwss.wsts_n_17 }),
        .\gasym_dc.rd_depth_gt_wr2.count_reg[7]_0 ({\gwss.wsts_n_8 ,\gwss.wsts_n_9 ,\gwss.wsts_n_10 ,\gwss.wsts_n_11 }),
        .out(FULL_FB),
        .rd_data_count(rd_data_count),
        .rd_en(rd_en),
        .wr_en(wr_en));
  fifo_W32_R16_wr_status_flags_ss \gwss.wsts 
       (.DI({\gasym_dc.rd_depth_gt_wr2.count_reg[3] ,rd_data_count[1:0]}),
        .E(p_19_out),
        .EMPTY(EMPTY),
        .O({\gwss.wsts_n_4 ,\gwss.wsts_n_5 ,\gwss.wsts_n_6 ,\gwss.wsts_n_7 }),
        .S(S),
        .clk(clk),
        .comp0(comp0),
        .comp1(comp1),
        .full(full),
        .\gasym_dc.rd_depth_gt_wr2.count_reg[11] (\gasym_dc.rd_depth_gt_wr2.count_reg[11] ),
        .\gasym_dc.rd_depth_gt_wr2.count_reg[13] (DI),
        .\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 (\gwss.gwdc1.wdcext_n_14 ),
        .\gasym_dc.rd_depth_gt_wr2.count_reg[1] ({\gwss.wsts_n_8 ,\gwss.wsts_n_9 ,\gwss.wsts_n_10 ,\gwss.wsts_n_11 }),
        .\gasym_dc.rd_depth_gt_wr2.count_reg[7] (\gasym_dc.rd_depth_gt_wr2.count_reg[7] ),
        .out(FULL_FB),
        .ram_empty_i_reg({\gwss.wsts_n_12 ,\gwss.wsts_n_13 ,\gwss.wsts_n_14 ,\gwss.wsts_n_15 }),
        .ram_empty_i_reg_0({\gwss.wsts_n_16 ,\gwss.wsts_n_17 }),
        .ram_full_fb_i_i_3(ram_full_fb_i_i_3),
        .ram_full_i_reg_0(ram_full_i_reg),
        .rd_data_count(rd_data_count[12:2]),
        .rd_en(rd_en),
        .v1_reg(\c0/v1_reg ),
        .v1_reg_0(\c1/v1_reg ),
        .wr_en(wr_en));
  fifo_W32_R16_wr_bin_cntr wpntr
       (.D(D),
        .E(p_19_out),
        .ENA_I(ENA_I),
        .ENA_I_0(ENA_I_0),
        .ENA_dly_D(ENA_dly_D),
        .Q(Q),
        .SR(SR),
        .clk(clk),
        .\gcc0.gc0.count_d1_reg[11]_0 (\gcc0.gc0.count_d1_reg[11] ),
        .\gcc0.gc0.count_d1_reg[11]_1 (\gcc0.gc0.count_d1_reg[11]_0 ),
        .\gmux.gm[6].gms.ms (\gmux.gm[6].gms.ms ),
        .\gmux.gm[6].gms.ms_0 (\gmux.gm[6].gms.ms_0 ),
        .out(FULL_FB),
        .v1_reg(\c1/v1_reg ),
        .v1_reg_0(\c0/v1_reg ),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "wr_status_flags_ss" *) 
module fifo_W32_R16_wr_status_flags_ss
   (comp0,
    comp1,
    out,
    full,
    O,
    \gasym_dc.rd_depth_gt_wr2.count_reg[1] ,
    ram_empty_i_reg,
    ram_empty_i_reg_0,
    E,
    v1_reg,
    v1_reg_0,
    ram_full_fb_i_i_3,
    ram_full_i_reg_0,
    clk,
    DI,
    S,
    \gasym_dc.rd_depth_gt_wr2.count_reg[7] ,
    \gasym_dc.rd_depth_gt_wr2.count_reg[11] ,
    \gasym_dc.rd_depth_gt_wr2.count_reg[13] ,
    \gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ,
    wr_en,
    rd_en,
    EMPTY,
    rd_data_count);
  output comp0;
  output comp1;
  output out;
  output full;
  output [3:0]O;
  output [3:0]\gasym_dc.rd_depth_gt_wr2.count_reg[1] ;
  output [3:0]ram_empty_i_reg;
  output [1:0]ram_empty_i_reg_0;
  output [0:0]E;
  input [5:0]v1_reg;
  input [3:0]v1_reg_0;
  input [1:0]ram_full_fb_i_i_3;
  input ram_full_i_reg_0;
  input clk;
  input [3:0]DI;
  input [0:0]S;
  input [3:0]\gasym_dc.rd_depth_gt_wr2.count_reg[7] ;
  input [3:0]\gasym_dc.rd_depth_gt_wr2.count_reg[11] ;
  input [0:0]\gasym_dc.rd_depth_gt_wr2.count_reg[13] ;
  input [0:0]\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ;
  input wr_en;
  input rd_en;
  input EMPTY;
  input [10:0]rd_data_count;

  wire [3:0]DI;
  wire [0:0]E;
  wire EMPTY;
  wire [3:0]O;
  wire [0:0]S;
  wire clk;
  wire comp0;
  wire comp1;
  wire \gasym_dc.rd_depth_gt_wr2.count[11]_i_6_n_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count[11]_i_7_n_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count[11]_i_8_n_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count[11]_i_9_n_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count[13]_i_6_n_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count[3]_i_4_n_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count[3]_i_5_n_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count[3]_i_6_n_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count[7]_i_6_n_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count[7]_i_7_n_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count[7]_i_8_n_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count[7]_i_9_n_0 ;
  wire [3:0]\gasym_dc.rd_depth_gt_wr2.count_reg[11] ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[11]_i_1_n_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[11]_i_1_n_1 ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[11]_i_1_n_2 ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[11]_i_1_n_3 ;
  wire [0:0]\gasym_dc.rd_depth_gt_wr2.count_reg[13] ;
  wire [0:0]\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[13]_i_3_n_3 ;
  wire [3:0]\gasym_dc.rd_depth_gt_wr2.count_reg[1] ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[3]_i_1_n_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[3]_i_1_n_1 ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[3]_i_1_n_2 ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[3]_i_1_n_3 ;
  wire [3:0]\gasym_dc.rd_depth_gt_wr2.count_reg[7] ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[7]_i_1_n_0 ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[7]_i_1_n_1 ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[7]_i_1_n_2 ;
  wire \gasym_dc.rd_depth_gt_wr2.count_reg[7]_i_1_n_3 ;
  (* DONT_TOUCH *) wire ram_afull_fb;
  (* DONT_TOUCH *) wire ram_afull_i;
  wire [3:0]ram_empty_i_reg;
  wire [1:0]ram_empty_i_reg_0;
  (* DONT_TOUCH *) wire ram_full_fb_i;
  wire [1:0]ram_full_fb_i_i_3;
  (* DONT_TOUCH *) wire ram_full_i;
  wire ram_full_i_reg_0;
  wire [10:0]rd_data_count;
  wire rd_en;
  wire [5:0]v1_reg;
  wire [3:0]v1_reg_0;
  wire wr_en;
  wire [3:1]\NLW_gasym_dc.rd_depth_gt_wr2.count_reg[13]_i_3_CO_UNCONNECTED ;
  wire [3:2]\NLW_gasym_dc.rd_depth_gt_wr2.count_reg[13]_i_3_O_UNCONNECTED ;

  assign full = ram_full_i;
  assign out = ram_full_fb_i;
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_4 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(E));
  fifo_W32_R16_compare__parameterized0 c0
       (.comp0(comp0),
        .v1_reg(v1_reg));
  fifo_W32_R16_compare__parameterized0_0 c1
       (.comp1(comp1),
        .ram_full_fb_i_i_3(ram_full_fb_i_i_3),
        .v1_reg_0(v1_reg_0));
  LUT5 #(
    .INIT(32'hFF5D00A2)) 
    \gasym_dc.rd_depth_gt_wr2.count[11]_i_6 
       (.I0(rd_en),
        .I1(wr_en),
        .I2(ram_full_fb_i),
        .I3(EMPTY),
        .I4(rd_data_count[9]),
        .O(\gasym_dc.rd_depth_gt_wr2.count[11]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFF5D00A2)) 
    \gasym_dc.rd_depth_gt_wr2.count[11]_i_7 
       (.I0(rd_en),
        .I1(wr_en),
        .I2(ram_full_fb_i),
        .I3(EMPTY),
        .I4(rd_data_count[8]),
        .O(\gasym_dc.rd_depth_gt_wr2.count[11]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFF5D00A2)) 
    \gasym_dc.rd_depth_gt_wr2.count[11]_i_8 
       (.I0(rd_en),
        .I1(wr_en),
        .I2(ram_full_fb_i),
        .I3(EMPTY),
        .I4(rd_data_count[7]),
        .O(\gasym_dc.rd_depth_gt_wr2.count[11]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFF5D00A2)) 
    \gasym_dc.rd_depth_gt_wr2.count[11]_i_9 
       (.I0(rd_en),
        .I1(wr_en),
        .I2(ram_full_fb_i),
        .I3(EMPTY),
        .I4(rd_data_count[6]),
        .O(\gasym_dc.rd_depth_gt_wr2.count[11]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFF5D00A2)) 
    \gasym_dc.rd_depth_gt_wr2.count[13]_i_6 
       (.I0(rd_en),
        .I1(wr_en),
        .I2(ram_full_fb_i),
        .I3(EMPTY),
        .I4(rd_data_count[10]),
        .O(\gasym_dc.rd_depth_gt_wr2.count[13]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFF5D00A2)) 
    \gasym_dc.rd_depth_gt_wr2.count[3]_i_4 
       (.I0(rd_en),
        .I1(wr_en),
        .I2(ram_full_fb_i),
        .I3(EMPTY),
        .I4(rd_data_count[1]),
        .O(\gasym_dc.rd_depth_gt_wr2.count[3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFF5D00A2)) 
    \gasym_dc.rd_depth_gt_wr2.count[3]_i_5 
       (.I0(rd_en),
        .I1(wr_en),
        .I2(ram_full_fb_i),
        .I3(EMPTY),
        .I4(rd_data_count[0]),
        .O(\gasym_dc.rd_depth_gt_wr2.count[3]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h0008FFF7)) 
    \gasym_dc.rd_depth_gt_wr2.count[3]_i_6 
       (.I0(rd_en),
        .I1(wr_en),
        .I2(ram_full_fb_i),
        .I3(EMPTY),
        .I4(DI[1]),
        .O(\gasym_dc.rd_depth_gt_wr2.count[3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFF5D00A2)) 
    \gasym_dc.rd_depth_gt_wr2.count[7]_i_6 
       (.I0(rd_en),
        .I1(wr_en),
        .I2(ram_full_fb_i),
        .I3(EMPTY),
        .I4(rd_data_count[5]),
        .O(\gasym_dc.rd_depth_gt_wr2.count[7]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFF5D00A2)) 
    \gasym_dc.rd_depth_gt_wr2.count[7]_i_7 
       (.I0(rd_en),
        .I1(wr_en),
        .I2(ram_full_fb_i),
        .I3(EMPTY),
        .I4(rd_data_count[4]),
        .O(\gasym_dc.rd_depth_gt_wr2.count[7]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFF5D00A2)) 
    \gasym_dc.rd_depth_gt_wr2.count[7]_i_8 
       (.I0(rd_en),
        .I1(wr_en),
        .I2(ram_full_fb_i),
        .I3(EMPTY),
        .I4(rd_data_count[3]),
        .O(\gasym_dc.rd_depth_gt_wr2.count[7]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFF5D00A2)) 
    \gasym_dc.rd_depth_gt_wr2.count[7]_i_9 
       (.I0(rd_en),
        .I1(wr_en),
        .I2(ram_full_fb_i),
        .I3(EMPTY),
        .I4(rd_data_count[2]),
        .O(\gasym_dc.rd_depth_gt_wr2.count[7]_i_9_n_0 ));
  CARRY4 \gasym_dc.rd_depth_gt_wr2.count_reg[11]_i_1 
       (.CI(\gasym_dc.rd_depth_gt_wr2.count_reg[7]_i_1_n_0 ),
        .CO({\gasym_dc.rd_depth_gt_wr2.count_reg[11]_i_1_n_0 ,\gasym_dc.rd_depth_gt_wr2.count_reg[11]_i_1_n_1 ,\gasym_dc.rd_depth_gt_wr2.count_reg[11]_i_1_n_2 ,\gasym_dc.rd_depth_gt_wr2.count_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(\gasym_dc.rd_depth_gt_wr2.count_reg[11] ),
        .O(ram_empty_i_reg),
        .S({\gasym_dc.rd_depth_gt_wr2.count[11]_i_6_n_0 ,\gasym_dc.rd_depth_gt_wr2.count[11]_i_7_n_0 ,\gasym_dc.rd_depth_gt_wr2.count[11]_i_8_n_0 ,\gasym_dc.rd_depth_gt_wr2.count[11]_i_9_n_0 }));
  CARRY4 \gasym_dc.rd_depth_gt_wr2.count_reg[13]_i_3 
       (.CI(\gasym_dc.rd_depth_gt_wr2.count_reg[11]_i_1_n_0 ),
        .CO({\NLW_gasym_dc.rd_depth_gt_wr2.count_reg[13]_i_3_CO_UNCONNECTED [3:1],\gasym_dc.rd_depth_gt_wr2.count_reg[13]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\gasym_dc.rd_depth_gt_wr2.count_reg[13] }),
        .O({\NLW_gasym_dc.rd_depth_gt_wr2.count_reg[13]_i_3_O_UNCONNECTED [3:2],ram_empty_i_reg_0}),
        .S({1'b0,1'b0,\gasym_dc.rd_depth_gt_wr2.count_reg[13]_0 ,\gasym_dc.rd_depth_gt_wr2.count[13]_i_6_n_0 }));
  CARRY4 \gasym_dc.rd_depth_gt_wr2.count_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\gasym_dc.rd_depth_gt_wr2.count_reg[3]_i_1_n_0 ,\gasym_dc.rd_depth_gt_wr2.count_reg[3]_i_1_n_1 ,\gasym_dc.rd_depth_gt_wr2.count_reg[3]_i_1_n_2 ,\gasym_dc.rd_depth_gt_wr2.count_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(DI),
        .O(O),
        .S({\gasym_dc.rd_depth_gt_wr2.count[3]_i_4_n_0 ,\gasym_dc.rd_depth_gt_wr2.count[3]_i_5_n_0 ,\gasym_dc.rd_depth_gt_wr2.count[3]_i_6_n_0 ,S}));
  CARRY4 \gasym_dc.rd_depth_gt_wr2.count_reg[7]_i_1 
       (.CI(\gasym_dc.rd_depth_gt_wr2.count_reg[3]_i_1_n_0 ),
        .CO({\gasym_dc.rd_depth_gt_wr2.count_reg[7]_i_1_n_0 ,\gasym_dc.rd_depth_gt_wr2.count_reg[7]_i_1_n_1 ,\gasym_dc.rd_depth_gt_wr2.count_reg[7]_i_1_n_2 ,\gasym_dc.rd_depth_gt_wr2.count_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(\gasym_dc.rd_depth_gt_wr2.count_reg[7] ),
        .O(\gasym_dc.rd_depth_gt_wr2.count_reg[1] ),
        .S({\gasym_dc.rd_depth_gt_wr2.count[7]_i_6_n_0 ,\gasym_dc.rd_depth_gt_wr2.count[7]_i_7_n_0 ,\gasym_dc.rd_depth_gt_wr2.count[7]_i_8_n_0 ,\gasym_dc.rd_depth_gt_wr2.count[7]_i_9_n_0 }));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b1),
        .O(ram_afull_i));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b1),
        .O(ram_afull_fb));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ram_full_fb_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(ram_full_i_reg_0),
        .Q(ram_full_fb_i),
        .R(1'b0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ram_full_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(ram_full_i_reg_0),
        .Q(ram_full_i),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
