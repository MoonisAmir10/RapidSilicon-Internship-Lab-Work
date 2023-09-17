`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 09:35:06 AM
// Design Name: 
// Module Name: array_mult_tb
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


module array_mult_tb;

reg [3:0] inp1;
reg [3:0] inp2;
wire [7:0] result;

array_multiplier am1(inp1, inp2, result);

initial
begin
  inp1 = 4'b0010; inp2 = 4'b0100;  
end
endmodule
