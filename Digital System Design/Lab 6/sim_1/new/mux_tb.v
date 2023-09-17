`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 10:47:11 AM
// Design Name: 
// Module Name: mux_tb
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


module mux_tb();
reg w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, s0, s1, s2, s3;
wire f;

mux_16to1 mt(w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, s0, s1, s2, s3, f);

initial
begin
 #10 w0 = 0; w1 = 1; w2 = 1; w3 = 1; w0 = 0; w1 = 1; w2 = 1; w3 = 1; w0 = 0; w1 = 1; w2 = 1; w3 = 1; w0 = 0; w1 = 1; w2 = 1; w3 = 1;
end
endmodule
