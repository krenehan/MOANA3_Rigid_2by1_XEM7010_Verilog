
module DigitalCore_AQC(ANODE, EN, DET, VRST);
    
    inout wire ANODE;
    inout wire VRST;
    input wire EN;
    output reg DET;	
    
    always @(posedge ANODE) begin
	  if (EN) DET <= 1'b1; 
		else DET <= 1'b0;
	end

   // assign HeaterP = 1'b1;
   // assign HeaterN = (En) ? 1'b0 : 1'bz;


endmodule
