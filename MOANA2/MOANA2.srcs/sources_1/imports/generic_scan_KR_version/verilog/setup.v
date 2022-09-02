
// Setup defines the control board and includes the FPGA pin mapping
// for the current project. This is an example file.
// Change to setup.v so Xilinx will include the file. Do not check
// the renamed setup.v file into SVN, or else you will cause conflicts
// for people that update the code

// Define the control board
// Current available choices are:
`define MOTHERBOARD_V1P1

// The include path is relative to the folder synthesis is run in (xilinx folder)
`include "../verilog/chips/moana2_pin_config.v"
