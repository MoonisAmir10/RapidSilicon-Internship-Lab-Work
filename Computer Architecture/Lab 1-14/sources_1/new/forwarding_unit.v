`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2023 12:03:57 PM
// Design Name: 
// Module Name: forwarding_unit
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


module forwarding_unit(
input [4:0] ID_EX_RegisterRs1,
input [4:0] ID_EX_RegisterRs2,
input EX_MEM_RegWrite,
input MEM_WB_RegWrite,
input [4:0] EX_MEM_RegisterRd,
input [4:0] MEM_WB_RegisterRd,
output reg [1:0] forwardA,
output reg [1:0] forwardB
);

always @(*) 
 begin
 if ( EX_MEM_RegWrite && (EX_MEM_RegisterRd != 0) && (EX_MEM_RegisterRd == ID_EX_RegisterRs1) )
 forwardA = 2'b10;
 
 else if (( EX_MEM_RegWrite & (MEM_WB_RegisterRd != 0) & (MEM_WB_RegisterRd == ID_EX_RegisterRs1) )&  !( EX_MEM_RegWrite & (EX_MEM_RegisterRd != 0) & (EX_MEM_RegisterRd == ID_EX_RegisterRs1)))
 forwardA = 2'b01;
 
 else if ( EX_MEM_RegWrite & (EX_MEM_RegisterRd != 0) & (EX_MEM_RegisterRd == ID_EX_RegisterRs2) )
 forwardB = 2'b10;
 
 else if (
 ( MEM_WB_RegWrite & (MEM_WB_RegisterRd != 0) & (MEM_WB_RegisterRd == ID_EX_RegisterRs2) )
 & !( MEM_WB_RegWrite & (EX_MEM_RegisterRd != 0) & (EX_MEM_RegisterRd == ID_EX_RegisterRs2)))
 forwardB = 2'b01;
 
 else begin 
forwardA = 2'b00;
forwardB = 2'b00;
 end 
 
 end   

endmodule
