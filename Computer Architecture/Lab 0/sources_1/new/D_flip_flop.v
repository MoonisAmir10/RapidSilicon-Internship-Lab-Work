`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2023 10:06:36 AM
// Design Name: 
// Module Name: D_flip_flop
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


module D_flip_flop(D, clk, clr, Q, Q_neg);
input D; // Data input 
input clk; // clock input 
input clr; // reset
output reg Q, Q_neg; // output Q 
  always @(posedge clk or negedge clr) 
  begin
    if (~clr)
      begin
        Q <= 1'b0;
        Q <= 1'b1;
      end  
    else
      begin
        Q <= D; 
        Q_neg <= ~D;
      end   
  end 
endmodule 

