`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 03:18:36 PM
// Design Name: 
// Module Name: shift_add_multiplier_tb
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


module shift_add_multiplier_tb;

parameter m=8, n=8;
reg clk, rst;
reg [m-1:0] A;
reg [n-1:0] B;
wire [m+n-1:0] C;

shift_add_multiplier uut(clk, rst, A, B, C);

initial 
begin
    clk = 1'b1;
    forever #4 clk = ~clk;
end
initial
begin
    
    rst = 1;
    #2;
    rst = 0;
    A = 8'b11111111;
    B = 8'b11111111;
    #20;
    rst = 1;
    #2;
    rst = 0;
    A = 8'b00011111;
    B = 8'b00011111;
    #20;
    rst = 1;
    #2;
    rst = 0;
    A = 8'b00000011;
    B = 8'b00000010;
    #20;
end
endmodule
