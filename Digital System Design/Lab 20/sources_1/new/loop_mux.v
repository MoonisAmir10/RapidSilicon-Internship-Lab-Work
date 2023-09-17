`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2023 09:58:38 AM
// Design Name: 
// Module Name: loop_mux
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


module loop_mux(
input [9:0] initial_count,
input [9:0] current_count,
input sel,
output reg [9:0] L
);

always@(*)
begin
  case(sel)
    1'b0: L = current_count;
    1'b1: L = initial_count;
    default: L = initial_count;
  endcase
end
endmodule
