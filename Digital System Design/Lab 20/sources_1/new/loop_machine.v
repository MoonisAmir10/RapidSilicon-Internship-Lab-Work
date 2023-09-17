`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2023 10:18:42 AM
// Design Name: 
// Module Name: loop_machine
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


module loop_machine(
input [31:0] pc,
input [9:0] instr_end_addr,
input [9:0] count,
input en_loop,
input clk,
input reset,
output loop_end_inst,
output loop_end_flag,
output [31:0] start_addr
);

reg [31:0] loop_start_addr;
reg [31:0] loop_end_addr;
reg [9:0] loop_counter;
reg [9:0] dec_count;

wire [9:0] L;
wire loop_end_addr_flag;
reg loop_inst;
wire loop_counter_en;
wire loop_count_zero_flag;

wire pc_flag, start_addr_flag;

always @(posedge clk or posedge reset)
begin
  if (reset == 1'b1)
    loop_counter <= 10'd0;
//  else
//    loop_counter <= loop_counter;
  
  else if (en_loop == 1'b1)
    begin
      loop_start_addr <= pc;
      loop_end_addr <= {22'd0, instr_end_addr};
    end
  else
    begin
      loop_start_addr <= loop_start_addr;
      loop_end_addr <= loop_end_addr;
    end
end

always @(posedge clk)
begin
 if (loop_counter_en == 1'b1)
   loop_counter <= L;
 else
   loop_counter <= loop_counter;
end

always@(*)
begin
  dec_count = loop_counter - 1'b1;
end

comparator c1(pc, loop_end_addr, loop_end_addr_flag);

loop_mux m1(count, dec_count, loop_inst, L);

assign loop_counter_en = en_loop | loop_end_addr_flag;

assign loop_count_zero_flag = (loop_counter == 1'b0) ? 1'b1 : 1'b0;

assign pc_flag = (pc > 32'd0) ? 1'b1: 1'b0;
assign start_addr_flag = (loop_start_addr > 32'd0) ? 1'b1: 1'b0;
//assign loop_inst = pc_flag & start_addr_flag & (~loop_end_inst);

assign loop_end_inst = loop_end_addr_flag & (~loop_count_zero_flag);

assign loop_end_flag = loop_end_addr_flag & loop_count_zero_flag;

assign start_addr = loop_start_addr;

always @(*)
begin
  if (en_loop == 1'b1)
    loop_inst <= 1'b1;
  else
    loop_inst <= 1'b0;
end

endmodule
