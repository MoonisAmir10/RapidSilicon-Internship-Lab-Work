`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 04:16:58 PM
// Design Name: 
// Module Name: array_multiplier
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


module array_multiplier(
input [3:0] A,
input [3:0] B,
output [7:0] product
);

//For B0
wire [3:0] inp0_0, inp0_1;
wire [3:0] inp1_0, inp1_1, inp2_0, inp2_1;

wire [3:0] S0;
wire [3:0] S1;
wire [3:0] S2;

wire c0, c1, c2;

assign inp0_0 = {1'b0, (B[0] & A[3]), (B[0] & A[2]), (B[0] & A[1])};  
assign inp0_1 = {(B[1] & A[3]), (B[1] & A[2]), (B[1] & A[1]), (B[1] & A[0])};

assign inp1_0 = {c0, S0[3], S0[2], S0[1]};
assign inp1_1 = {(B[2] & A[3]), (B[2] & A[2]), (B[2] & A[1]), (B[2] & A[0])};

assign inp2_0 = {c1, S1[3], S1[2], S1[1]};
assign inp2_1 = {(B[3] & A[3]), (B[3] & A[2]), (B[3] & A[1]), (B[3] & A[0])};

ripple_carry_add_4bit rca1(inp0_0, inp0_1, 1'b0, S0, c0);
ripple_carry_add_4bit rca2(inp1_0, inp1_1, 1'b0, S1, c1);
ripple_carry_add_4bit rca3(inp2_0, inp2_1, 1'b0, S2, c2);

assign product[0] = A[0] & B[0];
assign product[1] = S0[0];
assign product[2] = S1[0];
assign product[3] = S2[0];
assign product[4] = S2[1];
assign product[5] = S2[2];
assign product[6] = S2[3];
assign product[7] = c2;

endmodule
