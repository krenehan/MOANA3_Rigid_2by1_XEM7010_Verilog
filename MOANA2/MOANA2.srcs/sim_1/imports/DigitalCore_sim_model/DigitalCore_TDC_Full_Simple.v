`timescale 1ns/1ps

`define DelayTime 0.025
`define PassGateDelayTime 0.035
`define BufferDelayTime 0.200

module DigitalCore_DelayCell_Simple(SW, SWB, RSTN, RSTP, RSTNB, RSTPB, IN, INB, OUT, OUTB, DC_OUT, DC_OUTB);
   
    parameter real DelayTime =            `DelayTime;
    parameter real PassGateDelayTime =    `PassGateDelayTime;    
    parameter real BufferDelayTime =      `BufferDelayTime;

    input wire IN, INB;
    input wire SW, SWB, RSTN, RSTP, RSTNB, RSTPB;
    output wire OUT, OUTB;
    output wire DC_OUT, DC_OUTB;
    wire rst_state;
    reg rst_reg;

    wire enable;
    wire INT_OUT, INT_OUTB;
    reg INT_OUT_reg, INT_OUTB_reg;
    //initial rst_state = ((RSTN & ~RSTP) & (RSTPB & ~RSTNB)) ? 1'b0 : 1'b1 ;

    always @(posedge RSTN or posedge RSTP) begin	
	if (RSTN) begin 
		rst_reg <= 1'b0;
		INT_OUT_reg <= 1'b0;
		end	
		else begin 
		rst_reg <= 1'b1;
		INT_OUT_reg <= 1'b1;
		end
	end

    //assign rst_state = (RSTN & ~RSTNB) ? 1'b0 : 1'b1 ;

    //assign rst_state = rst_reg;

    assign enable = SW & ~SWB;

    //initial INT_OUT_reg  = (RSTN) ? 1'b0 : 1'b1;
    //initial INT_OUTB_reg = (RSTN) ? 1'b1 : 1'b0;

    always @(negedge SW) begin
	INT_OUT_reg <= INT_OUT;
    end

    assign #(DelayTime) INT_OUT  = (SW) ? (~INB) : ((RSTN | RSTP) ?    rst_reg: INT_OUT_reg) ;
    assign #(DelayTime) INT_OUTB = (SW) ? (~IN)  : ((RSTN | RSTP) ? (~rst_reg): ~INT_OUT_reg);

    assign #(BufferDelayTime) DC_OUT  = INT_OUT;
    assign #(BufferDelayTime) DC_OUTB = INT_OUTB;

    assign #(PassGateDelayTime) OUT  = INT_OUT;
    assign #(PassGateDelayTime) OUTB = INT_OUTB;


endmodule

module DigitalCore_TDC_Full_Simple(SW, SWB, RSTD, RSTB, TIEL, TIEH, DC_BOOST, NBIAS, DC_OUT, VDD, VSS);

    inout wire NBIAS, VSS, VDD;
    input wire SW, SWB, RSTD, RSTB, TIEL, TIEH, DC_BOOST;
    output wire [7:0] DC_OUT;

    wire [7:0] out; 

    DigitalCore_DelayCell_Simple	D0	(SW, SWB, RSTD, TIEL, RSTB, TIEH, out[6], out[7], out[0], out[1], DC_OUT[0], DC_OUT[1]);
    
    DigitalCore_DelayCell_Simple	D1	(SW, SWB, TIEL, RSTD, TIEH,RSTB, out[1], out[0], out[2], out[3], DC_OUT[2], DC_OUT[3]);

    DigitalCore_DelayCell_Simple	D2	(SW, SWB, RSTD, TIEL, RSTB, TIEH, out[3], out[2], out[4], out[5], DC_OUT[4], DC_OUT[5]);

    DigitalCore_DelayCell_Simple	D3	(SW, SWB, TIEL, RSTD, TIEH,RSTB, out[5], out[4], out[6], out[7], DC_OUT[6], DC_OUT[7]);


   // assign HeaterP = 1'b1;
   // assign HeaterN = (En) ? 1'b0 : 1'bz;

endmodule
