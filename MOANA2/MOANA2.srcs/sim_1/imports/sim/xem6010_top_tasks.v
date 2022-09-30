task fpga_logic_reset;
	begin
		$display("TIME %0t: INFO: resetting FPGA logic", $time);
		SetWireInValue(ADDR_WIREIN_MSGCTRL, MSGCTRL_RST, NO_MASK);
		UpdateWireIns;
		SetWireInValue(ADDR_WIREIN_MSGCTRL, MSGCTRL_FIFO_RST, NO_MASK);
		UpdateWireIns;
		SetWireInValue(ADDR_WIREIN_MSGCTRL, NONE, NO_MASK);
		UpdateWireIns;
		$display("TIME %0t: INFO: done resetting FPGA logic", $time);
	end
endtask


task cell_reset;
	begin
		// Send WireIn reset signal
		$display("TIME %0t: INFO: resetting chips", $time);
		SetWireInValue(ADDR_WIREIN_SIGNAL, SIGNAL_CELL_RST, NO_MASK);
		UpdateWireIns;
		SetWireInValue(ADDR_WIREIN_SIGNAL, NONE, NO_MASK);
		UpdateWireIns;
		$display("TIME %0t: INFO: done resetting chips", $time);
	end
endtask

task scan_reset;
	begin
		// Send WireIn scan reset signal
		$display("TIME %0t: INFO: resetting scan chains", $time);
		SetWireInValue(ADDR_WIREIN_SIGNAL, SIGNAL_SCAN_RST, NO_MASK);
		UpdateWireIns;
		SetWireInValue(ADDR_WIREIN_SIGNAL, NONE, NO_MASK);
		UpdateWireIns;
		$display("TIME %0t: INFO: done resetting scan chains", $time);
	end
endtask

task reset_mmcm;
	begin
		$display("TIME %0t: INFO: resetting MMCM", $time);
		tiehi_power_signal(SIGNAL_MMCM_RST);
		UpdateWireIns;
		tielo_power_signal(SIGNAL_MMCM_RST);
		UpdateWireIns;
		$display("TIME %0t: INFO: done resetting MMCM", $time);
	end
endtask

task start_mmcm;
	begin
		$display("TIME %0t: INFO: enabling MMCM", $time);
		tiehi_power_signal(SIGNAL_REF_CLK_MMCM_ENABLE);
		UpdateWireIns;
		$display("TIME %0t: INFO: done enabling MMCM", $time);
	end
endtask
	

task send_frame_data;
	begin
		$display("TIME %0t: INFO: sending frame data to FrameController", $time);
		
		// Set number of frames
		SetWireInValue(ADDR_WIREIN_FRAME, NUMBER_OF_FRAMES, NO_MASK);
		$display("TIME %0t: INFO: number of frames is %d", $time, NUMBER_OF_FRAMES);
		
		// Set patterns per frame
		SetWireInValue(ADDR_WIREIN_PATTERN, PATTERNS_PER_FRAME, NO_MASK);
		$display("TIME %0t: INFO: patterns per frame is %d", $time, PATTERNS_PER_FRAME);
		
		// Set measurements per pattern
		SetWireInValue(ADDR_WIREIN_MEASUREMENT_LSB, measurements_per_pattern_lsb, NO_MASK);
		SetWireInValue(ADDR_WIREIN_MEASUREMENT_MSB, measurements_per_pattern_msb, NO_MASK);
		$display("TIME %0t: INFO: measurements per pattern is %d", $time, MEASUREMENTS_PER_PATTERN);
		
		// Set packets in transfer
		SetWireInValue(ADDR_WIREIN_PACKETS_IN_TRANSFER, PACKETS_IN_TRANSFER, NO_MASK);
		$display("TIME %0t: INFO: packets in transfer is %d", $time, PACKETS_IN_TRANSFER);
		
		// Set pad captured mask
		SetWireInValue(ADDR_WIREIN_PAD_CAPTURED_MASK, PAD_CAPTURED_MASK, NO_MASK);
		$display("TIME %0t: INFO: pad captured mask is %b", $time, PAD_CAPTURED_MASK);
		
		// Update wire ins
		UpdateWireIns;
		
		$display("TIME %0t: INFO: done sending frame data to FrameController", $time);
	end
endtask

task send_data_stream_config;
	begin
		$display("TIME %0t: INFO: sending stream data to FrameController", $time);
		
		// Set words per transfer
		SetWireInValue(ADDR_WIREIN_STREAM, MASTER_PIPE_WORDS_PER_TRANSFER[15:0], NO_MASK);
		$display("TIME %0t: INFO: words per transfer is %d", $time, MASTER_PIPE_WORDS_PER_TRANSFER);
		
		// Update wire ins
		UpdateWireIns;
		
		$display("TIME %0t: INFO: done sending stream data to FrameController", $time);
	end
