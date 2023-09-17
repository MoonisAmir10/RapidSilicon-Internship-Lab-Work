`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 10:00:32 AM
// Design Name: 
// Module Name: uniform_adder_tb
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


module uniform_adder_tb;

reg [11:0] inp1; 
reg [11:0] inp2;
reg cin;
wire [11:0] out; 
wire cout;

uniform_adder ua1(inp1, inp2, cin, out, cout);

initial
begin
  #20 inp1 = 12'b000000000000; inp2 = 12'b000000000010; cin = 0;
  #20 inp1 = 12'b000000000011; inp2 = 12'b000000000010; cin = 0;
  #20 inp1 = 12'b100000000000; inp2 = 12'b100000000010; cin = 0;
end
endmodule
