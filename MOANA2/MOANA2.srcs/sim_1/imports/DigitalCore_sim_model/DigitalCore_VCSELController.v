// time scale
`timescale 1ns/1ps

// no undeclared nets
//`default_nettype none

module DigitalCore_VCSELController(
        
        //---------------------------------------------------------------------------
        //  Ports
        //---------------------------------------------------------------------------
        rst,
        clk,
        max_count_rst,
        
        // Config signals
        vcsel_enable_controlled_by_scan_chain,
        vcsel_enable_with_scan, 
        vcsel_enable_controlled_by_shift_register,
        vcsel_enable_with_shift_register,
        
        // Signals for simple VCSEL enable with SUpdate and SEnable
        s_enable,
        pattern_reset_external_signal,
        
        // Final output
        vcsel_enable
        //---------------------------------------------------------------------------        

    );

    //-----------------------------------------------------------------------------------
    //   I/O
    //-----------------------------------------------------------------------------------
    input   wire            rst;
    input   wire            clk;
    input   wire            max_count_rst;
    input   wire            vcsel_enable_controlled_by_scan_chain;
    input   wire            vcsel_enable_with_scan;
    input   wire            vcsel_enable_controlled_by_shift_register;
    input   wire            vcsel_enable_with_shift_register;
    input   wire            s_enable;
    input   wire            pattern_reset_external_signal;
    output  wire            vcsel_enable;

	
    //-----------------------------------------------------------------------------------
    //  Genvars
    //-----------------------------------------------------------------------------------
    genvar                  i;

	
    //-----------------------------------------------------------------------------------
    //   Wires
    //-----------------------------------------------------------------------------------
    wire                    vcsel_enable_dynamic;
    reg                     vcsel_enable_with_simple;
    wire                    vcsel_enable_rst;

    //-----------------------------------------------------------------------------------
    //   Assigns
    //-----------------------------------------------------------------------------------
    // Master VCSEL enable signal, choose through scan chain or through dynamic configuration
    assign vcsel_enable = vcsel_enable_controlled_by_scan_chain ? vcsel_enable_with_scan : vcsel_enable_dynamic;
    
    // Dynamic configuration done simple way (SEnable and SUpdate tied high) or with the shift register
    assign vcsel_enable_dynamic = vcsel_enable_controlled_by_shift_register ? vcsel_enable_with_shift_register : vcsel_enable_with_simple;
    
    // Reset at the end of the pattern
    assign vcsel_enable_rst = rst | max_count_rst;
    

    //-----------------------------------------------------------------------------------
    //  Register for setting vcsel_enable_with_simple
    //-----------------------------------------------------------------------------------
    always @(posedge clk or posedge vcsel_enable_rst) begin
        if (vcsel_enable_rst) begin
            vcsel_enable_with_simple <= 1'b0;
        end else if (s_enable & pattern_reset_external_signal) begin	
            vcsel_enable_with_simple <= 1'b1;
        end
    end
    

endmodule

