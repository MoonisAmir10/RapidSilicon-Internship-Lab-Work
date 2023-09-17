`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2023 10:05:44 AM
// Design Name: 
// Module Name: n_bit_register
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


module n_bit_register (reset, clk, D, Q);
input reset;
input clk;
parameter N = 8; // Allow N to be changed
input [N-1:0] D;
output [N-1:0] Q;
reg [N-1:0] Q;

always @(posedge clk or negedge reset)
if (~reset)
  Q = 0; 
else
  Q = D;
endmodule // regN
