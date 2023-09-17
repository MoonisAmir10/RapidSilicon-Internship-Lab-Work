`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 11:54:29 AM
// Design Name: 
// Module Name: demux_1to4_8bit
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


module demux_1to4_8bit(
input [7:0] inp,
input [1:0] sel,
output reg [7:0] a, 
output reg [7:0] b,
output reg [7:0] c, 
output reg [7:0] d
);

always @(*)
begin
  case (sel)
  2'b00: a = inp;
  2'b01: b = inp;
  2'b10: c = inp;
  2'b11: d = inp;
  endcase
end
endmodule
