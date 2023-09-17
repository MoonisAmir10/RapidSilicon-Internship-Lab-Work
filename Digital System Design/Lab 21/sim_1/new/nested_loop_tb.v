`timescale 1ns / 1ps

module nested_loop_tb;

reg [9:0] counts;
reg [9:0] instr_end_addr;
reg en_loop;
reg clk, reset;
wire [31:0] pc;
wire [31:0] start_addr;
wire loop_end_inst, loop_end_flag;

program_counter pc1(clk, reset, start_addr, loop_end_inst, loop_end_flag, pc);
nested_loop_machine dut1(pc, instr_end_addr, counts, en_loop, clk, reset, loop_end_inst, loop_end_flag, start_addr);

initial begin
clk = 0;
forever
#5 clk= ~clk;
end

initial begin
  reset = 1'b1; counts = 10'd4; en_loop = 1'b0; instr_end_addr = 10'd12;
  #10 reset = 1'b0;
  #20 en_loop = 1'b1; 
  #4 en_loop = 1'b0;
  
 #3 counts = 10'd3; en_loop = 1'b0; instr_end_addr = 10'd9;
  #20 en_loop = 1'b1; 
  #1 en_loop = 1'b0;
end
endmodule
