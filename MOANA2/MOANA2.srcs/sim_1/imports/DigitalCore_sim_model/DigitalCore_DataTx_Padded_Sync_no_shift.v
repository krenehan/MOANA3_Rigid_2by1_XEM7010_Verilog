
// time scale
`timescale 1ns/1ps

// no undeclared nets
//`default_nettype none

module DigitalCore_DataTx_Padded_Sync(
        
	RstAsync,

	Load,
	LoadClkIn,
	TxReadRequest,

	DataIn,
	TestDataIn,
	TestPattEnable,

    ReadClkIn,
	DataOut,	
	LoadComplete, 
	
	test_pattern
    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    
    parameter DataInWidth = 250;
    parameter SyncStages = 3;
    parameter OVERRIDE_DATAOUT = "False";

    localparam CntWidth = $clog2(DataInWidth);
    localparam DummyBits = CntWidth-1;
    localparam TestDataReps = DataInWidth/10; // Number of replications of TestDataIn to make DataInWidth

    //-----------------------------------------------------------------------------------
    //  Ports
    //-----------------------------------------------------------------------------------
    input wire								        RstAsync;
    input wire 								        Load;
    input wire								        LoadClkIn;
    input wire 								        TxReadRequest;
    input wire		[DataInWidth-1:0]				DataIn;			// DataIn (640b)
    input wire								        TestPattEnable;		
    input wire		[9:0]	    					TestDataIn;		// TestDataIn (10b)

    input wire                                      ReadClkIn;
    output reg  							        DataOut;
    
    output wire                                     LoadComplete;
    input wire		[DataInWidth-1:0]				test_pattern;

    //-----------------------------------------------------------------------------------
    //  Internal Wires
    //-----------------------------------------------------------------------------------
    reg                                             LoadReg;

    wire                                            LoadFlopIn;
    wire                                            CaptureData;

    reg		        [DataInWidth-1:0]               DataReg;
    reg		        [CntWidth-1:0]				    ReadCnt;
    reg							                    DataLoaded;	
    reg                                             DataLoadedPulse;
    reg						 	                    PadSent;	// Sending a 1 indicates start of frame
    wire	        [DataInWidth-1:0]			    TxData;
    reg             [SyncStages-1:0]                SyncLoadReg;
    
    wire                                            LoadCompleteFlopIn;
    reg                                             LoadCompleteReg;
    reg             [SyncStages-1:0]                SyncLoadCompleteReg;
    
	wire                                            ReadClkInGatedEnable;
	wire                                            ReadClkInGated;
	wire                                            CaptureDataDelayed;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Gen Variables
    //-----------------------------------------------------------------------------------
    genvar                                  i;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Assigns
    //-----------------------------------------------------------------------------------
    if (OVERRIDE_DATAOUT == "False") begin
		assign  TxData  = TestPattEnable ? {TestDataReps{TestDataIn}} : DataIn;
	end else if (OVERRIDE_DATAOUT == "True") begin
		assign TxData = TestPattEnable ? test_pattern : DataIn;
	end else begin
		assign TxData = 1'bx;
	end
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Input mux and flop for load signal
    //-----------------------------------------------------------------------------------
    assign LoadFlopIn = Load ? ~LoadReg : LoadReg;

	always @(posedge LoadClkIn or posedge RstAsync) begin
        if (RstAsync) LoadReg <= 0;
        else LoadReg <= LoadFlopIn;
    end
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Synchronizer stages for load signal @ ReadClkIn
    //-----------------------------------------------------------------------------------
    always @(posedge ReadClkIn or posedge RstAsync) begin
        if (RstAsync) SyncLoadReg[0] <= 0;
        else SyncLoadReg[0] <= LoadReg;
    end

	generate for (i = 1; i < SyncStages; i = i + 1) begin: syncload_stages_gen
        always @(posedge ReadClkIn or posedge RstAsync) begin
            if (RstAsync) SyncLoadReg[i] <= 0;
            else SyncLoadReg[i] <= SyncLoadReg[i-1];
        end
    end endgenerate

    assign CaptureData = SyncLoadReg[SyncStages-1] ^ SyncLoadReg[SyncStages-2];
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //  Delay CaptureData to negative edge of clock signal to prepare clock for DataReg Flops
    //-----------------------------------------------------------------------------------
    DigitalCore_ClkCycleDelay_negedge #(.Width(1), .DelayCycles(1)) CaptureDataDelay (.rst(RstAsync), .clk(ReadClkIn), .in(CaptureData), .out(CaptureDataDelayed));
    
    //-----------------------------------------------------------------------------------
	//        Muxes at input to shift register
    //-----------------------------------------------------------------------------------

	// These are not needed if we can absolutely ensure that data is absolutely stable when the Load signal is synchronized
	// In our case, we're holding the AccumulatorBank output stable until we're sure that it has crossed clock domains
	// Previously, even though we weren't waiting for this signal, we had a register bank that would collect all the AccumulatorBank data and hold it steady until the load signal had propagated and the data could be captured. 
	//wire [DataInWidth-1:0] ShiftRegIn;
	//generate for (i = 0; i < DataInWidth; i = i + 1) begin : gen_shift_reg_in_mux
	//    assign  ShiftRegIn[i] = CaptureData ? TxData[i] : ShiftReg[i];
	//end endgenerate
    

    //-----------------------------------------------------------------------------------
    //    Read counter, control logic, and output data operation
    //-----------------------------------------------------------------------------------
	always @(posedge ReadClkIn or posedge RstAsync) begin
		if (RstAsync) begin
			DataOut  <= 1'b0;
			ReadCnt <= 0;
			DataLoaded  <= 1'b0;
			DataLoadedPulse <= 1'b0;
			PadSent <= 1'b0;
		end else if (CaptureDataDelayed) begin
	    	ReadCnt <= 0;
	    	DataOut  <= 1'b0;
			DataLoaded <= 1'b1;
			DataLoadedPulse <= 1'b1;
    		PadSent <= 1'b0;
		end else if (DataLoaded & TxReadRequest) begin
			if (~PadSent) begin
			    DataLoadedPulse <= 1'b0;
				DataOut <= 1'b1;
				PadSent <= 1'b1;
			end else if (ReadCnt < DataInWidth) begin
			    DataOut <= DataReg[ReadCnt];
				ReadCnt <= ReadCnt + 1;
			end else begin
				DataLoaded <= 1'b0;
				DataOut  <= 1'b0;
				ReadCnt <= 0;
				PadSent <= 1'b0;
			end
		end
	end
    
    //-----------------------------------------------------------------------------------
    //    DataReg operation - Gated clock, load data then turn off 
    //-----------------------------------------------------------------------------------
	always @(posedge ReadClkInGated or posedge RstAsync) begin
		if (RstAsync) begin
			DataReg <= 0;
		end else if (CaptureDataDelayed) begin
			DataReg <= TxData;
		end else begin
		    DataReg <= DataReg;
		end
	end
	
	// Clock gating
	assign ReadClkInGatedEnable = CaptureData & ~DataLoaded;
	DigitalCore_ClockGate DataRegGate (.clk(ReadClkIn), .en(ReadClkInGatedEnable), .gated_clk(ReadClkInGated));
    
    //-----------------------------------------------------------------------------------
    //  Input mux and flop for LoadComplete signal
    //-----------------------------------------------------------------------------------
    assign LoadCompleteFlopIn = DataLoadedPulse ? ~LoadCompleteReg : LoadCompleteReg;

	always @(posedge ReadClkIn or posedge RstAsync) begin
        if (RstAsync) LoadCompleteReg <= 0;
        else LoadCompleteReg <= LoadCompleteFlopIn;
    end
    //-----------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------
    //  Synchronizer stages for LoadComplete signal @ LoadClkIn
    //-----------------------------------------------------------------------------------
    always @(posedge LoadClkIn or posedge RstAsync) begin
        if (RstAsync) SyncLoadCompleteReg[0] <= 0;
        else SyncLoadCompleteReg[0] <= LoadCompleteReg;
    end

	generate for (i = 1; i < SyncStages; i = i + 1) begin: syncdataloaded_stages_gen
        always @(posedge LoadClkIn or posedge RstAsync) begin
            if (RstAsync) SyncLoadCompleteReg[i] <= 0;
            else SyncLoadCompleteReg[i] <= SyncLoadCompleteReg[i-1];
        end
    end endgenerate

    assign LoadComplete = SyncLoadCompleteReg[SyncStages-1] ^ SyncLoadCompleteReg[SyncStages-2];


endmodule

