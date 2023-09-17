`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2023 09:55:29 AM
// Design Name: 
// Module Name: counter_mux
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


module mux_4_to_1_10bit(
input [9:0] inp_1,
input [9:0] inp_2,
input [9:0] inp_3,
input [9:0] inp_4,
input [1:0] sel,
output reg [9:0] L
);

always@(*)
begin
  case(sel)
    2'b00: L = inp_1;
    2'b01: L = inp_2;
    2'b10: L = inp_3;
    2'b11: L = inp_4;
    default: L = inp_4;
  endcase  
end
endmodule
