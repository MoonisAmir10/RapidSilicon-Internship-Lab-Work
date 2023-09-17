`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 11:12:13 AM
// Design Name: 
// Module Name: DFF_tb
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


module DFF_tb();

reg D = 0, clk, reset = 1;
wire Q, Q_not;

DFF d1(D, clk, reset, Q, Q_not);

initial
begin
 clk = 0;
 forever #10 clk = ~clk;
end

initial
begin
 #15 D = 1;
 #30 D = 1; reset = 0;
end
endmodule
