`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 03:48:55 PM
// Design Name: 
// Module Name: signed_multiplier
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


module signed_multiplier (input [3:0] x, [3:0] y, output [7:0] z);
  wire [3:0] pp0;
  wire [3:0] pp1; 
  wire [3:0] pp2; 
  wire [3:0] pp3; // partial products
  wire [3:0] cv; // correction vector
  wire [7:0] sum; // sum of partial products and correction vector

  // generate partial products
  assign pp0 = x & ({{4{y[0]}}, y});
  assign pp1 = x & ({{4{y[1]}}, y});
  assign pp2 = x & ({{4{y[2]}}, y});
  assign pp3 = (~x) & ({{4{y[3]}}, y}); // two's complement of x for negative weight of MSB

  // flip the MSB of all partial products except the last one and adding 1
  assign pp0[3] = ~pp0[3];
  assign pp1[3] = ~pp1[3];
  assign pp2[3] = ~pp2[3];
  

  // add one to the MSB of all partial products
  assign cv = {pp0[3], pp1[3], pp2[3], pp3[3]} + 4'b0001;

  // remove the MSB of all partial products
  assign pp0[3] = 1'b0;
  assign pp1[3] = 1'b0;
  assign pp2[3] = 1'b0;
  assign pp3[3] = 1'b0;

  // add the partial products and the correction vector
  assign sum = {pp0,pp1} + {pp2,pp3} + {cv,4'b0000};

  // assign the output
  assign z = sum;

endmodule
