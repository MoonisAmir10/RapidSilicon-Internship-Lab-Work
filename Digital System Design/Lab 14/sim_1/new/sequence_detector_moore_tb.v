`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 10:36:52 AM
// Design Name: 
// Module Name: sequence_detector_moore_tb
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


module sequence_detector_moore_tb;

reg [1:0] ain;
reg clk;
reg reset;
wire yout;

sequence_detector_moore sdm1(ain, clk, reset, yout);

initial begin
    clk = 1'b1;
    forever #5 clk =~clk;
  end
  
initial begin
  reset = 1'b1; ain = 2'b00;
  #20 reset = 1'b0; ain = 2'b00;
  #10 reset = 1'b0; ain = 2'b11;
  #10 reset = 1'b0; ain = 2'b00;
  #10 reset = 1'b0; ain = 2'b10;
  #10 reset = 1'b0; ain = 2'b00;
  end
endmodule
