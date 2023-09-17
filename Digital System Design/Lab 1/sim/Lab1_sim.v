`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2023 09:07:40 AM
// Design Name: 
// Module Name: Lab1_sim
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


module Lab1_sim();
reg [3:0] A;
reg [3:0] B;
reg clock_100MHz;
reg reset;
wire [3:0] Sum;
wire OV_S;
wire OV_U;
wire [6:0] Seg;
wire [3:0] an;

Lab0_test t1(A, B, clock_100MHz, reset, OV_S, OV_U, Seg, an, Sum);

initial begin

clock_100MHz = 0;
forever #20 clock_100MHz = ~clock_100MHz;

end

initial 
begin
  reset = 1;
  #5 reset = 0;
end 

initial begin
A = 4'b1000;
B = 4'b1000;
end

initial
#800 $finish;
endmodule

