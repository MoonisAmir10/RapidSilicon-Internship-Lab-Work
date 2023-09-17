`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 11:40:12 AM
// Design Name: 
// Module Name: fsm_rom_tb
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


module fsm_rom_tb;

reg clk, reset;
wire [2:0] count;

moore_fsm_rom mfr1(clk, reset, count);

initial begin
    clk = 1'b1;
    forever #5 clk =~clk;
  end
  
initial begin
 reset = 1'b1;
 #20 reset = 1'b0;
 #20 reset = 1'b0;
 #20 reset = 1'b0;
end
endmodule

