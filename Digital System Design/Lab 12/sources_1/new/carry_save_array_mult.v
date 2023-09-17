`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 10:21:29 AM
// Design Name: 
// Module Name: carry_save_array_mult
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


module carry_save_array_mult(
input [3:0] A,
input [3:0] B,
output [7:0] product
);

wire p_00 = A[0] & B[0];
wire p_01 = A[0] & B[1];
wire p_02 = A[0] & B[2];
wire p_03 = A[0] & B[3];

wire p_10 = A[1] & B[0];
wire p_11 = A[1] & B[1];
wire p_12 = A[1] & B[2];
wire p_13 = A[1] & B[3];

wire p_20 = A[2] & B[0];
wire p_21 = A[2] & B[1];
wire p_22 = A[2] & B[2];
wire p_23 = A[2] & B[3];

wire p_30 = A[3] & B[0];
wire p_31 = A[3] & B[1];
wire p_32 = A[3] & B[2];
wire p_33 = A[3] & B[3];

wire [3:0] s0,s1;
wire [3:0] c0, c1;
 


endmodule
