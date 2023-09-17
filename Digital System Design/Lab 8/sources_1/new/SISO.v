`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 11:57:48 AM
// Design Name: 
// Module Name: SISO
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


module SISO(
input data_in, clk, clr,
output data_out
);

reg [7:0] q = 8'b00000000;

always@(posedge clk)
begin
  if (clr)
    q <= 8'b00000000;
  else
    begin
      q <= q << 1;
      q[0] <= data_in;
    end  
end

assign data_out = q[7];
endmodule
