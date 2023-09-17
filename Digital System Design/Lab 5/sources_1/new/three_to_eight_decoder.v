`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2023 04:29:39 PM
// Design Name: 
// Module Name: three_to_eight_decoder
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


module three_to_eight_decoder(
input A, B, C,
output D7, D6, D5, D4, D3, D2, D1, D0
);

assign D0 = (~A) & (~B) & (~C);
assign D1 = (~A) & (~B) & C;
assign D2 = (~A) & B & (~C);
assign D3 = (~A) & B & C;
assign D4 = A & (~B) & (~C);
assign D5 = A & (~B) & C;
assign D6 = A & B & (~C);
assign D7 = A & B & C;

endmodule
