`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2023 08:43:20 PM
// Design Name: 
// Module Name: loadable_counter
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


module loadable_counter(
input clk,
input reset,
output reg [3:0] pc
);

always@(posedge clk, negedge reset)
if (!reset) //active low reset
  pc <= 0;
else
  pc <= pc + 4'b0001;

endmodule
