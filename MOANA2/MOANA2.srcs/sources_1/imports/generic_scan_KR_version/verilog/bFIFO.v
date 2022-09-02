// parameterized FIFO module 
// 
// this is fifo module that has small delay 
// 
//////////////////////////////////////////// 
// not verified yet... 
//////////////////////////////////////////// 
`define bFIFODefine

module bFIFO(CLK, RN, DATAIN,INREADY, INFULL, DATAOUT, OUTREADY, OUTFULL);

parameter integer WIDTH=204;
parameter integer LENGTH=16;	// limited by 16 bit max 

input [WIDTH-1:0] DATAIN;
input INREADY; 
output INFULL; 
output [WIDTH-1:0] DATAOUT;
output OUTREADY; 
input OUTFULL; 
input CLK, RN; 

reg [15:0] head; 
reg [15:0] tail; 
wire [15:0] nexttail, nexthead; 
reg full; 

reg [WIDTH-1:0] rf [0:LENGTH-1]; 	// register files 
assign INFULL=full;	
assign OUTREADY=(full|(head != tail));	
assign DATAOUT=rf[head]; 
assign nexttail = (tail==LENGTH-1)? 0:(tail+1);
assign nexthead = (head==LENGTH-1)? 0:(head+1);

always @(posedge CLK) // or negedge RN) // or negedge RN)
begin
	if (RN) begin 	// not reset
		if ((OUTREADY) && (~(OUTFULL))) begin	// dequeue condition	(output ready)
			if ((INREADY) && (~(INFULL))) begin	// enqueue and dequeue at the same time
				tail<=nexttail;
				rf[tail]<=DATAIN;				// enqueue
				head<=nexthead; 				// dequeue
			end else begin					// dequeue only 
				head<=nexthead; 
				full<=0;
			end
		end else if ((INREADY) && (~(INFULL))) begin	// enque only condition 
			rf[tail]<=DATAIN;					// enque
			tail<=nexttail;					// enque
			if (head==nexttail) begin	// full condition
				full<=1; 
			end
		end		
	end else begin	// reset
		head<=0;
		tail<=0; 
		full<=0; 	// tell that the fifo is not full 
	end 
end 

endmodule 