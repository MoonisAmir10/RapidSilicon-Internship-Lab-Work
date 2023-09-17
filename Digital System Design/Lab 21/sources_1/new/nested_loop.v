`timescale 1ns / 1ps

module nested_loop_machine(
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

reg [1:0] stack_pointer;
reg [1:0] current_selector;
wire [31:0] start_addr_4, start_addr_3, start_addr_2, start_addr_1;
wire [9:0] end_addr_4, end_addr_3, end_addr_2, end_addr_1;
wire [9:0] loop_count_4, loop_count_3, loop_count_2, loop_count_1;

wire [31:0] start_addr_temp;

wire [9:0] current_end_addr;
wire [9:0] current_count;
wire en_4, en_3, en_2, en_1;
wire [31:0] dummy;

//stack pointer logic
always@(posedge clk or posedge reset)
begin
  if (reset == 1'b1)
    stack_pointer <= 2'b11;
  else if (en_loop == 1'b1)
    stack_pointer <= stack_pointer - 2'b01;
end

always@(posedge clk or posedge reset)
begin
  if (reset == 1'b1)
    current_selector <= 2'b11;
  else if (en_loop == 1'b1)
    current_selector <= current_selector - 2'b01;
  else if (loop_end_flag == 1'b1)
    current_selector <= current_selector + 2'b01;
end

demux_1_to_4 dm1(en_loop, stack_pointer, en_1, en_2, en_3, en_4);

basic_stack_32bit start_addr_stack(pc, en_1, en_2, en_3, en_4, start_addr_1, start_addr_2, start_addr_3, start_addr_4);
basic_stack_10bit end_addr_stack(instr_end_addr, en_1, en_2, en_3, en_4, end_addr_1, end_addr_2, end_addr_3, end_addr_4);
basic_stack_10bit loop_count_stack(count, en_1, en_2, en_3, en_4, loop_count_1, loop_count_2, loop_count_3, loop_count_4);

mux_4_to_1_32bit next_addr_gen(start_addr_1, start_addr_2, start_addr_3, start_addr_4, current_selector, dummy);
mux_4_to_1_10bit end_addr_gen(end_addr_1, end_addr_2, end_addr_3, end_addr_4, current_selector, current_end_addr);
mux_4_to_1_10bit count_gen(loop_count_1, loop_count_2, loop_count_3, loop_count_4, current_selector, current_count); 

loop_machine single_loop(pc, current_end_addr, current_count, en_loop, clk, reset, loop_end_inst, loop_end_flag, start_addr);

//always@(posedge clk)
//begin
//  start_addr <= start_addr_temp;
//end

endmodule