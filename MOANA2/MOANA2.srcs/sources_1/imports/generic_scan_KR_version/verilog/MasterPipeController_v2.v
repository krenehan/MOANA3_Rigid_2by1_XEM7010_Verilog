`timescale 1ns/1ps
// ============================================================================
// MasterPipeController_v2 is a modified version of MasterPipeController. 
// Just as it did before, v2 of MasterPipeController effectively acts as a dataout multiplexer.
// v2 changes the width of the inputs and outputs to support a flexible data width.
// v2 also adds the ability to halt the dataout process if read is asserted but data is not available in the FIFO.
// v1 was designed to support continous streamout from all FIFOs with no break in dataout. The assumption was that all data in output FIFOs was ready and pipe endpoint expected data every cycle.
// v2 no longer supports continuous dataout, because data is no longer all ready at one time and the data throughput must be able to handle segmentation.
// ============================================================================
module MasterPipeController_v2(
		rst,
		clk,
		pipeO_master_read,
		pipeO_master_data,
		word_count,
        fifo_data_appended, 
        fifo_read,
        prev_fifos_empty,
        prev_fifos_empty_mask,
        valid
        
    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    parameter   NUMBER_OF_CHIPS =     		2;
    parameter	DATA_WIDTH = 				32;
    parameter   OKWIDTH =           		16;
    parameter   CHIP_COUNTER_WIDTH =  		5; // Larger than $clog2(NUMBER_OF_CHIPS)
    localparam 	CHIP_COUNTER_DUMMY_BITS = 	CHIP_COUNTER_WIDTH - 1;
    localparam	NUMBER_OF_CHIPS_FIXED_WIDTH = 5'd1; // Width of CHIP_COUNTER_WIDTH and value NUMBER_OF_CHIPS-1

    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //    I/O
    //-----------------------------------------------------------------------------------
	input   wire 						                	rst;
    input   wire                                        	clk;
    input   wire                                        	pipeO_master_read;
	output  wire		[DATA_WIDTH-1:0]                   	pipeO_master_data;
	input   wire		[OKWIDTH-1:0]                   	word_count;
	input   wire        [NUMBER_OF_CHIPS*DATA_WIDTH-1:0]    fifo_data_appended;
    output  wire        [NUMBER_OF_CHIPS-1:0]             	fifo_read;
    input 	wire		[NUMBER_OF_CHIPS-1:0]				prev_fifos_empty;
    input 	wire		[NUMBER_OF_CHIPS-1:0]				prev_fifos_empty_mask;
    output 	reg												valid;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Signals
    //-----------------------------------------------------------------------------------
    wire                                             			transfer_complete;
    wire                                             			chip_transfer_complete;
    wire				[NUMBER_OF_CHIPS-1:0]					chip_transfer_complete_bus;
    reg															chip_transfer_complete_previous;
    wire														chip_transfer_complete_pulse;
    wire         		[CHIP_COUNTER_WIDTH-1:0]             	chip_counter;
    wire         		[NUMBER_OF_CHIPS-1:0]               	chip_counter_onehot;
    wire        		[8:0]                                	read_address;
	reg					[8:0]									read_address_delayed;
    wire        		[(NUMBER_OF_CHIPS+1)*DATA_WIDTH-1:0]    fifo_data_appended_padded;
    wire				[NUMBER_OF_CHIPS-1:0]					chip_data_available;
    wire				[NUMBER_OF_CHIPS-1:0]					ready_for_read;
    wire														read_active;
    reg															force_increment;
    reg															increment_chip_counter;
    wire 				[OKWIDTH-1:0] 							counter_cap;
    wire 				[OKWIDTH-1:0] 							counter_count;
    wire				[CHIP_COUNTER_WIDTH-1:0]				chip_counter_cap = NUMBER_OF_CHIPS-1;
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
    assign pipeO_master_data = fifo_data_appended_padded[ read_address +: DATA_WIDTH ];
	
	// Onehot chip counter signal for targeting a specific fifo with the fifo_read signal
	assign chip_counter_onehot =  { {CHIP_COUNTER_DUMMY_BITS{1'b0}},{1'b1} } << chip_counter ;
   
   // For a given chip, chip_data_available goes high under the following conditions:
   // FIFO for the chip that's supposed to provide data is not empty
   // OR
   // chip is non-functional, so FIFO is empty but we ignore this so that dataout continues
   assign chip_data_available = chip_counter_onehot & ~(prev_fifos_empty & prev_fifos_empty_mask);
   
   // Read continues as long as the chip transfer has not completed and data is available from the chip FIFO of interest
   assign ready_for_read = chip_data_available & ~chip_transfer_complete_bus;
   
	// FIFO read is asserted under the following conditions:
	// Chip data is ready to be read
	// AND
	// pipeO_master_read is being asserted at the top level
   assign fifo_read = ready_for_read & { NUMBER_OF_CHIPS{pipeO_master_read} };
   
   // Read active indicates that a read is happening successfully from a FIFO
   // Read active is asserted under the following conditions:
   // Any one or more bits in fifo_read goes high
   assign read_active = |fifo_read;


    //-----------------------------------------------------------------------------------
    //  Word counter for keeping track of data transfer
    //  Word counter will count a certain number of transfers and then return to 0
    // 	This value is flexible and is set at runtime
    //-----------------------------------------------------------------------------------
    assign counter_cap = word_count;
    capped_sync_counter     #   (
                                    .Width              (OKWIDTH))
        word_counter            (
                                    .reset              (rst),
                                    .clk                (clk),
                                    .enable             (read_active | force_increment),
                                    .cap                (counter_cap),
                                    .count              (counter_count),
                                    .alert              (chip_transfer_complete)
                                );
                                
    assign chip_transfer_complete_bus = { NUMBER_OF_CHIPS{chip_transfer_complete} };
                 
                                
	// This block handles the case where 
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			force_increment <= 1'b0;
			increment_chip_counter <= 1'b0;
		end else if (force_increment) begin
			force_increment <= 1'b0;
		end else if (increment_chip_counter) begin
			force_increment <= 1'b1;
			increment_chip_counter <= 1'b0;
		end else if (chip_transfer_complete) begin
			increment_chip_counter <= 1'b1;
		end 
	end
	
	
    //-----------------------------------------------------------------------------------
    //  Chip counter for keeping track of data transfer
    //-----------------------------------------------------------------------------------
    capped_sync_counter     #   (
                                    .Width              (CHIP_COUNTER_WIDTH))
        u_chip_counter            (
                                    .reset              (rst),
                                    .clk                (clk),
                                    .enable             (increment_chip_counter),
                                    .cap                (chip_counter_cap),
                                    .count              (chip_counter),
                                    .alert              ()
                                );
	
	
	//-----------------------------------------------------------------------------------
	//  Valid signal flop
	// 	Just a delayed version of read_active
	//-----------------------------------------------------------------------------------
	 always @(posedge clk or posedge rst) begin
		if (rst) begin
			valid <= 0;
		end else begin
			valid <= read_active;
		end
	end
                                
                                

                                
    
    
    
                          
endmodule
