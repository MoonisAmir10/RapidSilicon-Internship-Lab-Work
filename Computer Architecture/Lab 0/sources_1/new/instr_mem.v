`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2023 11:10:56 PM
// Design Name: 
// Module Name: instr_mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instr_mem(
input [3:0] addr,
output reg [7:0] instr
);

reg [7:0] mem [15:0]; //16 locations, each of 8-bits

//programming the instructions of Fibonacci sequence
initial
begin
  mem[0] = 8'b00001000;  // load zero to A
  mem[1] = 8'b00011001;  // load 1 to B
  mem[2] = 8'b00100000;  // push A to output
  mem[3] = 8'b00010000;  // Add A to B
  mem[4] = 8'b01110000;  // If A+B produces carry, then jump to start
  mem[5] = 8'b00000000;  // Swap A and B
  mem[6] = 8'b00010100;  // Swap A and B
  mem[7] = 8'b00000100;  // Swap A and B
  mem[8] = 8'b10110010;  // jump to 3rd instruction
end

always @(*)
  instr = mem[addr];

endmodule

