`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 10:20:18 AM
// Design Name: 
// Module Name: adder_5bit
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


module adder_5bit(
input [4:0] a, [4:0] b,
input cin,
output [4:0] sum,
output cout
);

wire c1, c2, c3, c4;

full_adder a1(a[0], b[0], cin, sum[0], c1);
full_adder a2(a[1], b[1], c1, sum[1], c2);
full_adder a3(a[2], b[2], c2, sum[2], c3);
full_adder a4(a[3], b[3], c3, sum[3], c4);
full_adder a5(a[4], b[4], c4, sum[4], cout);

endmodule