endtask

task tiehi_fc_signal;
	input [15:0] signal;
	begin
		frame_controller_wire_in_register = frame_controller_wire_in_register | signal;
		SetWireInValue(ADDR_WIREIN_FRAMECTRL, frame_controller_wire_in_register, NO_MASK);
		UpdateWireIns;
	end
endtask

task tielo_fc_signal;
	input [15:0] signal;
	begin
		frame_controller_wire_in_register = frame_controller_wire_in_register & (~signal);
		SetWireInValue(ADDR_WIREIN_FRAMECTRL, frame_controller_wire_in_register, NO_MASK);
		UpdateWireIns;
	end
endtask

task tiehi_power_signal;
	input [15:0] signal;
	begin
		power_wire_in_register = power_wire_in_register | signal;
		SetWireInValue(ADDR_WIREIN_POWER, power_wire_in_register, NO_MASK);
		UpdateWireIns;
	end
endtask

task tielo_power_signal;
	input [15:0] signal;
	begin
		power_wire_in_register = power_wire_in_register & (~signal);
		SetWireInValue(ADDR_WIREIN_POWER, power_wire_in_register, NO_MASK);
		UpdateWireIns;
	end
endtask

task check_capture_idle;
	begin
		UpdateWireOuts;
		frame_controller_wire_out_register = GetWireOutValue(ADDR_WIREOUT_SIGNAL);
		$display("TIME %0t: INFO: capture idle: %d", $time, ~(frame_controller_wire_out_register & SIGNAL_CAPTURE_IDLE));
	end
endtask

task check_transfer_ready;
	begin
		$display("TIME %0t: INFO: checking transfer ready", $time);
		UpdateWireOuts;
		ram_read_wire_out_register = GetWireOutValue(ADDR_WIREOUT_RAM_READ);
		if ((ram_read_wire_out_register & SIGNAL_TRANSFER_READY) === 1) begin
			$display("TIME %0t: INFO: transfer ready signal detected", $time);
			transfer_ready = 1'b1;
		end else begin
			transfer_ready = 1'b0;
		end		
	end
endtask

task force_histogram;
	begin
		// Assert force_dataout
		$display("TIME %0t: INFO: forcing histogram streamout from DigitalCore", $time);
		@(posedge refclk);
		force_dataout <= 1'b1;
		@(posedge refclk);
		force_dataout <= 1'b0;
		$display("TIME %0t: INFO: waiting for streamout to complete", $time);
		repeat (3010) @(posedge tx_refclk);
	end
endtask

