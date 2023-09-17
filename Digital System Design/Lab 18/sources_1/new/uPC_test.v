`timescale 1ns / 1ps

// Define the inputs and outputs of the module
module micro_pc_controller(
    input clk, reset, // clock and reset signals
    input [7:0] instr, // instruction word from data path
    input cond0, cond1, // conditional flags from data path
    output [7:0] mpc, // microprogram counter output
    output [7:0] mpm_addr // microprogram memory address input
);

// Define the parameters for the design
parameter ROM_SIZE = 256; // size of microprogram memory
parameter STACK_SIZE = 4; // size of subroutine return address memory
parameter WORD_SIZE = 8; // size of instruction word

// Declare the internal registers and wires
reg [WORD_SIZE-1:0] mpc_reg; // microprogram counter register
reg [WORD_SIZE-1:0] sram[0:STACK_SIZE-1]; // subroutine return address memory (stack)
reg [1:0] sp; // stack pointer register
wire [WORD_SIZE-1:0] mpm_data; // microprogram memory data output
wire [WORD_SIZE-1:0] branch_addr; // branch address from instruction word
wire parity; // parity bit from instruction word
wire load; // load signal for conditional multiplexer

reg [7:0] rom [15:0];

// Instantiate the microprogram memory (ROM) with some initial values
// The values are arbitrary and do not reflect any specific functionality
initial begin
    rom[0] = 8'h00;
    rom[1] = 8'h01;
    rom[2] = 8'h02;
    rom[3] = 8'h03;
    rom[4] = 8'h04;
    rom[5] = 8'h05;
    rom[6] = 8'h06;
    rom[7] = 8'h07;
    rom[8] = 8'h08;
    rom[9] = 8'h09;
    rom[10] = 8'h0A;
    rom[11] = 8'h0B;
    rom[12] = 8'h0C;
    rom[13] = 8'h0D;
    rom[14] = 8'h0E;
    rom[15] = 8'h0F;
end

// Define the microprogram memory (ROM) as a combinational logic block
assign mpm_data = rom[mpm_addr];

// Extract the branch address and the parity bit from the instruction word
assign branch_addr = instr[WORD_SIZE-3:0];
assign parity = instr[WORD_SIZE-1];

// Define the load signal for the conditional multiplexer as a combinational logic block
// The load signal is true if the parity bit matches the result of XORing cond0 and cond1
assign load = parity == (cond0 ^ cond1);

// Define the sequential logic for updating the microprogram counter register
always @(posedge clk) begin
    if (reset) begin // reset the register to zero on reset signal
        mpc_reg <= 0;
    end else begin // update the register based on the load signal and the stack pointer
        if (load) begin // load the branch address from the instruction word
            mpc_reg <= branch_addr;
        end else begin // increment the register or load from the stack
            case (mpc_reg)
                8'hFF: begin // special case for subroutine call instruction
                    sram[sp] <= mpc_reg + 1; // push the return address to the stack
                    sp <= sp + 1; // increment the stack pointer
                    mpc_reg <= branch_addr; // load the branch address from the instruction word
                end
                8'hFE: begin // special case for subroutine return instruction
                    sp <= sp - 1; // decrement the stack pointer
                    mpc_reg <= sram[sp]; // pop the return address from the stack
                end 
                default: begin // normal case for incrementing the register
                    mpc_reg <= mpc_reg + 1;
                end 
            endcase 
        end 
    end 
end 

// Assign the outputs of the module to the internal registers and wires
assign mpc = mpc_reg;
assign mpm_addr = mpc_reg;

endmodule 

