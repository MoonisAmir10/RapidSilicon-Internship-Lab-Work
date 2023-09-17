`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2023 12:33:03 PM
// Design Name: 
// Module Name: sequence_detector_tb
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


module sequence_detector_tb;

 reg clk;
  reg reset;
  reg ain;
  wire [3:0] count;
 
  wire yout;
 
  //instantiation of design fsm module
  sequence_detector sd1(ain, clk, reset, yout, count);
 
  //clock input generation
  initial begin
    clk = 1'b1;
    forever #5 clk =~clk;
  end
 
  //test inputs generation
  initial begin
    reset = 1'b1;ain = 1'b0;
    #20 reset = 1'b0;ain = 1'b0;
     #15 reset = 1'b0;ain = 1'b1;
     #15 reset = 1'b0;ain = 1'b1;
     #15 reset = 1'b0;ain = 1'b1;
     #15 reset = 1'b0;ain = 1'b1;
     #15 reset = 1'b0;ain = 1'b1;
     #15 reset = 1'b0;ain = 1'b1;
     #15 reset = 1'b0;ain = 1'b1;
     #10 reset = 1'b0;ain = 1'b0;
     #15 reset = 1'b0;ain = 1'b1;
         #15 reset = 1'b0;ain = 1'b1;
         #15 reset = 1'b0;ain = 1'b1;
         #15 reset = 1'b0;ain = 1'b0;
    #20 $finish;
  end
 
endmodule

 