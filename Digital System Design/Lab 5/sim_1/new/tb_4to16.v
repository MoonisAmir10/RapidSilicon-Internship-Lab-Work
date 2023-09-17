`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 10:10:42 AM
// Design Name: 
// Module Name: tb_4to16
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


module tb_4to16();
reg A0, A1, A2, A3, en;
wire D15, D14, D13, D12, D11, D10, D9, D8, D7, D6, D5, D4, D3, D2, D1, D0;

four_to_sixteen_decoder fsd(A0, A1, A2, A3, en, D15, D14, D13, D12, D11, D10, D9, D8, D7, D6, D5, D4, D3, D2, D1, D0);

initial
begin
 #10 A0 = 1; A1 = 0; A2 = 1; A3 = 0; en = 0;
 #10 A0 = 0; A1 = 0; A2 = 0; A3 = 0; en = 1;
 #10 A0 = 1; A1 = 0; A2 = 0; A3 = 0; en = 1;
 #10 A0 = 0; A1 = 1; A2 = 1; A3 = 0; en = 1;
end
endmodule
