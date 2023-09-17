`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2023 01:57:39 PM
// Design Name: 
// Module Name: counter
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


module counter (Load, IN, clk, clr, A); 

input Load, clk, clr; 

input [3:0] IN; // Data input 

output reg [3:0] A; // Data output 


always @ (posedge clk or negedge clr) 
begin 
  if (~clr)  
    A = 4'b0000; 
  else if (Load)  
    A = IN; 
  else  
    A = A + 1'b1; 
end 

 

endmodule 
