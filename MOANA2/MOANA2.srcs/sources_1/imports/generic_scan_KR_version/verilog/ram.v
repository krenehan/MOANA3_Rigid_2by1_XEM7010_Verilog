
`timescale 1ns/1ps
// ============================================================================
// A generic True Dual Port RAM block. May be synthesized to BRAM or LUTRAM
// ============================================================================
module ram(
        clk_a,
        clk_b,
        
        enable_a,
        enable_b,
        
        addr_a,
        addr_b,

        write_en_a,
        write_en_b,
        
        data_in_a,
        data_in_b,

        data_out_a,
        data_out_b
    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    // RAM Parameters
    parameter Capacity =            16384;      // 16384 is the size of a BRAM on the Spartan-3
    parameter AddressWidth =        10;         // Must be >= log2(Capacity / AccessWidth)
    parameter AccessWidth =         16;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Constants
    //-----------------------------------------------------------------------------------
    localparam Entries =            Capacity / AccessWidth;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    I/O
    //-----------------------------------------------------------------------------------
    input wire                      clk_a;
    input wire                      clk_b;

    input wire                      enable_a;
    input wire                      enable_b;

    input wire  [AddressWidth-1:0]  addr_a;
    input wire  [AddressWidth-1:0]  addr_b;

    input wire                      write_en_a;
    input wire                      write_en_b;
    
    input wire  [AccessWidth-1:0]   data_in_a;
    input wire  [AccessWidth-1:0]   data_in_b;

    output reg  [AccessWidth-1:0]   data_out_a;
    output reg  [AccessWidth-1:0]   data_out_b;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Signals
    //-----------------------------------------------------------------------------------
    reg         [AccessWidth-1:0]   Memory  [0:Entries-1];
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Port A Interface
    //-----------------------------------------------------------------------------------
    always @(posedge clk_a) begin
        if (enable_a) data_out_a <= Memory[addr_a];
        if (enable_a & write_en_a) Memory[addr_a] <= data_in_a;
    end
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Port B Interface
    //-----------------------------------------------------------------------------------
    always @(posedge clk_b) begin
        if (enable_b) data_out_b <= Memory[addr_b];
        if (enable_b & write_en_b) Memory[addr_b] <= data_in_b;
    end
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Consistency Checks
    //-----------------------------------------------------------------------------------
    `ifdef BEHAVIORAL
    initial begin
        if (2**AddressWidth < Entries) begin
            $display("Consistency error: AddressWidth must be >= log2(Capacity / AccessWidth)");
            $finish;
        end
        if (2**AddressWidth >= 2 * Entries) begin
            $display("Consistency error: AddressWidth must be < log2(Capacity / AccessWidth) + 1");
            $finish;
        end
        if (Capacity % AccessWidth !== 0) begin
            $display("Consistency error: Capacity must be divisible by AccessWidth!");
            $finish;
        end        
    end
    `endif
    //-----------------------------------------------------------------------------------
    
endmodule
