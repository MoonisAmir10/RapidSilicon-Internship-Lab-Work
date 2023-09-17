`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 11:51:44 AM
// Design Name: 
// Module Name: mux_4to1_8bit
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


module mux_4to1_8bit(
input [7:0] a, [7:0]  b, [7:0] c, [7:0] d, 
input [1:0] sel,
output reg [7:0] f
);

always @(*)
begin
  case(sel)
    2'b00: f = a;
    2'b01: f = b;
    2'b10: f = c;
    2'b11: f = d;
  endcase  
end
endmodule
