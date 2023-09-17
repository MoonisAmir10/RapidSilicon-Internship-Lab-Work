`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2023 09:54:58 AM
// Design Name: 
// Module Name: comparator
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


module comparator(
input [31:0] inpA,
input [31:0] inpB,
output reg res
);

always@(*)
begin
  if (inpA == inpB)
   res = 1'b1;
  else
   res = 1'b0;
end
endmodule
