`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2023 11:02:01 AM
// Design Name: 
// Module Name: hazard_unit
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


module hazard_unit(
input [4:0] rs1_x,
input [4:0] rs2_x,
input [4:0] rd_M,
input [4:0] rd_wb,
input reg_write_en_M,
input reg_write_en_wb,
output reg [1:0] forwardA,
output reg [1:0] forwardB
);

always@(*)
begin
  if(((rs1_x == rd_M) && reg_write_en_M) && (rs1_x != 1'b0))
    forwardA = 2'b10;
  else if (((rs1_x == rd_wb) && reg_write_en_wb) && (rs1_x != 1'b0))
    forwardA = 2'b01;
  else
    forwardA = 2'b00;

  //For rs2
  if(((rs2_x == rd_M) && reg_write_en_M) && (rs2_x != 1'b0))
    forwardB = 2'b10;
  else if (((rs2_x == rd_wb) && reg_write_en_wb) && (rs2_x != 1'b0))
    forwardB = 2'b01;
  else
    forwardB = 2'b00;
end

endmodule
