`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2023 11:20:09 AM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
input clk,
input reset,
input [31:0] start_addr,
input loop_end_inst,
input loop_end_flag,
output reg [31:0] count
);

//PC register
always@(posedge clk, posedge reset)
begin
if (reset == 1'b1) //active high reset
  count <= 0;
//else
//  count <= count;
else if (loop_end_flag == 1'b1)
  count <= count + 1'b1;
else if (loop_end_inst == 1'b1)
  count <= start_addr;
else
  count <= count + 1'b1;
end

endmodule
