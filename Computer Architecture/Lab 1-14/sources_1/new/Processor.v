//`include "Control Unit.v"
//`include "Datapath.v"
//`include "Program Counter.v"
//`include "Instruction Memory.v"
//`include "pc_mux.v"

module Processor( 
input clk, 
input reset
);

wire [31:0] instr;
wire [3:0] alu_select;
wire reg_write_en;
wire [31:0] count;
wire [1:0] imm_sel;
wire bsel;
wire asel;
wire dm_write_en;
wire [1:0]wbsel;
wire breq_flag;
wire brlt_flag;
wire bge_flag;
wire brun_en;
wire pc_sel;
wire [31:0] alu_out;
wire [31:0] pc_update;

//pipeline wires
wire [31:0] pc_D_out;
wire [31:0] pc_X_out;
wire [31:0] pc_M_out;
wire [31:0] pc_M_temp;

wire [31:0] instr_D_out;
wire [31:0] instr_X_out;
wire [31:0] instr_M_out;
wire [31:0] instr_W_out;

wire [1:0] imm_sel_x;
wire reg_write_en_x;
wire reg_write_en_M;
wire reg_write_en_wb;
wire brun_en_x;
wire bsel_x;
wire asel_x;
wire [3:0] alu_select_x;
wire dm_write_en_x;
wire dm_write_en_M;
wire [1:0] wbsel_x;
wire [1:0] wbsel_M;
wire [1:0] wbsel_W;
wire pc_sel_x;
wire pc_sel_M;
wire pc_sel_W;

pc_mux pc_mux_inst(
.alu_out(alu_out),
.pc(count),
.pcsel(pc_sel_W),
.pc_update(pc_update)
);

program_counter counter_inst(
.clk(clk),
.reset(reset),
.pc_update(pc_update),
.count(count)
);

//pipeline registers
reg_32_bit pc_D(
.reset(reset),
.clk(clk),
.D(count),
.Q(pc_D_out)
);

reg_32_bit pc_X(
.reset(reset),
.clk(clk),
.D(pc_D_out),
.Q(pc_X_out)
);

reg_32_bit pc_M(
.reset(reset),
.clk(clk),
.D(pc_X_out),
.Q(pc_M_temp)
);

adder_32_bit add_4(
.inpA(pc_M_temp),
.inpB(32'd4),
.res(pc_M_out)
);

//instr pipeline reg
reg_32_bit instr_D(
.reset(reset),
.clk(clk),
.D(instr),
.Q(instr_D_out)
);

reg_32_bit instr_X(
.reset(reset),
.clk(clk),
.D(instr_D_out),
.Q(instr_X_out)
);

reg_32_bit instr_M(
.reset(reset),
.clk(clk),
.D(instr_X_out),
.Q(instr_M_out)
);

reg_32_bit instr_W(
.reset(reset),
.clk(clk),
.D(instr_M_out),
.Q(instr_W_out)
);

//control unit pipeline
reg_2_bit imm_sel_pipe(
.reset(reset),
.clk(clk),
.D(imm_sel),
.Q(imm_sel_x)
);

reg_1_bit a_sel_pipe(
.reset(reset),
.clk(clk),
.D(asel),
.Q(asel_x)
);

reg_1_bit b_sel_pipe(
.reset(reset),
.clk(clk),
.D(bsel),
.Q(bsel_x)
);

reg_1_bit reg_write_en_pipe(
.reset(reset),
.clk(clk),
.D(reg_write_en),
.Q(reg_write_en_x)
);

reg_1_bit reg_write_en_pipe_2(
.reset(reset),
.clk(clk),
.D(reg_write_en_x),
.Q(reg_write_en_M)
);

reg_1_bit reg_write_en_pipe_3(
.reset(reset),
.clk(clk),
.D(reg_write_en_M),
.Q(reg_write_en_wb)
);

reg_1_bit brun_en_pipe(
.reset(reset),
.clk(clk),
.D(brun_en),
.Q(brun_en_x)
);

reg_4_bit alu_select_pipe(
.reset(reset),
.clk(clk),
.D(alu_select),
.Q(alu_select_x)
);

reg_1_bit dm_write_en_pipe_x(
.reset(reset),
.clk(clk),
.D(dm_write_en),
.Q(dm_write_en_x)
);

reg_1_bit dm_write_en_pipe_M(
.reset(reset),
.clk(clk),
.D(dm_write_en_x),
.Q(dm_write_en_M)
);

reg_2_bit wbsel_pipe_x(
.reset(reset),
.clk(clk),
.D(wbsel),
.Q(wbsel_x)
);

reg_2_bit wbsel_pipe_M(
.reset(reset),
.clk(clk),
.D(wbsel_x),
.Q(wbsel_M)
);

reg_2_bit wbsel_pipe_W(
.reset(reset),
.clk(clk),
.D(wbsel_M),
.Q(wbsel_W)
);

reg_1_bit pc_sel_pipe_x(
.reset(reset),
.clk(clk),
.D(pc_sel),
.Q(pc_sel_x)
);

reg_1_bit pc_sel_pipe_M(
.reset(reset),
.clk(clk),
.D(pc_sel_x),
.Q(pc_sel_M)
);

reg_1_bit pc_sel_pipe_W(
.reset(reset),
.clk(clk),
.D(pc_sel_M),
.Q(pc_sel_W)
);

//Instr Mem
InstrMem instrmem_inst(
.pc(count),
.instr(instr)
); 

ControlUnit controlunit_inst(
.funct7(instr_D_out[31:25]),
.funct3(instr_D_out[14:12]),
.opcode(instr_D_out[6:0]),
.breq_flag(breq_flag),
.brlt_flag(brlt_flag),
.bge_flag(bge_flag),
.alu_select(alu_select),
.reg_write_en(reg_write_en),
.imm_sel(imm_sel),
.bsel(bsel),
.asel(asel),
.dm_write_en(dm_write_en),
.wbsel(wbsel),
.brun_en(brun_en),
.pc_sel(pc_sel)
);

Datapath datapath_inst(
.read_reg_r1(instr_D_out[19:15]),
.read_reg_r2(instr_D_out[24:20]),
.read_imm_12(instr_X_out[31:20]),
.reg_write_dest(instr_W_out[11:7]),
.alu_select(alu_select_x),
.reg_write_en(reg_write_en_wb),
.clk(clk),
.reset(reset),
.imm_sel(imm_sel_x),
.bsel(bsel_x),
.asel(asel_x),
.dm_write_en(dm_write_en_M),
.wbsel(wbsel_W),
.pc_X(pc_X_out),
.pc_M(pc_M_out),
.brun_en(brun_en_x),
.breq_flag(breq_flag),
.brlt_flag(brlt_flag),
.bge_flag(bge_flag),
.alu_out(alu_out)
);

endmodule 