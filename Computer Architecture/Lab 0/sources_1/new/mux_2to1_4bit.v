`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2023 10:09:55 AM
// Design Name: 
// Module Name: mux_2to1_4bit
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


module mux_2to1_4bit(
input [3:0] inp_1,
input [3:0] inp_2,
input sel,
output reg [3:0] data_out
);

always @(*)
begin
  case (sel)
    1'b0: data_out = inp_1;
    1'b1: data_out = inp_2;
    default: data_out = inp_1;
  endcase
end

endmodule
