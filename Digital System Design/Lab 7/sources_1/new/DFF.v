`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 11:03:34 AM
// Design Name: 
// Module Name: DFF
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


module DFF(
input D, 
input clk, 
input reset,
output reg Q,
output reg Q_not
);

always @(posedge clk or negedge reset)
begin
 if (!reset)
  begin
   Q <= 0;
   Q_not <= 1;
  end
 else
  begin
   Q <= D;
   Q_not <= ~D;
  end
end
endmodule
