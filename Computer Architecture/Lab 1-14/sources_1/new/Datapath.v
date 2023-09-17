//`include "Register File.v"
//`include "ALU.v"
//`include "input2_mux.v"
//`include "imm_generate.v" 
//`include "Data Memory.v"
//`include "regfile_wb_mux.v"
//`include "input1_mux.v"
//`include "Branch Comparator.v"

module Datapath(
input [4:0]read_reg_r1,
input [4:0]read_reg_r2,
input [11:0]read_imm_12,
input [4:0]reg_write_dest,
input [3:0]alu_select,
input reg_write_en,
input clk,
input reset,
input [1:0]imm_sel,
input bsel,
input asel,
input dm_write_en,
input [1:0]wbsel,
input [31:0]pc_X,
input [31:0]pc_M,
input brun_en,
output breq_flag,
output brlt_flag,
output bge_flag,
output [31:0] alu_out
);

//internal wires
wire [31:0]read_data1;
wire [31:0]read_reg_data1;
wire [31:0]read_reg_data2;
wire [31:0]read_imm_data2;
wire [31:0]read_data2;
wire [31:0]write_data;
wire [31:0]dm_out;

//pipeline wires
wire [31:0] read_reg_data1_out;
wire [31:0] read_reg_data2_out;
wire [31:0] read_reg_data2_out_M;
wire [31:0] alu_M_out;
wire [31:0] write_data_out;

//forward wires
wire [31:0] mux_out_inp1;
wire [31:0] mux_out_inp2;
wire [1:0] fwdA;
wire [1:0] fwdB;


//pipeline registers
reg_32_bit rs1_x(
.reset(reset),
.clk(clk),
.D(read_reg_data1),
.Q(read_reg_data1_out)
);

reg_32_bit rs2_x(
.reset(reset),
.clk(clk),
.D(read_reg_data2),
.Q(read_reg_data2_out)
);

reg_32_bit rs2_M(
.reset(reset),
.clk(clk),
.D(read_reg_data2_out),
.Q(read_reg_data2_out_M)
);

reg_32_bit alu_M(
.reset(reset),
.clk(clk),
.D(alu_out),
.Q(alu_M_out)
);

reg_32_bit write_data_pipe(
.reset(reset),
.clk(clk),
.D(write_data),
.Q(write_data_out)
);

//Instantiating the register file
RegFile regfile_inst(
.clk(clk),
.reg_write_en(reg_write_en),
.reg_write_dest_addr(reg_write_dest),
.reg_write_data(write_data_out),
.reg_read_addr_rs1(read_reg_r1),
.reg_read_data_rs1(read_reg_data1),
.reg_read_addr_rs2(read_reg_r2),
.reg_read_data_rs2(read_reg_data2)
);

//sign extension
imm_generate imm_gen_inst(
.imm_12(read_imm_12),
.reg_write_dest(reg_write_dest),
.imm_sel(imm_sel),
.read_imm_data2(read_imm_data2)
);

//choosing b/w R or I type
input2_mux input2_mux_inst(
.read_reg_data2(mux_out_inp2),
.read_imm_data2(read_imm_data2),
.bsel(bsel),
.read_data2(read_data2)
);

//forwarding mux
mux_3_to_1 inp1_mux(
.reg_rs(read_reg_data1_out),
.write_back_data(write_data),
.alu_result_M(alu_M_out),
.forward(fwdA),
.mux_out(mux_out_inp1)
);

mux_3_to_1 inp2_mux(
.reg_rs(read_reg_data2_out),
.write_back_data(write_data),
.alu_result_M(alu_M_out),
.forward(fwdB),
.mux_out(mux_out_inp2)
);

//choosing whether B type or not
input1_mux input1_mux_inst(
.read_reg_data1(mux_out_inp1),
.pc(pc_X),
.asel(asel),
.read_data1(read_data1)
);

//Instantiating Branch Comp
branch_comparator branc_comp_inst(
.inpA(read_reg_data1_out),
.inpB(read_reg_data2_out),
.brun_en(brun_en),
.breq_flag(breq_flag),
.brlt_flag(brlt_flag),
.bge_flag(bge_flag)
);

//Instantiating ALU
ALU ALU_inst(
.inp1(read_data1),
.inp2(read_data2),
.alu_select(alu_select),
.alu_out(alu_out)
);

DataMem RAM_inst(
.dm_read_addr(alu_M_out),
.dm_write_data_rs2(read_reg_data2_out_M),
.dm_write_en(dm_write_en),
.clk(clk),
.dm_read_data(dm_out)
);

regfile_wb_mux wb_mux_inst(
.dm_inp(dm_out),
.alu_result(alu_M_out),
.wbsel(wbsel),
.pc(pc_M),
.write_data(write_data)
);

endmodule 