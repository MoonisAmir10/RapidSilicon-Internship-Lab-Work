`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 12:17:53 PM
// Design Name: 
// Module Name: SIPO
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


module SIPO(
input data_in, clk, clr,
output reg [7:0] q
);

reg [7:0] temp;

always @(posedge clk)
begin
  if (clr)
    q = 8'b00000000;
  else
    begin
      temp = q >> 1;
      q = {data_in, temp[6:0]};
    end  
end
endmodule
