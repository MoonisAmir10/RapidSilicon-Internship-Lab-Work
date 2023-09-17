`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 10:24:15 AM
// Design Name: 
// Module Name: four_to_two_encoder
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


module four_to_two_encoder(
input w0, w1, w2, w3,
output reg y0, y1
);

always @(*)
begin
 y0 = w1 | w3;
 y1 = w2 | w3;
end
endmodule
