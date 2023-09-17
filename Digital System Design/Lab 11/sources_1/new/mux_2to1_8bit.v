`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 11:20:50 AM
// Design Name: 
// Module Name: mux_2to1_8bit
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


module mux_2to1_8bit(
input [7:0] a, [7:0]  b, 
input sel,
output reg [7:0] f
);

always @(*)
begin
  case(sel)
    1'b0: f = a;
    1'b1: f = b;
  endcase  
end
endmodule
