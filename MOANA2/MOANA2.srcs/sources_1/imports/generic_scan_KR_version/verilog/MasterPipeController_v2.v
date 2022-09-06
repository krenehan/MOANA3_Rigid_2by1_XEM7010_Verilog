`timescale 1ns/1ps
// ============================================================================
// MasterPipeController_v2 is a modified version of MasterPipeController. 
// Just as it did before, v2 of MasterPipeController effectively acts as a dataout multiplexer.
// v2 changes the width of the inputs and outputs to support a flexible data width.
// v2 also adds the ability to halt the dataout process if read is asserted but data is not available in the FIFO.
// ============================================================================
module MasterPipeController_v2(
		rst,
		tx_clk,
		pipeO_master_read,
		pipeO_master_data,
		word_count,
        fifo_data_appended, 
        fifo_read,
        prev_fifos_empty,
        prev_fifos_empty_mask,
        
        chip_counter_onehot, transfer_complete, transfer_reset, chip_transfer_complete, chip_counter, read_address, fifo_data_appended_padded, 
        counter_count, counter_cap
    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    parameter   NUMBER_OF_CHIPS =     		2;
    parameter	DATA_WIDTH = 				32;
    parameter   OKWIDTH =           		16;
    parameter   CHIP_COUNTER_WIDTH =  		5; // Larger than $clog2(NUMBER_OF_CHIPS)
    localparam 	CHIP_COUNTER_DUMMY_BITS = 	CHIP_COUNTER_WIDTH - 1;

    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    I/O
    //-----------------------------------------------------------------------------------
	input   wire 						                	rst;
    input   wire                                        	tx_clk;
    input   wire                                        	pipeO_master_read;
	output  wire		[DATA_WIDTH-1:0]                   	pipeO_master_data;
	input   wire		[OKWIDTH-1:0]                   	word_count;
	input   wire        [NUMBER_OF_CHIPS*DATA_WIDTH-1:0]    fifo_data_appended;
    output  wire        [NUMBER_OF_CHIPS-1:0]             	fifo_read;
    input 	wire		[NUMBER_OF_CHIPS-1:0]				prev_fifos_empty;
    input 	wire		[OKWIDTH-1:0]						prev_fifos_empty_mask;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Signals
    //-----------------------------------------------------------------------------------
    wire                                             			transfer_complete;
    reg                                              			transfer_reset;
    wire                                             			chip_transfer_complete;
    reg         		[CHIP_COUNTER_WIDTH-1:0]             	chip_counter;
    wire         		[NUMBER_OF_CHIPS-1:0]               	chip_counter_onehot;
    wire        		[8:0]                                	read_address;
	reg					[8:0]									read_address_delayed;
    wire        		[(NUMBER_OF_CHIPS+1)*DATA_WIDTH-1:0]    fifo_data_appended_padded;
    wire														chip_data_ready;
    wire														read_active;
    wire 				[OKWIDTH-1:0] counter_cap;
    wire 				[OKWIDTH-1:0] counter_count;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Assigns
    //-----------------------------------------------------------------------------------
    
    // Pad fifo_data_appended with 0s, just to ensure that the address is always valid after incrementing past NUMBER_OF_CHIPS*DATAWIDTH
    assign fifo_data_appended_padded[NUMBER_OF_CHIPS*DATA_WIDTH +: DATA_WIDTH ] = {DATA_WIDTH{1'b0}};
    assign fifo_data_appended_padded[0 +: NUMBER_OF_CHIPS*DATA_WIDTH ] = fifo_data_appended;
    
	 // The read address points to the LSB of a specific chip's data in fifo_data_appended_padded
    assign read_address = chip_counter*DATA_WIDTH;
    
    // pipeO_master_data is the selected data at the output of the module
    assign pipeO_master_data = fifo_data_appended_padded[ read_address_delayed +: DATA_WIDTH ];
	 
	 // Transfer is complete when the chip counter reaches its max value and the last chip transfer completes
    assign transfer_complete = (chip_counter == NUMBER_OF_CHIPS-1) & chip_transfer_complete;
	
	// Onehot chip counter signal for targeting a specific fifo with the fifo_read signal
	assign chip_counter_onehot =  { {CHIP_COUNTER_DUMMY_BITS{1'b0}},{1'b1} } << chip_counter ;
   
   // For a given chip, chip_data_ready goes high under the following conditions:
   // FIFO for the chip that's supposed to provide data is not empty
   // OR
   // chip is non-functional, so FIFO is empty but we ignore this so that dataout continues
   assign chip_data_ready = chip_counter_onehot & (prev_fifos_empty & prev_fifos_empty_mask);
   
	// FIFO read is asserted under the following conditions:
	// Chip data is ready to be read
	// AND
	// pipeO_master_read is being asserted at the top level
   assign fifo_read = chip_data_ready & { NUMBER_OF_CHIPS{pipeO_master_read} };
   
   // Read active indicates that a read is happening successfully from a FIFO
   // Read active is asserted under the following conditions:
   // Any one or more bits in fifo_read goes high
   // AND
   // Transfer reset is not currently asserted
   assign read_active = |fifo_read && ~transfer_reset;


    //-----------------------------------------------------------------------------------
    //  Byte counter for keeping track of data transfer
    //-----------------------------------------------------------------------------------
    assign counter_cap = word_count - {{OKWIDTH-1{1'b0}}, 1'b1};
	 assign chip_transfer_complete = counter_count == (word_count - {{OKWIDTH-1{1'b0}}, 1'b1});
    capped_sync_counter     #   (
                                    .Width              (OKWIDTH))
        word_counter            (
                                    .reset              (rst | transfer_reset),
                                    .clk                (tx_clk),
                                    .enable             (read_active),
                                    .cap                (counter_cap),
                                    .count              (counter_count),
                                    .alert              ()
                                );
	

    //-----------------------------------------------------------------------------------
    //  Flop to delay the read address signal
	 //  In order for data to be timed correctly, the read address must change a cycle before the dataout mux changes
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
            chip_counter <= {CHIP_COUNTER_WIDTH{1'b0}};
        end else if (transfer_reset) begin
            chip_counter <= {CHIP_COUNTER_WIDTH{1'b0}};
        end else if (chip_transfer_complete) begin
            chip_counter <= chip_counter + { {CHIP_COUNTER_DUMMY_BITS{1'b0}}, 1'b1 };
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
