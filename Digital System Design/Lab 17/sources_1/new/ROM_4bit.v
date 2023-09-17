`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2023 08:51:01 PM
// Design Name: 
// Module Name: ROM_4bit
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


module ROM_4bit(
input [3:0] addr,
output reg [3:0] instr
);

reg [3:0] mem [15:0]; //16 locations each of 4 bits width

endmodule
