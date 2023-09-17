`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 09:30:48 AM
// Design Name: 
// Module Name: alternate_decoder
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


module alternate_decoder(
input A, B, C,
output reg D7, D6, D5, D4, D3, D2, D1, D0
);

always @(*)
begin
 D0 <= (~A) & (~B) & (~C);
 D1 <= (~A) & (~B) & C;
 D2 <= (~A) & B & (~C);
 D3 <= (~A) & B & C;
 D4 <= A & (~B) & (~C);
 D5 <= A & (~B) & C;
 D6 <= A & B & (~C);
 D7 <= A & B & C;
end

endmodule
