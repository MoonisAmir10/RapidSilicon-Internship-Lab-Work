`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 11:38:45 AM
// Design Name: 
// Module Name: csa_tb
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


module csa_tb;

reg [7:0] inp1;
reg [7:0] inp2;
reg cin;
wire [7:0] sum;
wire cout;

conditional_sum_adder csa1(inp1, inp2, cin, sum, cout);

initial
begin
  #20 inp1 = 8'b00000001; inp2 = 8'b00000011; cin = 0;
  #20 inp1 = 8'b10000000; inp2 = 8'b10000000; cin = 0;
end
endmodule
