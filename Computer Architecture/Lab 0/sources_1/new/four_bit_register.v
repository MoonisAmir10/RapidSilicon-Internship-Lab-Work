`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2023 10:27:16 AM
// Design Name: 
// Module Name: four_bit_register
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


module four_bit_register(
input [3:0] inp,
input en,
input clk,
input clr,
output reg [3:0] reg_data
);

always @(posedge clk or negedge clr)
begin
  if (~clr)
    reg_data <= 4'b0000;
  else if (en == 1'b1)
    reg_data <= inp;
  else
    reg_data <= reg_data;
end

endmodule
