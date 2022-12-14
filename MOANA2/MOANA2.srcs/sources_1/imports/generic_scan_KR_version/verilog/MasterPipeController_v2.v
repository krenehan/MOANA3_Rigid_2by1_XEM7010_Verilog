`timescale 1ns/1ps
// ============================================================================
// MasterPipeController_v2 is a modified version of MasterPipeController. 
// Just as it did before, v2 of MasterPipeController effectively acts as a dataout multiplexer.
// v2 changes the width of the inputs and outputs to support a flexible data width.
// v1 was designed to support continous streamout from all FIFOs with no break in dataout. The assumption was that all data in output FIFOs was ready and pipe endpoint expected data every cycle.
// v2 no longer supports continuous dataout, because data is no longer all ready at one time and the data throughput must be able to handle segmentation.
// ============================================================================
module MasterPipeController_v2
#	(
		parameter 	NUMBER_OF_CHIPS = 		2,
		parameter 	DATA_WIDTH = 			32,
		parameter 	OKWIDTH = 				16,
		parameter 	CHIP_COUNTER_WIDTH = 	5 // Larger than $clog2(NUMBER_OF_CHIPS)
	)
	(
		input 	wire 									rst,
		input 	wire 									clk,
		input 	wire 									master_pipe_read,
		output 	wire [DATA_WIDTH-1:0] 					master_pipe_data,
		input 	wire [OKWIDTH-1:0] 						word_count,
        input 	wire [NUMBER_OF_CHIPS*DATA_WIDTH-1:0] 	fifo_data_appended, 
        output 	wire [NUMBER_OF_CHIPS-1:0] 				fifo_read,
        input 	wire [NUMBER_OF_CHIPS-1:0] 				prev_fifos_empty,
        input 	wire [NUMBER_OF_CHIPS-1:0] 				prev_fifos_empty_mask,
        output 	reg 									valid
        
    );

    //-----------------------------------------------------------------------------------
    //  Parameters
    //-----------------------------------------------------------------------------------
    localparam 	CHIP_COUNTER_DUMMY_BITS = 	CHIP_COUNTER_WIDTH - 1;

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
    wire				[NUMBER_OF_CHIPS-1:0]					prev_fifos_empty_mask_int;
    //-----------------------------------------------------------------------------------

    //-----------------------------------------------------------------------------------
    //  Assigns
    //-----------------------------------------------------------------------------------
    
	// Pad fifo_data_appended with 0s, just to ensure that the address is always valid after incrementing past NUMBER_OF_CHIPS*DATAWIDTH
	assign fifo_data_appended_padded[NUMBER_OF_CHIPS*DATA_WIDTH +: DATA_WIDTH ] = {DATA_WIDTH{1'b0}};
	assign fifo_data_appended_padded[0 +: NUMBER_OF_CHIPS*DATA_WIDTH ] = fifo_data_appended;
	
	// These assignments help deal with the fact that at startup, the inputs from the OK interface are going to be 0s
	// Counter cap is initialized to 1s to avoid the possibility of chip_transfer_complete being asserted at startup and erroneously incrementing the chip_counter
	// prev_fifos_empty_mask_int is initialized to 1s to avoid the possibility of fifo_read being asserted at startup and erroneously incrementing the word counter
	assign counter_cap = !(|word_count) ? {OKWIDTH{1'b1}} : word_count;
	assign prev_fifos_empty_mask_int = !(|prev_fifos_empty_mask) ? {NUMBER_OF_CHIPS{1'b1}} : prev_fifos_empty_mask;
	
	// The read address points to the LSB of a specific chip's data in fifo_data_appended_padded
	assign read_address = chip_counter*DATA_WIDTH;
	
	// master_pipe_data is the selected data at the output of the module
	assign master_pipe_data = fifo_data_appended_padded[ read_address +: DATA_WIDTH ];
	
	// Onehot chip counter signal for targeting a specific fifo with the fifo_read signal
	assign chip_counter_onehot =  { {CHIP_COUNTER_DUMMY_BITS{1'b0}},{1'b1} } << chip_counter ;
   
	// For a given chip, chip_data_available goes high under the following conditions:
	// FIFO for the chip that's supposed to provide data is not empty
	// OR
	// chip is non-functional, so FIFO is empty but we ignore this so that dataout continues
	assign chip_data_available = chip_counter_onehot & ~(prev_fifos_empty & prev_fifos_empty_mask_int);
   
	// Read continues as long as the chip transfer has not completed and data is available from the chip FIFO of interest
	assign ready_for_read = chip_data_available & ~chip_transfer_complete_bus;
	
	// FIFO read is asserted under the following conditions:
	// Chip data is ready to be read
	// AND
	// master_pipe_read is being asserted at the top level
	assign fifo_read = ready_for_read & { NUMBER_OF_CHIPS{master_pipe_read} };
	
	// Read active indicates that a read is happening successfully from a FIFO
	// Read active is asserted under the following conditions:
	// Any one or more bits in fifo_read goes high
	assign read_active = |fifo_read;


    //-----------------------------------------------------------------------------------
    //  Word counter for keeping track of data transfer
    //  Word counter will count a certain number of transfers and then return to 0
    // 	This value is flexible and is set at runtime
    //-----------------------------------------------------------------------------------
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
                 
                                
    //-----------------------------------------------------------------------------------
    //  This block handles the case where we've reached the word counter has reached the maximum value. 
    // 	At this point, the transfer for the chip is complete and we're ready to increment the chip counter.
    // 	Operation is as follows:
    //	Cycle 1) chip_transfer_complete asserted by word counter
    //	Cycle 2) increment_chip_counter asserted
    // 	Cycle 3) Value of chip counter incremented; force_increment asserted, increment_chip_counter deasserted. 
    // 	Cycle 4) Value of word counter incremented past cap value, so it returns to 0; force_increment deasserted. 
    //-----------------------------------------------------------------------------------
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
	// 	The valid signal is just a delayed version of the read_active signal. 
	//	The assumption is that all FIFO reads yield valid data.
	//-----------------------------------------------------------------------------------
	 always @(posedge clk or posedge rst) begin
		if (rst) begin
			valid <= 0;
		end else begin
			valid <= read_active;
		end
	end
    
    
                          
endmodule
