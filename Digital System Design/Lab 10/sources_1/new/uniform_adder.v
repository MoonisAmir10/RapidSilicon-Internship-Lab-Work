`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 09:11:29 AM
// Design Name: 
// Module Name: uniform_adder
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


module uniform_adder(
input [11:0] a, [11:0] b, cin,
output [11:0] sum, cout
);

wire [11:0] s1;
wire [11:0] s2;
wire c0_1, c0_2, c0_3;
wire c1_1, c1_2, c1_3;
wire cout_1, cout_2;

//when cin = 0
ripple_carry_add_4bit rc1(a[3:0], b[3:0], 0, s1[3:0], c0_1);
ripple_carry_add_4bit rc2(a[7:4], b[7:4], 0, s1[7:4], c0_2);
ripple_carry_add_4bit rc3(a[11:8], b[11:8], 0, s1[11:8], c0_3);

//when cin = 1
ripple_carry_add_4bit rc4(a[3:0], b[3:0], 1, s2[3:0], c1_1);
ripple_carry_add_4bit rc5(a[7:4], b[7:4], 1, s2[7:4], c1_2);
ripple_carry_add_4bit rc6(a[11:8], b[11:8], 1, s2[11:8], c1_3);

//selecting sums
mux_2to1_4bit m1(s1[3:0], s2[3:0], cin, sum[3:0]);
mux_2to1_4bit m2(s1[7:4], s2[7:4], cout_1, sum[7:4]);
mux_2to1_4bit m3(s1[11:8], s2[11:8], cout_2, sum[11:8]);

//selecting carries
mux_2_to_1 m4(c0_1, c1_1, cin, cout_1);
mux_2_to_1 m5(c0_2, c1_2, cout_1, cout_2);
mux_2_to_1 m6(c0_3, c1_3, cout_2, cout);

endmodule
