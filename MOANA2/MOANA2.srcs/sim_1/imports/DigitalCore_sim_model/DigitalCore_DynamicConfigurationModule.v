
// time scale
`timescale 1ns/1ps

// no undeclared nets
//`default_nettype none

module DigitalCore_DynamicConfigurationModule(
        
        //---------------------------------------------------------------------------
        //  ports
        //---------------------------------------------------------------------------
        rst,
        max_count_reset,
        clk,
        enable,
        shift_enable, 
        shift_data,
        vcsel_enable_dynamic,
        vcsel_wavelength1_enable_dynamic,
        vcsel_wavelength2_enable_dynamic,
        driver_dll_word_dynamic,
        clk_flip_dynamic,
        aqc_dll_coarse_word_dynamic,
        aqc_dll_fine_word_dynamic,
        aqc_dll_finest_word_dynamic,
        dll_change,
        dll_change_done,
        dynamic_histogram_reset_trigger,
        dynamic_histogram_reset_active,
        packet
        //---------------------------------------------------------------------------        

    );
    
    parameter PacketSize = 1 + 2 + 5 + 1 + 4 + 3 + 1;
    localparam CntWidth = $clog2(PacketSize);
    //localparam PacketSizeMinusTwo = PacketSize - 2;

    //-----------------------------------------------------------------------------------
    //   I/O Wires
    //-----------------------------------------------------------------------------------
    input   wire                            rst;
    input   wire                            max_count_reset;
    input   wire                            clk;
    input   wire                            enable;
    input   wire                            shift_enable;
    input   wire                            shift_data;
    output  wire                            vcsel_enable_dynamic;
    output  wire                            vcsel_wavelength1_enable_dynamic;
    output  wire                            vcsel_wavelength2_enable_dynamic;
    output  wire    [4:0]                   driver_dll_word_dynamic;
    output  wire                            clk_flip_dynamic;
    output  wire    [3:0]                   aqc_dll_coarse_word_dynamic;
    output  wire    [2:0]                   aqc_dll_fine_word_dynamic;
    output  wire                            aqc_dll_finest_word_dynamic;
    output  wire                            dll_change;
    input   wire                            dll_change_done;
    output  wire                            dynamic_histogram_reset_trigger;
    input   wire                            dynamic_histogram_reset_active;
    output  wire    [PacketSize-1:0]        packet;


	
    //-----------------------------------------------------------------------------------
    //  Genvars
    //-----------------------------------------------------------------------------------
    genvar i;
    //-----------------------------------------------------------------------------------
	
    //-----------------------------------------------------------------------------------
    //   Wires
    //-----------------------------------------------------------------------------------
    wire                                    change_request;
    wire                                    change_dynamic;
    wire                                    shift_done;
    wire                                    shift_done_synced;
    wire            [PacketSize-1:0]        new_packet;
    wire                                    dll_change_done_synced;
    wire                                    shift_register_reset;
    wire            [CntWidth-1:0]          shift_count;
    wire                                    dynamic_histogram_reset_trigger_delayed;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //   Assigns
    //-----------------------------------------------------------------------------------
    assign vcsel_enable_dynamic =              packet[ PacketSize - 1: PacketSize - 1];
    assign vcsel_wavelength1_enable_dynamic =  packet[ PacketSize - 2: PacketSize - 2];
    assign vcsel_wavelength2_enable_dynamic =  packet[ PacketSize - 3: PacketSize - 3];
    assign driver_dll_word_dynamic =           packet[ PacketSize - 4: PacketSize - 8];
    assign clk_flip_dynamic =                  packet[ PacketSize - 9: PacketSize - 9];
    assign aqc_dll_coarse_word_dynamic =       packet[ PacketSize - 10: PacketSize - 13];
    assign aqc_dll_fine_word_dynamic =         packet[ PacketSize - 14: PacketSize - 16];
    assign aqc_dll_finest_word_dynamic =       packet[ PacketSize - 17: PacketSize - 17];
    
    // When change is asserted, change dynamic will go high and be sent to the delay line at the next edge of the clock
    assign change_dynamic = ~dll_change_done_synced & change_request;
                                
     
    //-----------------------------------------------------------------------------------
    //    Shift register (set data, pulse clock to shift in)
    //    Assumption is that clock used for shift is slower than the clock frequency by some factor >2
    //    New packet is generated by shifting in data
    //    When new packet is received, a change request is generated
    //    Change request triggers a reset of the current histogram
    //    Shift_done is the only signal that propagates into the DigitalCore logic
    //    All other signals in the packet go to the DLLClockGen block, which includes synchronizer flops for all inputs
    //-----------------------------------------------------------------------------------
	DigitalCore_ShiftRegister   #           (   
                                    .Length     (PacketSize))
        ShiftRegisterInst       (
                                    .rst        (shift_register_reset),
                                    .shift      (shift_enable),
				                    .data       (shift_data),
				                    .shift_count(shift_count),
				                    .out        (new_packet),
				                    .shift_done (shift_done)
                                );
    
    assign shift_register_reset = rst | (max_count_reset & ~dynamic_histogram_reset_active);
    
    
    //-----------------------------------------------------------------------------------
    //    shift_done synchronized across clock boundaries
    //-----------------------------------------------------------------------------------
    DigitalCore_ClkCycleDelay        #      (
                                    .Width(1),
                                    .DelayCycles(2))
          shift_done_sync       (
                                    .clk        (clk),
                                    .rst        (rst),
                                    .in         (shift_done),
                                    .out        (shift_done_synced)
                                );         


    //-----------------------------------------------------------------------------------
    //    Dynamic reset is triggered by the shift done signal
    //-----------------------------------------------------------------------------------
	DigitalCore_PulseGenerator  #           (
	                                .PulseLength(3))
        DynamicResetPulseGen    (
                                    .rst        (rst),
                                    .clk        (clk),
				                    .in         (shift_done_synced),
				                    .out        (dynamic_histogram_reset_trigger)
                                );    
                                
                                         
    //-----------------------------------------------------------------------------------
    //    Dynamic reset trigger delayed by 2 cycles 
    //-----------------------------------------------------------------------------------
    DigitalCore_ClkCycleDelay        #      (
                                    .Width(1),
                                    .DelayCycles(2))
        reset_trigger_sync      (
                                    .clk        (clk),
                                    .rst        (rst),
                                    .in         (dynamic_histogram_reset_trigger),
                                    .out        (dynamic_histogram_reset_trigger_delayed)
                                );
                 
                                
    //-----------------------------------------------------------------------------------
    //    Change request generated as a pulse from shift_done
    //-----------------------------------------------------------------------------------
	DigitalCore_PulseGenerator  #           (
	                                .PulseLength(3))
        ShiftDonePulseGenInst   (
                                    .rst        (rst),
                                    .clk        (clk),
				                    .in         (dynamic_histogram_reset_trigger_delayed),
				                    .out        (change_request)
                                );
                               
                                

    //-----------------------------------------------------------------------------------
    //    Change request propagates new packet 
    //    TODO: Verify that timing of inputs to delay line matches simulation
    //-----------------------------------------------------------------------------------  
    DigitalCore_io_flops        #           (
                                    .Width      (PacketSize),
                                    .ResetVal   (1'b0))
        packet_flops            (
                                    .clk        (clk),
                                    .reset      (rst),
                                    .enable     (change_dynamic),
                                    .in         (new_packet),
                                    .out        (packet)
                                );
                                

    //-----------------------------------------------------------------------------------
    //    Change request sent to DLL
    //-----------------------------------------------------------------------------------  
    DigitalCore_io_flops        #           (
                                    .Width      (1),
                                    .ResetVal   (1'b0))
        dll_change_flops        (
                                    .clk        (clk),
                                    .reset      (rst),
                                    .enable     (1'b1),
                                    .in         (change_dynamic),
                                    .out        (dll_change)
                                );
            
                             
    //-----------------------------------------------------------------------------------
    //    Synchronizer flops for change_done signal
    //-----------------------------------------------------------------------------------
    DigitalCore_ClkCycleDelay        #      (
                                    .Width(1),
                                    .DelayCycles(2))
                done_sync       (
                                    .clk        (clk),
                                    .rst        (rst),
                                    .in         (dll_change_done),
                                    .out        (dll_change_done_synced)
                                );
                                
                                
            

endmodule

