`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2023 11:28:31 AM
// Design Name: 
// Module Name: mux_3_to_1
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


module mux_3_to_1(
input [31:0] reg_rs,
input [31:0] write_back_data,
input [31:0] alu_result_M,
input [1:0] forward,
output reg [31:0] mux_out
);

always @(*)
begin
  case(forward)
   2'b00: mux_out = reg_rs;
   2'b01: mux_out = write_back_data;
   2'b10: mux_out = alu_result_M;
   default: mux_out = reg_rs;
  endcase 
end 

endmodule 
