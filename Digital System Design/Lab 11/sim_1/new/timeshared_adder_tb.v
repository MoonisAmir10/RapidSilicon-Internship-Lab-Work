`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 12:31:36 PM
// Design Name: 
// Module Name: timeshared_adder_tb
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


module timeshared_adder_tb;

reg [31:0] inp1;
reg [31:0] inp2;
reg clk, clr;
wire [31:0] out;
wire cout;

time_shared_32bit_adder tsa1(inp1, inp2, clk, clr, out, cout);

initial 
begin
clk = 0;
    forever #10 clk = ~clk;
end

initial
begin
  clr = 1;
  inp1 = 32'd5;
  inp2 = 32'd35;
end
endmodule
