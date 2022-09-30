############################################################################
# XEM7010 - Xilinx constraints file
#
# Pin mappings for the XEM7010.  Use this as a template and comment out 
# the pins that are not used in your design.  (By default, map will fail
# if this file contains constraints for signals not in your design).
#
# Copyright (c) 2004-2016 Opal Kelly Incorporated
############################################################################

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS True [current_design]

set_property PACKAGE_PIN P20 [get_ports {hi_muxsel}]
set_property IOSTANDARD LVCMOS33 [get_ports {hi_muxsel}]

############################################################################
## FrontPanel Host Interface
############################################################################
set_property PACKAGE_PIN Y18  [get_ports {hi_in[0]}]
set_property PACKAGE_PIN V17  [get_ports {hi_in[1]}]
set_property PACKAGE_PIN AA19 [get_ports {hi_in[2]}]
set_property PACKAGE_PIN V20  [get_ports {hi_in[3]}]
set_property PACKAGE_PIN W17  [get_ports {hi_in[4]}]
set_property PACKAGE_PIN AB20 [get_ports {hi_in[5]}]
set_property PACKAGE_PIN V19  [get_ports {hi_in[6]}]
set_property PACKAGE_PIN AA18 [get_ports {hi_in[7]}]

set_property SLEW FAST [get_ports {hi_in[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hi_in[*]}]

set_property PACKAGE_PIN Y21 [get_ports {hi_out[0]}]
set_property PACKAGE_PIN U20 [get_ports {hi_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hi_out[*]}]

set_property PACKAGE_PIN AB22 [get_ports {hi_inout[0]}]
set_property PACKAGE_PIN AB21 [get_ports {hi_inout[1]}]
set_property PACKAGE_PIN Y22  [get_ports {hi_inout[2]}]
set_property PACKAGE_PIN AA21 [get_ports {hi_inout[3]}]
set_property PACKAGE_PIN AA20 [get_ports {hi_inout[4]}]
set_property PACKAGE_PIN W22  [get_ports {hi_inout[5]}]
set_property PACKAGE_PIN W21  [get_ports {hi_inout[6]}]
set_property PACKAGE_PIN T20  [get_ports {hi_inout[7]}]
set_property PACKAGE_PIN R19  [get_ports {hi_inout[8]}]
set_property PACKAGE_PIN P19  [get_ports {hi_inout[9]}]
set_property PACKAGE_PIN U21  [get_ports {hi_inout[10]}]
set_property PACKAGE_PIN T21  [get_ports {hi_inout[11]}]
set_property PACKAGE_PIN R21  [get_ports {hi_inout[12]}]
set_property PACKAGE_PIN P21  [get_ports {hi_inout[13]}]
set_property PACKAGE_PIN R22  [get_ports {hi_inout[14]}]
set_property PACKAGE_PIN P22  [get_ports {hi_inout[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hi_inout[*]}]

set_property PACKAGE_PIN V22 [get_ports {hi_aa}]
set_property IOSTANDARD LVCMOS33 [get_ports {hi_aa}]


############################################################################
## Opal Kelly Clocking Constraints
############################################################################
create_clock -name okHostClk -period 20.83 [get_ports {hi_in[0]}]

set_input_delay -add_delay -max -clock [get_clocks {okHostClk}]  11.000 [get_ports {hi_inout[*]}]
set_input_delay -add_delay -min -clock [get_clocks {okHostClk}]  0.000  [get_ports {hi_inout[*]}]
set_multicycle_path -setup -from [get_ports {hi_inout[*]}] 2

set_input_delay -add_delay -max -clock [get_clocks {okHostClk}]  6.700 [get_ports {hi_in[*]}]
set_input_delay -add_delay -min -clock [get_clocks {okHostClk}]  0.000 [get_ports {hi_in[*]}]
set_multicycle_path -setup -from [get_ports {hi_in[*]}] 2

set_output_delay -add_delay -clock [get_clocks {okHostClk}]  8.900 [get_ports {hi_out[*]}]

set_output_delay -add_delay -clock [get_clocks {okHostClk}]  9.200 [get_ports {hi_inout[*]}]

set_property IOSTANDARD LVDS_25 [get_ports {sys_clk_p}]
set_property IOSTANDARD LVDS_25 [get_ports {sys_clk_n}]
set_property PACKAGE_PIN K4 [get_ports {sys_clk_p}]
set_property PACKAGE_PIN J4 [get_ports {sys_clk_n}]


############################################################################
## User Clocking Constraints
############################################################################
# Create refclks
create_generated_clock -name ref_clk_pll -source [get_clocks clk_100MHz_clk_wiz_0] -divide_by 1 [get_nets ref_clk_pll]

# Constrain scan clocks
create_clock -name scan_clk_p -period 100.0 -waveform {0 25} [get_nets {fpga_ctrl/scan_ctrl/scan_clkp_reg_reg[3][0]}]
create_clock -name scan_clk_n -period 100.0 -waveform {50 75} [get_nets {fpga_ctrl/scan_ctrl/clk_maker/MC1_IBUF__0[1]}]

# Create clock domains
set ref_clk_25MHz_domain [list [get_clocks clk_25MHz_clk_wiz_0]]
set ref_clk_50MHz_domain [list [get_clocks clk_50MHz_clk_wiz_0]]
set ref_clk_100MHz_domain [list [get_clocks clk_100MHz_clk_wiz_0] [get_clocks ref_clk_pll]]
set tx_ref_clk_domain [list [get_clocks tx_refclk_mmcm_clk_wiz_0]]
set scan_clk_domain [list [get_clocks scan_clk_p] [get_clocks scan_clk_n]]
set ti_clk_domain [list [get_clocks mmcm0_clk0]]
set ram_clk_domain [list [get_clocks sys_clk]]

# Asynchronous clocks
set_clock_groups -name async_refclk25_refclk50 -asynchronous -group $ref_clk_25MHz_domain -group $ref_clk_50MHz_domain
set_clock_groups -name async_refclk25_refclk100 -asynchronous -group $ref_clk_25MHz_domain -group $ref_clk_100MHz_domain
set_clock_groups -name async_refclk50_refclk100 -asynchronous -group $ref_clk_50MHz_domain -group $ref_clk_100MHz_domain

set_clock_groups -name async_refclk25_txrefclk -asynchronous -group $ref_clk_25MHz_domain -group $tx_ref_clk_domain
set_clock_groups -name async_refclk50_txrefclk -asynchronous -group $ref_clk_50MHz_domain -group $tx_ref_clk_domain
set_clock_groups -name async_refclk100_txrefclk -asynchronous -group $ref_clk_100MHz_domain -group $tx_ref_clk_domain

set_clock_groups -name async_refclk25_scanclk -asynchronous -group $ref_clk_25MHz_domain -group $scan_clk_domain
set_clock_groups -name async_refclk50_scanclk -asynchronous -group $ref_clk_50MHz_domain -group $scan_clk_domain
set_clock_groups -name async_refclk100_scanclk -asynchronous -group $ref_clk_100MHz_domain -group $scan_clk_domain

set_clock_groups -name async_refclk25_ticlk -asynchronous -group $ref_clk_25MHz_domain -group $ti_clk_domain
set_clock_groups -name async_refclk50_ticlk -asynchronous -group $ref_clk_50MHz_domain -group $ti_clk_domain
set_clock_groups -name async_refclk100_ticlk -asynchronous -group $ref_clk_100MHz_domain -group $ti_clk_domain

set_clock_groups -name async_txrefclk_scanclk -asynchronous -group $tx_ref_clk_domain -group $scan_clk_domain
set_clock_groups -name async_txrefclk_ticlk -asynchronous -group $tx_ref_clk_domain -group $ti_clk_domain
set_clock_groups -name async_scanclk_ticlk -asynchronous -group $scan_clk_domain -group $ti_clk_domain

set_clock_groups -name async_ramclk_refclk25 -asynchronous -group $ram_clk_domain -group $ref_clk_25MHz_domain 
set_clock_groups -name async_ramclk_refclk50 -asynchronous -group $ram_clk_domain -group $ref_clk_50MHz_domain
set_clock_groups -name async_ramclk_refclk100 -asynchronous -group $ram_clk_domain -group $ref_clk_100MHz_domain
set_clock_groups -name async_ramclk_scanclk -asynchronous -group $ram_clk_domain -group $scan_clk_domain
set_clock_groups -name async_ramclk_ticlk -asynchronous -group $ram_clk_domain -group $ti_clk_domain



############################################################################
## IO constraints
############################################################################
# MC2-47 
set_property PACKAGE_PIN J17 [get_ports {MC1[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[11]}]
# MC2-48 
set_property PACKAGE_PIN H15 [get_ports {MC1[13]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[13]}]
# MC2-49 
set_property PACKAGE_PIN H17 [get_ports {MC1[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[3]}]
# MC2-50 
set_property PACKAGE_PIN J14 [get_ports {MC1[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[2]}]
# MC2-51 
set_property PACKAGE_PIN H18 [get_ports {MC1[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[10]}]
# MC2-52 
set_property PACKAGE_PIN H14 [get_ports {MC1[12]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[12]}]
# MC2-53 
set_property PACKAGE_PIN J22 [get_ports {MC1[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[9]}]
# MC2-54 
set_property PACKAGE_PIN H20 [get_ports {MC1[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[8]}]
# MC2-57 
set_property PACKAGE_PIN H22 [get_ports {MC1[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[7]}]
# MC2-58 
set_property PACKAGE_PIN G20 [get_ports {MC1[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[6]}]
# MC2-59 
set_property PACKAGE_PIN H13 [get_ports {MC1[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[5]}]
# MC2-60 
set_property PACKAGE_PIN G17 [get_ports {MC1[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[1]}]
# MC2-61 
set_property PACKAGE_PIN G13 [get_ports {MC1[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[0]}]
# MC2-62 
set_property PACKAGE_PIN G18 [get_ports {MC1[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[4]}]
# MC2-68 33
set_property PACKAGE_PIN E21 [get_ports {MC1[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {MC1[25]}]
# MC2-69 33
set_property PACKAGE_PIN D22 [get_ports {MC1[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {MC1[24]}]
# MC2-70 33
set_property PACKAGE_PIN D21 [get_ports {MC1[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {MC1[21]}]
# MC2-71 33
set_property PACKAGE_PIN D20 [get_ports {MC1[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {MC1[22]}]
# MC2-72 33
set_property PACKAGE_PIN C22 [get_ports {MC1[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {MC1[23]}]
# MC2-74 33
set_property PACKAGE_PIN B22 [get_ports {MC1[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {MC1[17]}]
# MC2-75 33
set_property PACKAGE_PIN B21 [get_ports {MC1[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {MC1[20]}]
# MC2-76 33
set_property PACKAGE_PIN A21 [get_ports {MC1[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {MC1[16]}]
# MC2-15 
set_property PACKAGE_PIN N18 [get_ports {MC1[19]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[19]}]
# MC2-17 
set_property PACKAGE_PIN N19 [get_ports {MC1[18]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[18]}]
# MC2-67 33
set_property PACKAGE_PIN E22 [get_ports {MC1[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {MC1[15]}]
# MC2-77 
set_property PACKAGE_PIN J19 [get_ports {MC1[14]}]
set_property IOSTANDARD LVCMOS18 [get_ports {MC1[14]}]

# LEDs #####################################################################
set_property PACKAGE_PIN N13 [get_ports {led[0]}]
set_property PACKAGE_PIN N14 [get_ports {led[1]}]
set_property PACKAGE_PIN P15 [get_ports {led[2]}]
set_property PACKAGE_PIN P16 [get_ports {led[3]}]
set_property PACKAGE_PIN N17 [get_ports {led[4]}]
set_property PACKAGE_PIN P17 [get_ports {led[5]}]
set_property PACKAGE_PIN R16 [get_ports {led[6]}]
set_property PACKAGE_PIN R17 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[*]}]

# Flash ####################################################################
#set_property PACKAGE_PIN T19 [get_ports {spi_cs}]
#set_property PACKAGE_PIN P14 [get_ports {spi_clk}]
#set_property PACKAGE_PIN U17 [get_ports {spi_din}]
#set_property PACKAGE_PIN U18 [get_ports {spi_dout}]
#set_property IOSTANDARD LVCMOS33 [get_ports {spi_cs}]
#set_property IOSTANDARD LVCMOS33 [get_ports {spi_clk}]
#set_property IOSTANDARD LVCMOS33 [get_ports {spi_din}]
#set_property IOSTANDARD LVCMOS33 [get_ports {spi_dout}]

# DRAM #####################################################################
set_property PACKAGE_PIN AB1 [get_ports {ddr3_dq[0]}]
set_property PACKAGE_PIN Y4  [get_ports {ddr3_dq[1]}]
set_property PACKAGE_PIN AB2 [get_ports {ddr3_dq[2]}]
set_property PACKAGE_PIN V4  [get_ports {ddr3_dq[3]}]
set_property PACKAGE_PIN AB5 [get_ports {ddr3_dq[4]}]
set_property PACKAGE_PIN AA5 [get_ports {ddr3_dq[5]}]
set_property PACKAGE_PIN AB3 [get_ports {ddr3_dq[6]}]
set_property PACKAGE_PIN AA4 [get_ports {ddr3_dq[7]}]
set_property PACKAGE_PIN U3  [get_ports {ddr3_dq[8]}]
set_property PACKAGE_PIN W2  [get_ports {ddr3_dq[9]}]
set_property PACKAGE_PIN U2  [get_ports {ddr3_dq[10]}]
set_property PACKAGE_PIN Y2  [get_ports {ddr3_dq[11]}]
set_property PACKAGE_PIN U1  [get_ports {ddr3_dq[12]}]
set_property PACKAGE_PIN Y1  [get_ports {ddr3_dq[13]}]
set_property PACKAGE_PIN T1  [get_ports {ddr3_dq[14]}]
set_property PACKAGE_PIN W1  [get_ports {ddr3_dq[15]}]
set_property SLEW FAST [get_ports {ddr3_dq[*]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[*]}]

set_property PACKAGE_PIN W6  [get_ports {ddr3_addr[0]}]
set_property PACKAGE_PIN U7  [get_ports {ddr3_addr[1]}]
set_property PACKAGE_PIN W7  [get_ports {ddr3_addr[2]}]
set_property PACKAGE_PIN Y6  [get_ports {ddr3_addr[3]}]
set_property PACKAGE_PIN U6  [get_ports {ddr3_addr[4]}]
set_property PACKAGE_PIN AB7 [get_ports {ddr3_addr[5]}]
set_property PACKAGE_PIN Y8  [get_ports {ddr3_addr[6]}]
set_property PACKAGE_PIN AB8 [get_ports {ddr3_addr[7]}]
set_property PACKAGE_PIN Y7  [get_ports {ddr3_addr[8]}]
set_property PACKAGE_PIN AA8 [get_ports {ddr3_addr[9]}]
set_property PACKAGE_PIN T4  [get_ports {ddr3_addr[10]}]
set_property PACKAGE_PIN V7  [get_ports {ddr3_addr[11]}]
set_property PACKAGE_PIN T6  [get_ports {ddr3_addr[12]}]
set_property PACKAGE_PIN Y9  [get_ports {ddr3_addr[13]}]
set_property PACKAGE_PIN W9  [get_ports {ddr3_addr[14]}]
set_property SLEW FAST [get_ports {ddr3_addr[*]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[*]}]

set_property PACKAGE_PIN AB6 [get_ports {ddr3_ba[0]}]
set_property PACKAGE_PIN R6  [get_ports {ddr3_ba[1]}]
set_property PACKAGE_PIN AA6 [get_ports {ddr3_ba[2]}]
set_property SLEW FAST [get_ports {ddr3_ba[*]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[*]}]

set_property PACKAGE_PIN V5 [get_ports {ddr3_ras_n}]
set_property SLEW FAST [get_ports {ddr3_ras_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_ras_n}]

set_property PACKAGE_PIN U5 [get_ports {ddr3_cas_n}]
set_property SLEW FAST [get_ports {ddr3_cas_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_cas_n}]

set_property PACKAGE_PIN T5 [get_ports {ddr3_we_n}]
set_property SLEW FAST [get_ports {ddr3_we_n}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_we_n}]

set_property PACKAGE_PIN T3 [get_ports {ddr3_reset_n}]
set_property SLEW FAST [get_ports {ddr3_reset_n}]
set_property IOSTANDARD LVCMOS15 [get_ports {ddr3_reset_n}]

set_property PACKAGE_PIN R4 [get_ports {ddr3_cke}]
set_property SLEW FAST [get_ports {ddr3_cke}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_cke}]

set_property PACKAGE_PIN W5 [get_ports {ddr3_odt}]
set_property SLEW FAST [get_ports {ddr3_odt}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_odt}]

set_property PACKAGE_PIN AA1 [get_ports {ddr3_dm[0]}]
set_property PACKAGE_PIN V2  [get_ports {ddr3_dm[1]}]
set_property SLEW FAST [get_ports {ddr3_dm[*]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[*]}]

set_property PACKAGE_PIN Y3  [get_ports {ddr3_dqs_p[0]}]
set_property PACKAGE_PIN AA3 [get_ports {ddr3_dqs_n[0]}]
set_property PACKAGE_PIN R3  [get_ports {ddr3_dqs_p[1]}]
set_property PACKAGE_PIN R2  [get_ports {ddr3_dqs_n[1]}]
set_property SLEW FAST [get_ports {ddr3_dqs*}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs*}]

set_property PACKAGE_PIN V9 [get_ports {ddr3_ck_p}]
set_property PACKAGE_PIN V8 [get_ports {ddr3_ck_n}]
set_property SLEW FAST [get_ports {ddr3_ck*}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_ck_*}]

