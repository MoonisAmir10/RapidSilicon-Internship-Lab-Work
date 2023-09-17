`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 09:51:17 AM
// Design Name: 
// Module Name: four_to_sixteen_decoder
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


module four_to_sixteen_decoder(
input A0, A1, A2, A3, en,
output D15, D14, D13, D12, D11, D10, D9, D8, D7, D6, D5, D4, D3, D2, D1, D0
);

wire en1, en2, en3, en4;

alt_2to4_decoder d0(A2, A3, en, en1, en2, en3, en4);
alt_2to4_decoder d1(A0, A1, en1, D0, D1, D2, D3); 
alt_2to4_decoder d2(A0, A1, en2, D4, D5, D6, D7); 
alt_2to4_decoder d3(A0, A1, en3, D8, D9, D10, D11); 
alt_2to4_decoder d4(A0, A1, en4, D12, D13, D14, D15); 

endmodule
