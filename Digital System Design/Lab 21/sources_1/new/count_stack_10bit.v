`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2023 10:57:35 AM
// Design Name: 
// Module Name: count_stack_10bit
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


module basic_stack_10bit(
input [9:0] inp_pc,
input wr_1, wr_2, wr_3, wr_4,
output reg [9:0] stack_1, stack_2, stack_3, stack_4
);

always@(*)
begin
  if (wr_1 == 1'b1)
    stack_1 = inp_pc;
  if (wr_2 == 1'b1)
    stack_2 = inp_pc;
  if (wr_3 == 1'b1)
    stack_3 = inp_pc; 
  if (wr_4 == 1'b1)
    stack_4 = inp_pc;
end
endmodule
