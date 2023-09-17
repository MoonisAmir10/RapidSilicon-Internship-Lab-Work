`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 12:37:25 PM
// Design Name: 
// Module Name: PIPO_tb
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


module PIPO_tb();

reg [15:0] data_in;
reg clk, clr;
wire [15:0] q;

PIPO s3(data_in, clk, clr, q);

initial 
begin
    clk = 0;
    forever #20 clk = ~clk;
end

initial
begin
  clr = 1;
  #25 clr = 0;
  #25 data_in = 16'b0000000000000001;
  #25 data_in = 16'b0000000000000111;
end

endmodule
