`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2023 10:58:43 AM
// Design Name: 
// Module Name: processor_tb
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


module processor_tb;

reg clk;
reg reset;
wire [3:0] res;

four_bit_processor mp(clk, reset, res);

// Clock Generation
 initial 
begin
    clk = 0;
    forever #20 clk = ~clk;
end

initial
begin
  reset = 1'b0;
  #15 reset = 1'b1;
end

endmodule
