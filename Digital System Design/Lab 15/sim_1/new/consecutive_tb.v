`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2023 11:08:01 PM
// Design Name: 
// Module Name: consecutive_tb
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


module consecutive_tb;

reg ain;
reg clk;
reg reset;
wire yout;

consecutive_4_1s_detect dut1(ain, clk, reset, yout);

initial begin
    clk = 1'b1;
    forever #5 clk =~clk;
  end
  
initial begin
  reset = 1'b1; ain = 1'b0;
 #20 reset = 1'b0; ain = 1'b1;
 #20 reset = 1'b0; ain = 1'b1;
 #20 reset = 1'b0; ain = 1'b1;
 #20 reset = 1'b0; ain = 1'b1;
 #20 reset = 1'b0; ain = 1'b1;
 #20 reset = 1'b0; ain = 1'b1;
 #20 reset = 1'b0; ain = 1'b0;
 #20 reset = 1'b0; ain = 1'b1;
 #20 reset = 1'b0; ain = 1'b0;
 #20 reset = 1'b0; ain = 1'b1;
 #20 reset = 1'b0; ain = 1'b1;
 #20 reset = 1'b0; ain = 1'b1;
 #20 reset = 1'b0; ain = 1'b1;

end
endmodule
