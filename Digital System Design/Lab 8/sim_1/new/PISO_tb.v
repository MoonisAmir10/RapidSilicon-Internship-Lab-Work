`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 12:54:08 PM
// Design Name: 
// Module Name: PISO_tb
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


module PISO_tb();

reg [7:0] data_in;
reg clk, clr, sel;
wire data_out;

PISO p1(data_in, sel, clk, clr, data_out);

initial 
begin
    clk = 0;
    forever #20 clk = ~clk;
end

initial
begin
  clr = 1; sel = 1;
  #25 clr = 0;
  #25 data_in = 8'b00000001; sel = 0;
  #25 sel = 1;
  #25 data_in = 8'b00000111; sel = 0;
  #25 sel = 1;
end
endmodule
