// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Mon Jun 20 14:50:54 2022
// Host        : linrack9.bioeelocal running 64-bit Red Hat Enterprise Linux Server release 7.9 (Maipo)
// Command     : write_verilog -force -mode funcsim
//               /users/krenehan/MOANA3/FPGA/generic_scan_2by1_version/MOANA2/MOANA2.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0_sim_netlist.v
// Design      : clk_wiz_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a50tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module clk_wiz_0
   (clk_50MHz,
    tx_refclk_mmcm,
    clk_100MHz,
    clk_25MHz,
    reset,
    locked,
    clk_in1);
  output clk_50MHz;
  output tx_refclk_mmcm;
  output clk_100MHz;
  output clk_25MHz;
  input reset;
  output locked;
  input clk_in1;

  wire clk_100MHz;
  wire clk_25MHz;
  wire clk_50MHz;
  wire clk_in1;
  wire locked;
  wire reset;
  wire tx_refclk_mmcm;

  clk_wiz_0_clk_wiz_0_clk_wiz inst
       (.clk_100MHz(clk_100MHz),
        .clk_25MHz(clk_25MHz),
        .clk_50MHz(clk_50MHz),
        .clk_in1(clk_in1),
        .locked(locked),
        .reset(reset),
        .tx_refclk_mmcm(tx_refclk_mmcm));
endmodule

