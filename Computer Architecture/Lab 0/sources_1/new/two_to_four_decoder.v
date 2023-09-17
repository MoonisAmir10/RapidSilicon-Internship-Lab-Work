`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2023 04:20:29 PM
// Design Name: 
// Module Name: two_to_four_decoder
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


module two_to_four_decoder(
input A,
input B,
output D3, D2, D1, D0
);

wire A_neg, B_neg;

not n1(A_neg, A);
not n2(B_neg, B);

and a1(D3, A, B);
and a2(D2, A_neg, B);
and a3(D1, A, B_neg);
and a4(D0, A_neg, B_neg);

endmodule
