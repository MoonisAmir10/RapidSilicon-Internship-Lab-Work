`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2023 11:05:15 AM
// Design Name: 
// Module Name: debounce_tb
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


module debounce_tb();
reg pb_1;
reg clk;
// Outputs
wire pb_out;
wire slow_clk_en;
// Instantiate the debouncing Verilog code
Debounce test(pb_1, clk, pb_out, slow_clk_en);

initial begin
 clk = 0;
 forever #10 clk = ~clk;
end

initial begin
 pb_1 = 0;
 #10;
 pb_1=1;
 #20;
 pb_1 = 0;
 #10;
 pb_1=1;
 #30; 
 pb_1 = 0;
 #10;
 pb_1=1;
 #40;
 pb_1 = 0;
 #10;
 pb_1=1;
 #30; 
 pb_1 = 0;
 #10;
 pb_1=1; 
 #1000; 
 pb_1 = 0;
 #10;
 pb_1=1;
 #20;
 pb_1 = 0;
 #10;
 pb_1=1;
 #30; 
 pb_1 = 0;
 #10;
 pb_1=1;
 #40;
 pb_1 = 0; 
end 

endmodule
