`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 10:39:28 AM
// Design Name: 
// Module Name: mux_16to1
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


module mux_16to1(
input w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, s0, s1, s2, s3,
output f
);

wire c0, c1, c2, c3;

mux_4to1 m1(w0, w1, w2, w3, s0, s1, c0);
mux_4to1 m2(w4, w5, w6, w7, s0, s1, c1);
mux_4to1 m3(w8, w9, w10, w11, s0, s1, c2);
mux_4to1 m4(w12, w13, w14, w15, s0, s1, c3);
mux_4to1 m5(c0, c1, c2, c3, s2, s3, f);

endmodule