task init_capture;
	begin
		$display("TIME %0t: INFO: starting capture", $time);
		
		// Set scan done
		$display("TIME %0t: INFO: setting scan done", $time);
		tiehi_fc_signal(SIGNAL_SCAN_DONE);
		UpdateWireIns;
		
		// Set frame data sent
		$display("TIME %0t: INFO: setting frame data sent", $time);
		tiehi_fc_signal(SIGNAL_FRAME_DATA_SENT);
		UpdateWireIns;
		
		// Check frame data received
		$display("TIME %0t: INFO: checking for frame data received", $time);
		UpdateWireOuts;
		frame_controller_wire_out_register = GetWireOutValue(ADDR_WIREOUT_SIGNAL);
		
		// Wait for frame data received to be asserted
		while (!(frame_controller_wire_out_register[6] === 1'b1)) begin
			$display("TIME %0t: INFO: waiting for frame data received", $time);
			UpdateWireOuts;
			frame_controller_wire_out_register = GetWireOutValue(ADDR_WIREOUT_SIGNAL);
			#(`TIME_OK_WAIT);
		end
		$display("TIME %0t: INFO: received frame data received", $time);
		
		// Unset frame data sent
		$display("TIME %0t: INFO: unsetting frame data sent", $time);
		tielo_fc_signal(SIGNAL_FRAME_DATA_SENT);
		
		// Unset capture start
		$display("TIME %0t: INFO: setting capture start", $time);
		tiehi_fc_signal(SIGNAL_CAPTURE_START);
	end
endtask
		

task run_capture;
	begin
	
		// Initialize capture
		init_capture;
		
		// Check for capture done
		$display("TIME %0t: INFO: checking for capture done", $time);
		UpdateWireOuts;
		frame_controller_wire_out_register = GetWireOutValue(ADDR_WIREOUT_SIGNAL);
		
		// Wait for capture done to be asserted
		while (!( frame_controller_wire_out_register[8] === 1'b1 )) begin
			$display("TIME %0t: INFO: waiting for capture done", $time);
			UpdateWireOuts;
			frame_controller_wire_out_register = GetWireOutValue(ADDR_WIREOUT_SIGNAL);
			#(`TIME_OK_WAIT);
		end
		$display("TIME %0t: INFO: received capture done", $time);
		
		// Unset capture start
		$display("TIME %0t: INFO: unsetting capture start", $time);
		tielo_fc_signal(SIGNAL_CAPTURE_START);
		
		// Unset frame data sent
		$display("TIME %0t: INFO: unsetting frame data sent", $time);
		tielo_fc_signal(SIGNAL_FRAME_DATA_SENT);
		
		// Unset scan done
		$display("TIME %0t: INFO: unsetting scan done", $time);
		tielo_fc_signal(SIGNAL_SCAN_DONE);		
		
		// Capture complete
		$display("TIME %0t: INFO: capture complete", $time);
	end
endtask

task read_master_fifo_data;
	begin
		$display("TIME %0t: INFO: reading from pipe out", $time);
		ReadFromPipeOut(ADDR_PIPEOUT_FIFO_MASTER, pipeOutSize);
		$display("TIME %0t: INFO: done reading from pipe out", $time);
	end
endtask

// Print pipeOut values
task print_pipeOut_flat;
	input [15:0] capture_number;
	integer chip, frame, pattern, bin;
	integer chip_offset, frame_offset, pattern_offset, bin_offset, offset, raw_data_offset;
	integer unshuffled;
	integer padding, packet_1, packet_2;
	integer correct_packet_value;
	integer failed;
	begin
	
		// Keep track of failures
		failed = 0;
		
		// Loop through each frame
		for (frame=0;frame<NUMBER_OF_FRAMES;frame=frame+1) begin
			
			// Calculate the offset for the frame in the chip's packet
			frame_offset = frame * NUMBER_OF_CHIPS * PATTERNS_PER_FRAME * 150 * 32;
			
			// Loop through each pattern
			for (pattern=0;pattern<PATTERNS_PER_FRAME;pattern=pattern+1) begin
			
			// Calculate the offset for the pattern in the frame packet
			pattern_offset = pattern * NUMBER_OF_CHIPS * 150 * 32;
	
				// Loop through each chip
				for (chip=0;chip<NUMBER_OF_CHIPS;chip=chip+1) begin
			
					// Calculate the offset for the chip in the flat pipeout packet
					chip_offset = chip * 150 * 32;
				
					// Loop through each bin
					for (bin=0;bin<150;bin=bin+1) begin
					
						// Calculate the offset for the bin in the pattern packet
						bin_offset = bin * 32;
						raw_data_offset = bin * 20;
						
						// Calculate total offset for the value of the bin
						offset = chip_offset + frame_offset + pattern_offset + bin_offset;
						
						// Find the correct value for the test pattern
						correct_packet_value = test_pattern[chip][raw_data_offset +: 20];
						$display("TIME %0t: VERIFY DATA: Capture %2d: Chip %2d: Frame %2d: Pattern %2d: Bin %2d: %0b", $time, capture_number, chip, frame, pattern, bin, correct_packet_value[19:0]);
						
						// Unshuffle data out packet
						unshuffled = { pipeOut_flat[offset +: 16], pipeOut_flat[offset + 16 +: 16] };
						
						// Get test packets
						packet_1 = unshuffled[0 +: 20];
						padding = unshuffled[20 +: 12];
												
						// Figure out if it's correct
						if ((padding == 0) && (packet_1 == correct_packet_value)) begin
							$display("TIME %0t: DATA: Capture %2d: Chip %2d: Frame %2d: Pattern %2d: Bin %2d: %12b_%20b: CORRECT", $time, capture_number, chip, frame, pattern, bin, padding, packet_1);
						end else begin
							$display("TIME %0t: DATA: Capture %2d: Chip %2d: Frame %2d: Pattern %2d: Bin %3d: %12b_%20b: INCORRECT", $time, capture_number, chip, frame, pattern, bin, padding, packet_1);
							failed = failed + 1;
						end
						
					end
				end
			end
		end
		
		// Print the number of failures
		if (failed == 0) begin
			$display("TIME %0t: INFO: data out matches expected", $time);
		end else begin
			$display("TIME %0t: INFO: data out does not match what was expected", $time);
			$display("TIME %0t: INFO: %0d non-matching packets were found", $time, failed);
			$finish;
		end
		
	end
endtask
