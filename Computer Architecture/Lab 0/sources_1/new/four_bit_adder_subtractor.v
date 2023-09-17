`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2023 11:11:41 PM
// Design Name: 
// Module Name: four_bit_adder_subtractor
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


module four_bit_adder_subtractor( 

input [3:0] A, 

input [3:0] B, 

input sel, 

output [3:0] sum, 

output carry_out 

); 

 

wire B0, B1, B2, B3; 

wire [3:0] B_new; 

 

xor x1(B0, B[0], sel); 

xor x2(B1, B[1], sel); 

xor x3(B2, B[2], sel); 

xor x4(B3, B[3], sel); 

//concatenating the bits to form a new 4 bit number 

assign B_new = { B3, B2, B1, B0 }; 

//dataflow modelling 
assign {carry_out, sum} = A + B_new + sel; //sel will act as carry_in as well

endmodule
