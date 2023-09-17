`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2023 01:00:34 PM
// Design Name: 
// Module Name: Lab0 test
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

module Four_bit_Adder(
input [3:0] A,
input [3:0] B,
output [3:0] Sum,
output reg OV_S,
output reg OV_U
);

wire [4:0] check;

assign check = A + B;

assign Sum = A + B;

always @(*)
begin
if (check[4] == 1)
 OV_U = 1;
else
 OV_U = 0;
 
if ($signed(check) != $signed(Sum))
 OV_S = 1;
else
 OV_S = 0;
end

endmodule

module Seven_Segment(
input [3:0] Sum,
input clock_100MHz,
input reset,
output reg [6:0] Seg,
output reg [3:0] an
);

reg disp_bit;
reg [1:0] digit_sel = 0;

always@(posedge clock_100MHz or posedge reset)
begin
  if (reset)
    digit_sel <= 0;
  else if (digit_sel == 2'b11)
    digit_sel <= 0;
  else
    digit_sel <= digit_sel + 1; 
end

always @(*)
begin
 case(digit_sel)
   2'b00: begin
           an = 4'b1110; //0th bit
           disp_bit = Sum[0];
          end
  2'b01: begin
           an = 4'b1101; //1st bit
           disp_bit = Sum[1];
         end
  2'b10: begin
           an = 4'b1011; //2nd bit
           disp_bit = Sum[2];
         end 
  2'b11: begin
           an = 4'b0111; //3rd bit
           disp_bit = Sum[3];
         end
  endcase       
end

always @(*)
begin
 case(disp_bit)
  1'b0: Seg = 7'b0000001; // "0"  
  1'b1: Seg = 7'b1001111; // "1" 
  default: Seg = 7'b0000001; // "0"
  endcase
end

endmodule



module Lab0_test(
input [3:0] A,
input [3:0] B,
input clock_100MHz,
input reset,
output OV_S,
output OV_U,
output [6:0] Seg,
output [3:0] an,
output [3:0] Sum
);

//wire [3:0] Sum;
//assign an = 4'b0000;

Four_bit_Adder U5(A,B,Sum,OV_S,OV_U);
Seven_Segment U6(Sum, clock_100MHz, reset, Seg, an);

endmodule



