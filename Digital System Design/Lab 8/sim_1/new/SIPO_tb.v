`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 12:24:06 PM
// Design Name: 
// Module Name: SIPO_tb
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


module SIPO_tb();

reg data_in, clk, clr;
wire [7:0] q;

SIPO s2(data_in, clk, clr, q);

initial 
begin
    clk = 0;
    forever #20 clk = ~clk;
end

initial
begin
  clr = 1;
  #25 clr = 0;
  #25 data_in = 1;
end

endmodule
