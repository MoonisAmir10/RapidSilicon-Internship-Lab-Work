`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2023 11:07:19 AM
// Design Name: 
// Module Name: mux_4_to_1_32bit
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


module mux_4_to_1_32bit(
input [31:0] inp_1,
input [31:0] inp_2,
input [31:0] inp_3,
input [31:0] inp_4,
input [1:0] sel,
output reg [31:0] L
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