(* ORIG_REF_NAME = "clk_wiz_0_clk_wiz" *) 
module clk_wiz_0_clk_wiz_0_clk_wiz
   (clk_50MHz,
    tx_refclk_mmcm,
    clk_100MHz,
    clk_25MHz,
    reset,
    locked,
    clk_in1);
  output clk_50MHz;
  output tx_refclk_mmcm;
  output clk_100MHz;
  output clk_25MHz;
  input reset;
  output locked;
  input clk_in1;

  wire clk_100MHz;
  wire clk_100MHz_clk_wiz_0;
  wire clk_100MHz_clk_wiz_0_en_clk;
  wire clk_25MHz;
  wire clk_25MHz_clk_wiz_0;
  wire clk_25MHz_clk_wiz_0_en_clk;
  wire clk_50MHz;
  wire clk_50MHz_clk_wiz_0;
  wire clk_50MHz_clk_wiz_0_en_clk;
  wire clk_in1;
  wire clk_in1_clk_wiz_0;
  wire clkfbout_buf_clk_wiz_0;
  wire clkfbout_clk_wiz_0;
  wire locked;
  wire reset;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) wire [7:0]seq_reg1;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) wire [7:0]seq_reg2;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) wire [7:0]seq_reg3;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) wire [7:0]seq_reg4;
  wire tx_refclk_mmcm;
  wire tx_refclk_mmcm_clk_wiz_0;
  wire tx_refclk_mmcm_clk_wiz_0_en_clk;
  wire NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED;
  wire NLW_mmcm_adv_inst_DRDY_UNCONNECTED;
  wire NLW_mmcm_adv_inst_PSDONE_UNCONNECTED;
  wire [15:0]NLW_mmcm_adv_inst_DO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkf_buf
       (.I(clkfbout_clk_wiz_0),
        .O(clkfbout_buf_clk_wiz_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkin1_bufg
       (.I(clk_in1),
        .O(clk_in1_clk_wiz_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
  (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0" *) 
  BUFGCTRL #(
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE")) 
    clkout1_buf
       (.CE0(seq_reg1[7]),
        .CE1(1'b0),
        .I0(clk_50MHz_clk_wiz_0),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(clk_50MHz),
        .S0(1'b1),
        .S1(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFH clkout1_buf_en
       (.I(clk_50MHz_clk_wiz_0),
        .O(clk_50MHz_clk_wiz_0_en_clk));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
  (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0" *) 
  BUFGCTRL #(
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE")) 
    clkout2_buf
       (.CE0(seq_reg2[7]),
        .CE1(1'b0),
        .I0(tx_refclk_mmcm_clk_wiz_0),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(tx_refclk_mmcm),
        .S0(1'b1),
        .S1(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFH clkout2_buf_en
       (.I(tx_refclk_mmcm_clk_wiz_0),
        .O(tx_refclk_mmcm_clk_wiz_0_en_clk));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
  (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0" *) 
  BUFGCTRL #(
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE")) 
    clkout3_buf
       (.CE0(seq_reg3[7]),
        .CE1(1'b0),
        .I0(clk_100MHz_clk_wiz_0),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(clk_100MHz),
        .S0(1'b1),
        .S1(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFH clkout3_buf_en
       (.I(clk_100MHz_clk_wiz_0),
        .O(clk_100MHz_clk_wiz_0_en_clk));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
  (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0" *) 
  BUFGCTRL #(
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE")) 
    clkout4_buf
       (.CE0(seq_reg4[7]),
        .CE1(1'b0),
        .I0(clk_25MHz_clk_wiz_0),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(clk_25MHz),
        .S0(1'b1),
        .S1(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFH clkout4_buf_en
       (.I(clk_25MHz_clk_wiz_0),
        .O(clk_25MHz_clk_wiz_0_en_clk));
  (* BOX_TYPE = "PRIMITIVE" *) 
  MMCME2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(5.000000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKFBOUT_USE_FINE_PS("FALSE"),
    .CLKIN1_PERIOD(5.000000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE_F(20.000000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT0_USE_FINE_PS("FALSE"),
    .CLKOUT1_DIVIDE(80),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT1_USE_FINE_PS("FALSE"),
    .CLKOUT2_DIVIDE(10),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT2_USE_FINE_PS("FALSE"),
    .CLKOUT3_DIVIDE(40),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT3_USE_FINE_PS("FALSE"),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT4_USE_FINE_PS("FALSE"),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT5_USE_FINE_PS("FALSE"),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .CLKOUT6_USE_FINE_PS("FALSE"),
    .COMPENSATION("BUF_IN"),
    .DIVCLK_DIVIDE(1),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PSEN_INVERTED(1'b0),
    .IS_PSINCDEC_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.010000),
    .SS_EN("FALSE"),
    .SS_MODE("CENTER_HIGH"),
    .SS_MOD_PERIOD(10000),
    .STARTUP_WAIT("FALSE")) 
    mmcm_adv_inst
       (.CLKFBIN(clkfbout_buf_clk_wiz_0),
        .CLKFBOUT(clkfbout_clk_wiz_0),
        .CLKFBOUTB(NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(clk_in1_clk_wiz_0),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(clk_50MHz_clk_wiz_0),
        .CLKOUT0B(NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(tx_refclk_mmcm_clk_wiz_0),
        .CLKOUT1B(NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(clk_100MHz_clk_wiz_0),
        .CLKOUT2B(NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(clk_25MHz_clk_wiz_0),
        .CLKOUT3B(NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_mmcm_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_mmcm_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(locked),
        .PSCLK(1'b0),
        .PSDONE(NLW_mmcm_adv_inst_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[0] 
       (.C(clk_50MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(locked),
        .Q(seq_reg1[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[1] 
       (.C(clk_50MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg1[0]),
        .Q(seq_reg1[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[2] 
       (.C(clk_50MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg1[1]),
        .Q(seq_reg1[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[3] 
       (.C(clk_50MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg1[2]),
        .Q(seq_reg1[3]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[4] 
       (.C(clk_50MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg1[3]),
        .Q(seq_reg1[4]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[5] 
       (.C(clk_50MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg1[4]),
        .Q(seq_reg1[5]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[6] 
       (.C(clk_50MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg1[5]),
        .Q(seq_reg1[6]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[7] 
       (.C(clk_50MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg1[6]),
        .Q(seq_reg1[7]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[0] 
       (.C(tx_refclk_mmcm_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(locked),
        .Q(seq_reg2[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[1] 
       (.C(tx_refclk_mmcm_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg2[0]),
        .Q(seq_reg2[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[2] 
       (.C(tx_refclk_mmcm_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg2[1]),
        .Q(seq_reg2[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[3] 
       (.C(tx_refclk_mmcm_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg2[2]),
        .Q(seq_reg2[3]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[4] 
       (.C(tx_refclk_mmcm_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg2[3]),
        .Q(seq_reg2[4]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[5] 
       (.C(tx_refclk_mmcm_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg2[4]),
        .Q(seq_reg2[5]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[6] 
       (.C(tx_refclk_mmcm_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg2[5]),
        .Q(seq_reg2[6]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[7] 
       (.C(tx_refclk_mmcm_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg2[6]),
        .Q(seq_reg2[7]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[0] 
       (.C(clk_100MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(locked),
        .Q(seq_reg3[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[1] 
       (.C(clk_100MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg3[0]),
        .Q(seq_reg3[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[2] 
       (.C(clk_100MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg3[1]),
        .Q(seq_reg3[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[3] 
       (.C(clk_100MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg3[2]),
        .Q(seq_reg3[3]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[4] 
       (.C(clk_100MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg3[3]),
        .Q(seq_reg3[4]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[5] 
       (.C(clk_100MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg3[4]),
        .Q(seq_reg3[5]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[6] 
       (.C(clk_100MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg3[5]),
        .Q(seq_reg3[6]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[7] 
       (.C(clk_100MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg3[6]),
        .Q(seq_reg3[7]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[0] 
       (.C(clk_25MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(locked),
        .Q(seq_reg4[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[1] 
       (.C(clk_25MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg4[0]),
        .Q(seq_reg4[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[2] 
       (.C(clk_25MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg4[1]),
        .Q(seq_reg4[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[3] 
       (.C(clk_25MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg4[2]),
        .Q(seq_reg4[3]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[4] 
       (.C(clk_25MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg4[3]),
        .Q(seq_reg4[4]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[5] 
       (.C(clk_25MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg4[4]),
        .Q(seq_reg4[5]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[6] 
       (.C(clk_25MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg4[5]),
        .Q(seq_reg4[6]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[7] 
       (.C(clk_25MHz_clk_wiz_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg4[6]),
        .Q(seq_reg4[7]));
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
