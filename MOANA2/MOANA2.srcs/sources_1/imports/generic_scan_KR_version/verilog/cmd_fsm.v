`timescale 1ns / 1ps

// Command FSM is in charge of using the header from OK USB interface to direct 
// all other things on the FPGA. It also manages who gets to talk to the shared
// buffer

module cmd_fsm(
        // global signals
        clk, 
        rst,
        
        // Interface to the pipe buffer
        ok2core_header,
        data_valid,
        data_free,
        data_return,
        
        // Interface to the scan fsm
        scan_fsm_cmd,
        scan_fsm_cmd_cell_length,
        scan_fsm_cmd_cell_address,
        scan_fsm_cmd_cell_total,
        scan_fsm_cmd_row,
        scan_fsm_cmd_valid,
        scan_fsm_cmd_ready,

        // Current state of the command FSM (for debugging)
        state
    );

    //------------------------------------------------------------------------
    // Parameters
    //------------------------------------------------------------------------    
    parameter HeaderSize                = 64;
    
    parameter LengthBits                = 18;                   // Number of bits used to specify the length of the cell
    parameter CellBits                  = 8;                    // Number of bits of the number of cells
    parameter ScanRows                  = 16;                   // Total number of cell rows that this can control
    parameter ScanRowBits               = 4;                    // Number of bits within CellBits used for the cell row
    
    parameter PDMBits                   = 10;
    //------------------------------------------------------------------------    

    //------------------------------------------------------------------------
    //  Constants
    //------------------------------------------------------------------------
    localparam CmdBits                  = 16;
    localparam StateBits                = 8;
    
    // Commands
    localparam Cmd_ReadCell             = 16'h000c;                 // Define a "scan read command" from the PC
    localparam Cmd_WriteCell            = 16'h0004;                 // Define write command to certain cell

    // State Encodings
    localparam State_Idle               = 8'h00;                    // Waiting for command
    localparam State_ScanOut            = 8'h01;                    // Scan out the scanchain
    localparam State_ScanIn             = 8'h02;                    // Scan in the scanchain
    
    localparam State_ReturnData         = 8'h04;                    // There is data in the data buffer to return through the pipe
    localparam State_FreeData           = 8'h05;                    // Free the data in the data buffer
    
    localparam State_WaitSendData       = 8'h06;                    // Wait for a pending thing to complete, then send to OK
    localparam State_Wait               = 8'h07;                    // Wait for a pending thing to complete
    localparam State_Error              = 8'hFF;                    // Reaches this state if it gets an unknown command
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    // I/O
    //------------------------------------------------------------------------
    // global signals
    input wire                          clk;                        // input reference clock, should be the same as that used in pipe interface
    input wire                          rst;                        // global reset signal

    // Interface to the core
    input wire  [HeaderSize-1:0]        ok2core_header;
    input wire                          data_valid;
    output wire                         data_free;
    output wire                         data_return;

    // Interface to the scan fsm
    output wire                         scan_fsm_cmd;
    output wire  [LengthBits-1:0]       scan_fsm_cmd_cell_length;
    output wire  [CellBits-1:0]         scan_fsm_cmd_cell_address;
    output wire  [CellBits-1:0]         scan_fsm_cmd_cell_total;
    output wire  [ScanRowBits-1:0]      scan_fsm_cmd_row;
    output wire                         scan_fsm_cmd_valid;
    input wire                          scan_fsm_cmd_ready;

    // Current state of the command FSM
    output reg  [StateBits-1:0]         state;
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    //  Signals
    //------------------------------------------------------------------------
    wire        [CmdBits-1:0]           cmd;
    reg         [StateBits-1:0]         next_state;
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    //  Assigns
    //------------------------------------------------------------------------
    // Opal kelly interface
    assign cmd =                                ok2core_header[CmdBits-1:0];
    assign data_free =                          (state == State_FreeData);
    assign data_return =                        (state == State_ReturnData);

    // Scan FSM command interface                
    assign scan_fsm_cmd_valid =                 (state == State_ScanIn) || (state == State_ScanOut);
    assign {    scan_fsm_cmd_row,
                scan_fsm_cmd_cell_total,
                scan_fsm_cmd_cell_address,
                scan_fsm_cmd_cell_length }  =   ok2core_header[HeaderSize-1:CmdBits];
    assign scan_fsm_cmd =                       (state == State_ScanIn) ? 1'b1 : 1'b0;
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    // Command FSM
    //------------------------------------------------------------------------
    always @(posedge clk) begin
        if (rst) state <= State_Idle;
        else state <= next_state;
    end
    
    always @( * ) begin
        next_state = state;     //by default stay in the current state
        case (state)
            // Read the command from OK in the idle state
            State_Idle: begin
                if (data_valid) begin
                    case(cmd)
                        Cmd_ReadCell: next_state = State_ScanOut;
                        Cmd_WriteCell: next_state = State_ScanIn;
                        default: next_state = State_Error;
                    endcase
                end
            end

            // Scan in from shared buffer
            State_ScanIn: if (scan_fsm_cmd_ready & scan_fsm_cmd_valid) next_state = State_Wait;
            // Scan out into shared buffer
            State_ScanOut: if (scan_fsm_cmd_ready & scan_fsm_cmd_valid) next_state = State_WaitSendData;
            // Signal to pipe interface that buffer has return data
            State_ReturnData: next_state = State_FreeData;            
            // Signal to pipe interface that buffer has return data
            State_FreeData: next_state = State_Idle;            

            // Various waiting states
            State_WaitSendData: if (scan_fsm_cmd_ready) next_state = State_ReturnData;
            // Wait until things are done
            State_Wait: if (scan_fsm_cmd_ready) next_state = State_FreeData;
        endcase
    end
    //------------------------------------------------------------------------

endmodule

