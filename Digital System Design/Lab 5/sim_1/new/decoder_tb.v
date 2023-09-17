`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 09:35:21 AM
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb();
reg A, B, C;
wire D7, D6, D5, D4, D3, D2, D1, D0;

alternate_decoder ad1(A, B, C, D7, D6, D5, D4, D3, D2, D1, D0);

initial
begin
 #10 A = 0; B = 0; C = 0;
 #10 A = 0; B = 0; C = 1;
 #10 A = 0; B = 1; C = 0;
end
endmodule
