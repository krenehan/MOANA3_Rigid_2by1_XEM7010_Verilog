
`timescale 1ns/1ps
// ============================================================================
// A Shared Buffer
// ============================================================================
module shared_buffer(
        clk_a,
        clk_b,
        
        enable_a,
        enable_b,
        
        addr_a,
        addr_b,
        
        bit_sel_a,
        bit_sel_b,

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
    parameter Capacity =                16384 * 16;     // 16384 is the size of a BRAM on the Spartan-3
    parameter AddressWidth =            18;             // Addressed by bits, not words
    parameter AccessWidth =             16;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Constants
    //-----------------------------------------------------------------------------------
    localparam BitOffsetWidth =         4;
    localparam WordAddressWidth =       AddressWidth - BitOffsetWidth;
    localparam BlockCapacity =          Capacity / AccessWidth;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    I/O
    //-----------------------------------------------------------------------------------
    input wire                          clk_a;
    input wire                          clk_b;

    input wire                          enable_a;
    input wire                          enable_b;

    input wire  [AddressWidth-1:0]      addr_a;
    input wire  [AddressWidth-1:0]      addr_b;

    //If bit select is not enabled, bottom bits of address are ignored
    input wire                          bit_sel_a;  
    input wire                          bit_sel_b;
    
    input wire                          write_en_a;
    input wire                          write_en_b;
    
    input wire  [AccessWidth-1:0]       data_in_a;
    input wire  [AccessWidth-1:0]       data_in_b;

    output wire [AccessWidth-1:0]       data_out_a;
    output wire [AccessWidth-1:0]       data_out_b;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Genvars
    //-----------------------------------------------------------------------------------
    genvar i;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Signals
    //-----------------------------------------------------------------------------------
    wire        [AccessWidth-1:0]       ram_in_a;
    wire        [AccessWidth-1:0]       ram_in_b;
    
    wire        [AccessWidth-1:0]       ram_out_a;
    wire        [AccessWidth-1:0]       ram_out_b;
    
    wire        [WordAddressWidth-1:0]  ram_addr_a;
    wire        [BitOffsetWidth-1:0]    bit_offset_a;
    reg         [BitOffsetWidth-1:0]    bit_offset_a_delay;    
    reg                                 bit_sel_a_delay;

    wire        [WordAddressWidth-1:0]  ram_addr_b;
    wire        [BitOffsetWidth-1:0]    bit_offset_b;
    reg         [BitOffsetWidth-1:0]    bit_offset_b_delay;
    reg                                 bit_sel_b_delay;
    
    wire        [AccessWidth-1:0]       ram_we_a;
    wire        [AccessWidth-1:0]       ram_we_b;    
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Assigns
    //-----------------------------------------------------------------------------------
    assign {ram_addr_a, bit_offset_a} = addr_a;
    assign {ram_addr_b, bit_offset_b} = addr_b;

    // When reading in bit-selected mode, all output bits correspond to the selected bit
    assign data_out_a =                 (bit_sel_a_delay) ? {AccessWidth{ram_out_a[bit_offset_a_delay]}} : ram_out_a;
    assign data_out_b =                 (bit_sel_b_delay) ? {AccessWidth{ram_out_b[bit_offset_b_delay]}} : ram_out_b;
    
    assign ram_in_a =                   (~bit_sel_a) ? data_in_a : {AccessWidth{data_in_a[0]}};
    assign ram_in_b =                   (~bit_sel_b) ? data_in_b : {AccessWidth{data_in_b[0]}};
    
    // Write enable signal needs to be decoded in the bit selected mode
    generate for (i = 0; i < AccessWidth; i = i + 1) begin: WriteEnDecode
        assign ram_we_a[i] =            write_en_a & ((i == bit_offset_a) | ~bit_sel_a);
        assign ram_we_b[i] =            write_en_b & ((i == bit_offset_b) | ~bit_sel_b);
    end endgenerate
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //  Delayed bottom address until data comes out
    //-----------------------------------------------------------------------------------
    always @(posedge clk_a) begin
        bit_offset_a_delay <= bit_offset_a;
        bit_sel_a_delay <= bit_sel_a;    
    end

    always @(posedge clk_b) begin
        bit_offset_b_delay <= bit_offset_b;        
        bit_sel_b_delay <= bit_sel_b;
    end    
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Instantiate RAMs
    //-----------------------------------------------------------------------------------
    generate for (i = 0; i < AccessWidth; i = i + 1) begin: MemoryBlocks
        ram     #   (   .Capacity       (BlockCapacity),
                        .AddressWidth   (WordAddressWidth),
                        .AccessWidth    (1))
            buf_ram (   .clk_a          (clk_a),
                        .enable_a       (enable_a),
                        .addr_a         (ram_addr_a),
                        .write_en_a     (ram_we_a[i]),
                        .data_in_a      (ram_in_a[i]),
                        .data_out_a     (ram_out_a[i]),
                        
                        .clk_b          (clk_b),
                        .enable_b       (enable_b),
                        .addr_b         (ram_addr_b),
                        .write_en_b     (ram_we_b[i]),
                        .data_in_b      (ram_in_b[i]),
                        .data_out_b     (ram_out_b[i]));
    end endgenerate
    //-----------------------------------------------------------------------------------
    
    
    //-----------------------------------------------------------------------------------
    //  Consistency Checks
    //-----------------------------------------------------------------------------------
    `ifdef BEHAVIORAL
    initial begin
        if (2**AddressWidth < Capacity) begin
            $display("Consistency error: AddressWidth must be >= log2(Capacity)");
            $finish;
        end
        if (2**BitOffsetWidth !== AccessWidth) begin
            $display("Consistency error: Bit offset width must be == log2(AccessWidth)");
            $finish;
        end        
    end
    `endif
    //-----------------------------------------------------------------------------------
    
endmodule
