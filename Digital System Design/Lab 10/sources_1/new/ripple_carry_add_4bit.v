`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 09:22:24 AM
// Design Name: 
// Module Name: ripple_carry_add_4bit
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


module ripple_carry_add_4bit(
input [3:0] a, [3:0] b,
input cin,
output [3:0] sum,
output cout
);

wire c1, c2, c3;

full_adder a1(a[0], b[0], cin, sum[0], c1);
full_adder a2(a[1], b[1], c1, sum[1], c2);
full_adder a3(a[2], b[2], c2, sum[2], c3);
full_adder a4(a[3], b[3], c3, sum[3], cout);

endmodule
