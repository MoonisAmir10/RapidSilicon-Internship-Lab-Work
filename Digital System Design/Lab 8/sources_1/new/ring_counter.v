`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 02:20:12 PM
// Design Name: 
// Module Name: ring_counter
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


module ring_counter(
input clk, reset,
output [7:0] count_out
);

reg [7:0] count_temp;

always @(posedge clk, reset)
begin
  if (reset)
    count_temp = 8'b00000001;
  else if(clk)
    count_temp = { count_temp[6:0], count_temp[7]};   
end

assign count_out = count_temp;

endmodule
