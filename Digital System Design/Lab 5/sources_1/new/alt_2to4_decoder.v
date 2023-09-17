`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 09:54:47 AM
// Design Name: 
// Module Name: alt_2to4_decoder
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


module alt_2to4_decoder(
input A, B, en,
output reg D0, D1, D2, D3
);

always@(*)
begin
 if (en)
   begin
    D3 = A & B;
    D2 = (~A) & B;
    D1 = A & (~B);
    D0 = (~A) & (~B);
   end
 else
   begin
    D3 = 0;
    D2 = 0;
    D1 = 0;
    D0 = 0;
   end
end
endmodule
