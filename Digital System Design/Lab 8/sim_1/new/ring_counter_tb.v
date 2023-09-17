`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 02:35:18 PM
// Design Name: 
// Module Name: ring_counter_tb
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


module ring_counter_tb();

reg clk, reset;
wire [7:0] count_out;

ring_counter rc1(clk, reset, count_out);

initial 
begin
    clk = 0;
    forever #20 clk = ~clk;
end

initial
begin
  reset = 1;
  #25 reset = 0;
end

endmodule
