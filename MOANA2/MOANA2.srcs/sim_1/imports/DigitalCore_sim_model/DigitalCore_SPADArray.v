module DigitalCore_SPAD(ANODE, CATHODE, CLK);

    inout wire ANODE;
    inout wire CATHODE;
    input wire CLK;

    reg random_value;

    assign ANODE = random_value;

    always @(posedge CLK) begin
        #(({$random} % 2)*5000) random_value <= {$random} % 2;
    end


endmodule

module DigitalCore_SPADRow(CLK, CATHODE, SPAD_EN, DET, VRST);
    
    input wire CLK;
    inout wire VRST;
    output wire DET;
    input wire [7:0] SPAD_EN;
    inout wire CATHODE;	

    // Internal signals
    wire [7:0] DET_INT;
    wire [7:0] ANODE_INT;
    
    // Generate variable
    genvar i;
    
    // DET output goes high when any SPAD DET signal goes high
    assign DET = DET_INT[0];

    generate for (i = 0; i < 8; i = i + 1) begin : spad_aqc_gen
        DigitalCore_SPAD SPAD(
            .CLK(CLK),
            .ANODE(ANODE_INT[i]),
            .CATHODE(CATHODE)
        );
        
        DigitalCore_AQC AQC(
            .ANODE(ANODE_INT[i]),
            .VRST(VRST),
            .EN(SPAD_EN[i] & CLK),
            .DET(DET_INT[i])
        );

    end endgenerate

endmodule

module DigitalCore_SPADArray(AQC_CLK, AQC_CLK_OUT, TDC_STOP_CLK, CATHODE, VCSELEN_IN, VCSELEN_OUT, SPAD_EN, RowOut, VRST);

    input wire AQC_CLK;
    output wire AQC_CLK_OUT;
    output wire TDC_STOP_CLK;
    input wire VCSELEN_IN;
    output wire VCSELEN_OUT;
    inout wire CATHODE;
    input wire [63:0] SPAD_EN;
    output wire [7:0] RowOut;
    inout wire VRST;
    
    assign AQC_CLK_OUT = AQC_CLK;
    assign VCSELEN_OUT = VCSELEN_IN;
    assign TDC_STOP_CLK = AQC_CLK_OUT;

    genvar i;
    generate for (i = 0; i < 8; i = i + 1) begin: spad_row_gen
    DigitalCore_SPADRow SPADRow(
        .CLK(AQC_CLK),
        .CATHODE(CATHODE),
        .SPAD_EN(SPAD_EN[(i+1)*8-1:i*8]),
        .DET(RowOut[i]),
        .VRST(VRST)
    );
    end endgenerate



endmodule
