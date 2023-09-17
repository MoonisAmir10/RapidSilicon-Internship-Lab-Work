`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2023 11:07:40 PM
// Design Name: 
// Module Name: counter_with_conditional_branch
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


module counter_with_conditional_branch(
input clk,
input reset,
input condition,
input [3:0] branch_addr,
output reg [3:0] pc
);

//PC register
always@(posedge clk, negedge reset)
if (!reset) //active low reset
  pc <= 0;
else
  pc <= pc + 4'b0001;
  
always@(condition)
begin
  if (condition == 1'b1)
    pc = branch_addr;
  else
   pc = pc;
end

endmodule
