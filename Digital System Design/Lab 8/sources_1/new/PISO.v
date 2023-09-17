`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 12:48:25 PM
// Design Name: 
// Module Name: PISO
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


module PISO(
input [7:0] data_in,
input sel, clk, clr,
output reg v
);

reg [7:0] q = 8'b00000000;

always @(posedge clk)
begin
  if (clr)
    q <= 8'b00000000;
  else if (!sel)
    q <= data_in;
  else
    begin
      v <= q[7];
      q <= q << 1;
    end
end
endmodule
