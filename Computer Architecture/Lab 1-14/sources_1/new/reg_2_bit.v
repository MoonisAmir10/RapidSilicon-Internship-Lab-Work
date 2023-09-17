`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2023 02:44:54 PM
// Design Name: 
// Module Name: reg_2_bit
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


module reg_2_bit (reset, clk, D, Q);
input reset;
input clk;
parameter N = 2; // Allow N to be changed
input [N-1:0] D;
output [N-1:0] Q;
reg [N-1:0] Q;

always @(posedge clk or negedge reset)
if (~reset)
  Q = 0; 
else
  Q = D;
endmodule // regN
