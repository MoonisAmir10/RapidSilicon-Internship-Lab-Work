`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2023 10:33:20 AM
// Design Name: 
// Module Name: adder_32_bit
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


module adder_32_bit(
input [31:0] inpA,
input [31:0] inpB,
output reg [31:0] res
);

always@(*)
  res = inpA + inpB;

endmodule
