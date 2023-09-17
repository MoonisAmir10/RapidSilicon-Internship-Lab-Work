`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 11:18:41 AM
// Design Name: 
// Module Name: conditional_sum_adder
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


module conditional_sum_adder(
input [7:0] a, [7:0] b,
input cin,
output [7:0] sum,
output cout
);

wire cout_1, cout_2;
wire [7:0] s1;
wire [7:0] s2;

adder_8bit a1(a, b, 0, s1, cout_1);
adder_8bit a2(a, b, 1, s2, cout_2);

mux_2to1_8bit m1(s1, s2, cin, sum);
mux_2_to_1 m2(cout_1, cout_2, cin, cout);

endmodule
