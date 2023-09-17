`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2023 10:26:28 AM
// Design Name: 
// Module Name: demux_1_to_4
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


module demux_1_to_4(
input enable,
input [1:0] sel,
output reg en_1,
output reg en_2,
output reg en_3,
output reg en_4
);

always@(*)
begin
  case(sel)
    2'b00: begin en_1 = enable; en_2 = 1'b0; en_3 = 1'b0; en_4 = 1'b0; end
    2'b01: begin en_1 = 1'b0; en_2 = enable; en_3 = 1'b0; en_4 = 1'b0; end
    2'b10: begin en_1 = 1'b0; en_2 = 1'b0; en_3 = enable; en_4 = 1'b0; end
    2'b11: begin en_1 = 1'b0; en_2 = 1'b0; en_3 = 1'b0; en_4 = enable; end
    default: begin en_1 = 1'b0; en_2 = 1'b0; en_3 = 1'b0; en_4 = enable; end
  endcase  
end
endmodule
