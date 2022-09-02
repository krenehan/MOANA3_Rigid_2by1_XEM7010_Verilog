`timescale 1ns / 1ps

//=============================================================================
//  This module manages a pipe interface to the Opal Kelly Host Interface
//  Uses simple protocol for piping things in and out and contains a buffer
//  for storing large pipes
//  USB <-> Opal Kelly Host Interface <-> Pipe I/O Interface <-> FPGA modules
//=============================================================================

module pipe_interface(
        // global signals
        clk,
        rst,
        
        // Buffer clears
        clr_inbuf,
        clr_outbuf,

        // OK interface

        // Handshakes
        pipeI_ready,
        pipeI_write,
        pipeI_data,
        
        pipeO_valid,
        pipeO_read,
        pipeO_data,

        pipeIO_err,

        // Interface to the reset of the FPGA

        // Handshakes
        data_valid,
        data_free,
        data_return,

        // Parallel data out
        ok2core_header,

        // FPGA RAM-style interface to pipe buffer
        buf_clk,
        buf_addr,
        buf_bit_sel,
        buf_write_en,
        buf_data_in,
        buf_data_out        
    );
    
    //------------------------------------------------------------------------
    //  Parameters
    //------------------------------------------------------------------------
    parameter Capacity =                16384 * 16; // 16384 is the size of a BRAM on the Spartan-3
    parameter PacketLength =            4096;       // Expected packet length (in number of flits) from OK
    parameter FlitWidth =               16;         // Word size of OK interface
    parameter AddressWidth =            18;         // Address Width of the shared BRAM
    parameter CountWidth =              16;         // Width of the counters, must be greater than log2(PacketLength)
    parameter AddressStart =            0;          // Offset address to start writing
    parameter HeaderFlits =             4;          // Number of Flits that correspond to the header
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    //  Constants
    //------------------------------------------------------------------------
    localparam HeaderSize =             HeaderFlits * FlitWidth;
    localparam BitOffsetWidth =         4;
    localparam WordAddressWidth =       AddressWidth - BitOffsetWidth;
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    //  I/O
    //------------------------------------------------------------------------    
    // Interface between this block and Opal Kelly Host Interface
    input wire                          clk;                     // 48MHz reference clock synchronized with USB interface
    input wire                          rst;                        // synchronous reset (active high)

    // Buffer counter clears
    input wire                          clr_inbuf;                   // Clear Input Buffer (msgin)
    input wire                          clr_outbuf;                  // Clear Output Buffer (msgout)
    
    // OK interface
    output wire                         pipeI_ready;                // Ready for a new packet to be piped in
    input wire                          pipeI_write;                // Flag indicating incoming data ready
    input wire  [FlitWidth-1:0]         pipeI_data;                 // Opal Kelly HI to This Buffer Data
    
    output wire                         pipeO_valid;                // Buffer contains a valid packet for pipe out
    input wire                          pipeO_read;                 // Flag requesting outgoing data
    output wire [FlitWidth-1:0]         pipeO_data;                 // This Buffer to Opal Kelly HI Data

    output reg                          pipeIO_err;                 // Flag pipe IO error
    
    // OK to FPGA interface
    output reg  [HeaderSize-1:0]        ok2core_header;             // The header, containing command and other stuff
    output wire                         data_valid;                 // The data piped in is valid (assert when pipe in is done)
    input wire                          data_free;                  // Pulse to free the data buffer (pulse when data in buffer no longer needed)
    input wire                          data_return;                // Pulse to indicate that the data buffer has data to return to the OK
    
    // FPGA Interface to pipe buffer
    input wire                          buf_clk;
    input wire  [AddressWidth-1:0]      buf_addr;
    input wire                          buf_bit_sel;
    input wire                          buf_write_en;
    input wire  [FlitWidth-1:0]         buf_data_in;
    output wire [FlitWidth-1:0]         buf_data_out;
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    //  Signals
    //------------------------------------------------------------------------

    // Buffer counters
    reg         [CountWidth-1:0]        ok2core_cnt;                // Data Byte Counter for Buffer to Core Data
    reg         [CountWidth-1:0]        core2ok_cnt;                // Data Byte Counter for Core to Buffer Data
    
    // Interface to the buffer
    wire        [AddressWidth-1:0]      ok_buf_addr;
    wire                                ok_buf_write_en;
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    //  Assigns
    //------------------------------------------------------------------------
    assign pipeI_ready =                (ok2core_cnt == 0);
    assign pipeO_valid =                (core2ok_cnt < PacketLength);
    
    assign data_valid =                 (ok2core_cnt >= PacketLength);    
    assign ok_buf_addr =                {(pipeI_write) ? ok2core_cnt[WordAddressWidth-1:0] : 
                                            core2ok_cnt[WordAddressWidth-1:0], {BitOffsetWidth{1'b0}}};
    assign ok_buf_write_en =            pipeI_write;
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    //  Header of the packet
    //------------------------------------------------------------------------
    always @(posedge clk) begin
        if (rst | clr_inbuf)
            ok2core_header <= {HeaderSize{1'b0}};
        else if (pipeI_write & (ok2core_cnt < HeaderFlits))
            ok2core_header <= {pipeI_data, ok2core_header[HeaderSize-1:FlitWidth]};
    end
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    //  Input Data (from Opal Kelly to Core) Interface 
    //------------------------------------------------------------------------
    // Shift in counter, used to know when data has been piped in and is valid to the core
    // Least signficant memory address is piped in first
    always @(posedge clk) begin
        if (rst | clr_inbuf)
            ok2core_cnt <= {CountWidth{1'b0}};            // global reset or local buffer clear            
        else if (data_free)
            ok2core_cnt <= 0;                               // data in buffer no longer needed ...
        else if (pipeI_write & (ok2core_cnt < PacketLength))
            ok2core_cnt <= ok2core_cnt + 1;                 // increase counter
    end
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    //  Output Data (from Core to Opal Kelly) Interface 
    //------------------------------------------------------------------------
    // Shift in counter, used to know when data is done piping out
    // Most signficant memory address is piped out first
    always @(posedge clk) begin
        if (rst | clr_outbuf)
            core2ok_cnt <= PacketLength;
        else if (data_return)             // data is available ...
            core2ok_cnt <= PacketLength - 1;
        else if (pipeO_read & (core2ok_cnt < PacketLength))
            core2ok_cnt <= core2ok_cnt - 1;
    end
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    //  Error bit
    //------------------------------------------------------------------------
    always @(posedge clk) begin
        if (rst | clr_inbuf)
            pipeIO_err <= 1'b0;                             // Clear pipeIO_err
        else if (pipeI_write & (ok2core_cnt >= PacketLength))
            pipeIO_err <= 1'b1;                             // error: protocol broken
        else if (pipeO_read & (core2ok_cnt >= PacketLength))
            pipeIO_err <= 1'b1;
    end
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    //  Shared Buffer
    //------------------------------------------------------------------------
    // Ok-side of the interface always accesses in words
    shared_buffer   #   (   .Capacity                   (Capacity),
                            .AccessWidth                (FlitWidth),
                            .AddressWidth               (AddressWidth))
                ram_buf (   .clk_a                      (clk),
                            .enable_a                   (1'b1),
                            .addr_a                     (ok_buf_addr),
                            .bit_sel_a                  (1'b0),             
                            .write_en_a                 (ok_buf_write_en),
                            .data_in_a                  (pipeI_data),
                            .data_out_a                 (pipeO_data),
                                    
                            .clk_b                      (buf_clk),
                            .enable_b                   (1'b1),
                            .addr_b                     (buf_addr),
                            .bit_sel_b                  (buf_bit_sel),
                            .write_en_b                 (buf_write_en),
                            .data_in_b                  (buf_data_in),
                            .data_out_b                 (buf_data_out));    
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    //  Consistency Check
    //------------------------------------------------------------------------
    `ifdef BEHAVIORAL
    initial begin
        if (2**CountWidth <= PacketLength) begin
            $display("Consistency Error: CountWidth must be > log2(PacketLength)!");
            $finish;
        end        
        if (2**AddressWidth < PacketLength * FlitWidth) begin
            $display("Consistency Error: AddressWidth must be >= log2(PacketLength * FlitWidth)!");        
            $finish;
        end
    end
    `endif
    //------------------------------------------------------------------------
endmodule

