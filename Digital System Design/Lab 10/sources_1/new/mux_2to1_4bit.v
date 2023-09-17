`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 09:47:16 AM
// Design Name: 
// Module Name: mux_2_to_1
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


module mux_2to1_4bit(
input [3:0] a, [3:0] b, 
input sel,
output reg [3:0] f
);

always @(*)
begin
  case(sel)
    1'b0: f = a;
    1'b1: f = b;
  endcase  
end
endmodule
