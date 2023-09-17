`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 03:49:53 PM
// Design Name: 
// Module Name: signed_multiplier_tb
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


module signed_multiplier_tb;
reg [3:0] x;
reg [3:0] y; // inputs
  wire [7:0] z; // output

  // instantiate the multiplier module
  signed_multiplier uut (x, y, z);

  // apply some test vectors
  initial begin
    x = 4'b0000; y = 4'b0000; #20; // 0 * 0 = 0
    x = 4'b0001; y = 4'b0001; #20; // 1 * 1 = 1
    x = 4'b0010; y = 4'b0011; #20; // 2 * 3 = 6
    x = 4'b0111; y = 4'b0101; #20; // 7 * 5 = 35
    x = 4'b1000; y = 4'b1000; #20; // -8 * -8 = 64
    x = 4'b1001; y = 4'b1111; #20; // -7 * -1 = 7
    x = 4'b1100; y = 4'b0100; #20; // -4 * 4 = -16
    x = 4'b1010; y = 4'b0110; #20; // -6 * 6 = -36
    $finish;
  end

  // display the inputs and output
  initial begin
    $monitor("x=%b, y=%b, z=%b", x, y, z);
  end

endmodule
