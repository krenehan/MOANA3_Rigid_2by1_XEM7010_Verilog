`timescale 1ns/1ps
// ============================================================================
// An interface to set wr_en based on signals from the FIFO
// ============================================================================
module MasterPipeController(
		rst,
		tx_clk,
		pipeO_master_read,
		pipeO_master_data,
		word_count,
        fifo_data_appended, 
        fifo_read,
        
        chip_counter_onehot, transfer_complete, transfer_reset, chip_transfer_complete, chip_counter, read_address, fifo_data_appended_padded, logic_reset, 
        counter_count, counter_cap
    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    parameter   NumberOfChips =     2;
    parameter   OKWidth =           16;
    parameter   ChipCounterWidth =  5; // Larger than $clog2(NumberOfChips)
    localparam ChipCounterDummyBits = ChipCounterWidth - 1;

    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    I/O
    //-----------------------------------------------------------------------------------
	input   wire 						                rst;
    input   wire                                        tx_clk;
    input   wire                                        pipeO_master_read;
	output  wire		[OKWidth-1:0]                   pipeO_master_data;
	input   wire		[OKWidth-1:0]                   word_count;
	input   wire        [NumberOfChips*OKWidth-1:0]     fifo_data_appended;
    output  wire        [NumberOfChips-1:0]             fifo_read;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Signals
    //-----------------------------------------------------------------------------------
//    output reg                                              read_asserted;
    output wire                                             transfer_complete;
    output reg                                              transfer_reset;
    output wire                                             logic_reset;
    output wire                                             chip_transfer_complete;
    output reg         [ChipCounterWidth-1:0]               chip_counter;
    output wire         [NumberOfChips-1:0]               chip_counter_onehot;
    output wire        [8:0]                                read_address;
	 reg						[8:0]											read_address_delayed;
    output wire        [(NumberOfChips+1)*OKWidth-1:0]      fifo_data_appended_padded;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Assigns
    //-----------------------------------------------------------------------------------
    assign fifo_data_appended_padded[NumberOfChips*OKWidth +: OKWidth ] = {OKWidth{1'b0}};
    assign fifo_data_appended_padded[0 +: NumberOfChips*OKWidth ] = fifo_data_appended;
    assign logic_reset = transfer_reset;
    
	 // The read address is a 1
    assign read_address = chip_counter*OKWidth;
    assign pipeO_master_data = fifo_data_appended_padded[ read_address_delayed +: OKWidth ];
	 
	 // Transfer is complete when the chip counter reaches its max value and the last chip transfer completes
    assign transfer_complete = (chip_counter == NumberOfChips-1) & chip_transfer_complete;
	
	// Onehot chip counter signal for targeting a specific fifo with the fifo_read signal
	assign chip_counter_onehot =  { {ChipCounterDummyBits{1'b0}},{1'b1} } << chip_counter ;
	
	// Onehot counter determines which chip is receiving the read signal
	// pipeO_master_read is a global read control signal that masks fifo_read in situations where a read is not happening
   assign fifo_read = chip_counter_onehot[NumberOfChips-1:0] & { NumberOfChips{pipeO_master_read} };


    //-----------------------------------------------------------------------------------
    //  Byte counter for keeping track of data transfer
    //-----------------------------------------------------------------------------------
    output wire [OKWidth-1:0] counter_cap;
    output wire [OKWidth-1:0] counter_count;
    assign counter_cap = word_count - {{OKWidth-1{1'b0}}, 1'b1};
	 assign chip_transfer_complete = counter_count == (word_count - {{OKWidth-1{1'b0}}, 1'b1});
    capped_sync_counter     #   (
                                    .Width              (OKWidth))
        word_counter            (
                                    .reset              (rst | logic_reset),
                                    .clk                (tx_clk),
                                    .enable             (pipeO_master_read),
                                    .cap                (counter_cap),
                                    .count              (counter_count),
                                    .alert              ()
                                );
	

    //-----------------------------------------------------------------------------------
    //  Flop to delay the read address signal
	 //  In order for data to be timed correctly, the read address much change a cycle before the dataout mux changes
	 //  Delaying the read address going to the dataout mux accomplishes this
    //-----------------------------------------------------------------------------------
	 always @(posedge tx_clk or posedge rst) begin
		if (rst) begin
			read_address_delayed <= 0;
		end else begin
			read_address_delayed <= read_address;
		end
	end
                                
                                
    //-----------------------------------------------------------------------------------
    //  Chip counter for keeping track of data transfer
    //-----------------------------------------------------------------------------------
    always @(posedge tx_clk or posedge rst) begin
        if (rst) begin
            chip_counter <= {ChipCounterWidth{1'b0}};
        end else if (logic_reset) begin
            chip_counter <= {ChipCounterWidth{1'b0}};
        end else if (chip_transfer_complete) begin
            chip_counter <= chip_counter + { {ChipCounterDummyBits{1'b0}}, 1'b1 };
        end
    end
    
    
    //-----------------------------------------------------------------------------------
    //  Reset block
    //-----------------------------------------------------------------------------------
    always @(posedge tx_clk or posedge rst) begin
        if (rst) begin
            transfer_reset <= 1'b0;
        end else if (transfer_complete) begin
            transfer_reset <= 1'b1;
        end else if (transfer_reset) begin
            transfer_reset <= 1'b0;
        end
    end
    
                          
endmodule
