`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 11:45:18 AM
// Design Name: 
// Module Name: time_shared_32bit_adder
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


module time_shared_32bit_adder(
input [31:0] A, 
input [31:0] B,
input clk, clr,
output [31:0] sum, 
output cout
);

wire [7:0] inp_A;
wire [7:0] inp_B;
wire carry_in = 0;
wire carry_out = 0;
wire null;
wire [7:0] current_sum;

reg cs = 0;

integer i = 0;

mux_4to1_8bit m1(A[7:0], A[15:8], A[23:16], A[31:24], i, inp_A);
mux_4to1_8bit m2(B[7:0], B[15:8], B[23:16], B[31:24], i, inp_B);

conditional_sum_adder csa1(inp_A, inp_B, cs, current_sum, carry_out);

DFF d1(carry_out, clk, clr, carry_in, null);

demux_1to4_8bit dm1(current_sum, i, sum[7:0], sum[15:8], sum[23:16], sum[31:24]);

always @(posedge clk)
begin
  if (i == 3)
    i <= 0;
  else
    i <= i + 1;
end

always @(posedge clk)
begin
  cs <= carry_in;
end

assign cout = carry_out;

endmodule

