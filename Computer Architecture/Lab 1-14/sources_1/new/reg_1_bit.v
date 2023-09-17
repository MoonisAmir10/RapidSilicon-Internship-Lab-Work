`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2023 11:48:19 AM
// Design Name: 
// Module Name: reg_1_bit
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


module reg_1_bit (reset, clk, D, Q);
input reset;
input clk;
 // Allow N to be changed
input D;
output Q;
reg Q;

always @(posedge clk or negedge reset)
if (~reset)
  Q = 0; 
else
  Q = D;
endmodule // regN
