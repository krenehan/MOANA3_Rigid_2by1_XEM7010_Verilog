
// time scale
`timescale 1ns/1ps

// no undeclared nets
//`default_nettype none

module DigitalCore_ShiftRegister(
        
        //---------------------------------------------------------------------------
        //  ports
        //---------------------------------------------------------------------------
        rst,
        shift,
        data,
        out, 
        shift_count,
        shift_done
        //---------------------------------------------------------------------------        

    );
    parameter Length = 15;
    localparam CntWidth = $clog2(Length);
    localparam DummyBits = CntWidth - 1;

    //-----------------------------------------------------------------------------------
    //   I/O Wires
    //-----------------------------------------------------------------------------------
    input   wire                                rst;
    input   wire                                shift;
    input   wire                                data;
    output  wire    [Length-1:0]                out;
    output  wire    [CntWidth-1:0]              shift_count;
    output  wire                                shift_done;

	
    //-----------------------------------------------------------------------------------
    //  Genvars
    //-----------------------------------------------------------------------------------
    genvar i;
    //-----------------------------------------------------------------------------------
	
    //-----------------------------------------------------------------------------------
    //   Wires
    //-----------------------------------------------------------------------------------
    reg [Length-1:0] register_bank;
    //wire [CntWidth-1:0] shift_count;

    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //   Assigns
    //-----------------------------------------------------------------------------------
    assign out = register_bank;
    assign shift_done = (shift_count == Length);

    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    Shift operation - LSB shifted in first, MSB shifted in last
    //-----------------------------------------------------------------------------------
    always @(posedge shift or posedge rst) begin
        if (rst) begin
            register_bank <= { Length{1'b0} };
        end else begin
            register_bank <= {data, register_bank[Length-1:1]};
        end
    end
    
    //-----------------------------------------------------------------------------------
    //    Shift counter for setting shift_done signal
    //-----------------------------------------------------------------------------------
    //always @(posedge shift or posedge rst) begin
    //    if (rst) begin
    //        shift_count <= { CntWidth{1'b0} };
    //    end else if (shift_count < Length) begin
    //        shift_count <= shift_count + { {DummyBits{1'b0}}, 1'b1};
    //    end
    //end
    
    //-----------------------------------------------------------------------------------
    //    Async shift counter for setting shift_done signal
    //-----------------------------------------------------------------------------------
    DigitalCore_async_counter #( .Width (CntWidth) )
        shift_counter ( .clk (shift),
                        .reset (rst),
                        .count (shift_count)
                      );

endmodule

