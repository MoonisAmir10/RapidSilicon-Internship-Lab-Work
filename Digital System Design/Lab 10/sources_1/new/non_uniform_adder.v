`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 10:28:10 AM
// Design Name: 
// Module Name: non_uniform_adder
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


module non_uniform_adder(
input [11:0] a, [11:0] b,
input cin,
output [11:0] sum, cout
);

wire [11:0] s1;
wire [11:0] s2;
wire c0_1, c0_2, c0_3;
wire c1_1, c1_2, c1_3;
wire cout_1, cout_2;

//when cin = 0
adder_3bit rc1(a[2:0], b[2:0], 0, s1[2:0], c0_1);
ripple_carry_add_4bit rc2(a[6:3], b[6:3], 0, s1[6:3], c0_2);
adder_5bit rc3(a[11:7], b[11:7], 0, s1[11:7], c0_3);

//when cin = 1
adder_3bit rc4(a[2:0], b[2:0], 1, s2[2:0], c1_1);
ripple_carry_add_4bit rc5(a[6:3], b[6:3], 1, s2[6:3], c1_2);
adder_5bit rc6(a[11:7], b[11:7], 1, s2[11:7], c1_3);

//selecting sums
mux_2to1_3bit m1(s1[2:0], s2[2:0], cin, sum[2:0]);
mux_2to1_4bit m2(s1[6:3], s2[6:3], cout_1, sum[6:3]);
mux_2to1_5bit m3(s1[11:7], s2[11:7], cout_2, sum[11:7]);

//selecting carries
mux_2_to_1 m4(c0_1, c1_1, cin, cout_1);
mux_2_to_1 m5(c0_2, c1_2, cout_1, cout_2);
mux_2_to_1 m6(c0_3, c1_3, cout_2, cout);

endmodule
