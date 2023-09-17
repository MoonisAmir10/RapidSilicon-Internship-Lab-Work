`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 03:14:25 PM
// Design Name: 
// Module Name: traffic_contr_tb
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


module traffic_contr_tb;

reg clk, reset;
wire [1:0] signal_A, signal_B;

traffic_controller tc1(clk, reset, signal_A, signal_B);

initial begin
    clk = 1'b1;
    forever #5 clk =~clk;
end

initial begin
reset = 1'b1;
 #18 reset = 1'b0;
 #20 reset = 1'b0;
 #20 reset = 1'b0;
 #20 reset = 1'b0;
 #20 reset = 1'b0;
 #20 reset = 1'b0;
 #20 reset = 1'b0;
 #20 reset = 1'b0;
 #20 reset = 1'b0;
 #20 reset = 1'b0;
 end 
endmodule
