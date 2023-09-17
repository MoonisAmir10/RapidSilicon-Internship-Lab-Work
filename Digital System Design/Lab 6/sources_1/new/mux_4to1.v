`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 10:28:38 AM
// Design Name: 
// Module Name: mux_4to1
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


module mux_4to1(
input w0, w1, w2, w3, s0, s1,
output reg f
);

wire t0, t1, t2, t3;

assign t0 = w0 & (~s0) & (~s1);
assign t1 = w1 & (s0) & (~s1);
assign t2 = w2 & (~s0) & (s1);
assign t3 = w3 & s0 & s1;

always@(*)
begin
 f = t0 | t1 | t2 | t3;
end
endmodule
