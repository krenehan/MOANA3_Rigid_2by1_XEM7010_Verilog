
// Macros for mapping MC1 pins to FPGA I/O pins
// Works for Motherboard v1.1

// Inputs
`define FPGA_IO_0  	MC1[0]  // (TxDataOut_2)
`define FPGA_IO_1   MC1[1]  // (SOut_2)
`define FPGA_IO_2  MC1[2] // (SOut_1)
`define FPGA_IO_3  MC1[3] // (TxDataOut_1)

// Outputs
`define FPGA_IO_4  MC1[4] // (SEnable_2)
`define FPGA_IO_5  MC1[5] // (SReset)
`define FPGA_IO_6  MC1[6] // (SClkP)
`define FPGA_IO_7  MC1[7] // (SClkN)
`define FPGA_IO_8	MC1[8] // (SIn)
`define FPGA_IO_9	MC1[9] // (RstAsync)

`define FPGA_IO_12	MC1[12] // (RefClk)
`define FPGA_IO_10	MC1[10] // (SUpdate)

`define FPGA_IO_13	MC1[13] // (TxRefClk)
`define FPGA_IO_11	MC1[11] // (SEnable_1)
`define FPGA_IO_14	MC1[14] // (REFCLK_EXT)

// Board signals
`define FPGA_IO_15	MC1[15] // (VDD_SM_RESET_BAR)
`define FPGA_IO_16	MC1[16] // (HVDD_LDO_ENABLE)
`define FPGA_IO_17	MC1[17] // (VRST_LDO_ENABLE)
`define FPGA_IO_18   MC1[18] // (CLOCK_LS_DIRECTION)
`define FPGA_IO_19   MC1[19] // (CLOCK_LS_OE_BAR)
`define FPGA_IO_20   MC1[20] // (CATH_SM_ENABLE)
`define FPGA_IO_21   MC1[21] // (VCSEL_SM_ENABLE)
`define FPGA_IO_22   MC1[22] // (POT_CLK)
`define FPGA_IO_23   MC1[23] // (POT_DATA)
`define FPGA_IO_24   MC1[24] // (POT_CS1_BAR)
`define FPGA_IO_25   MC1[25] // (POT_CS2_BAR)
