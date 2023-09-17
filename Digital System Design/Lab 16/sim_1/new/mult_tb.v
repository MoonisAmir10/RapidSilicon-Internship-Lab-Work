`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2023 11:44:16 AM
// Design Name: 
// Module Name: mult_tb
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


module mult_tb;

reg [2:0] inp1, inp2;
wire [5:0] result;
wire [2:0] acc;
wire [1:0] counter;
reg clk, reset, start;
wire cnt_done;

sequential_3_bit_mult dut1(inp1, inp2, start, clk, reset, result, acc, counter, cnt_done);

initial begin
    clk = 1'b1;
    forever #20 clk =~clk;
  end

initial begin
  reset = 1'b1; start = 1'b1; inp1 = 3'b010; inp2 = 3'b110;
  #5 reset = 1'b0; start = 1'b1;
 #40 reset = 1'b0; start = 1'b0; inp1 = 3'b010; inp2 = 3'b110;
end
endmodule
