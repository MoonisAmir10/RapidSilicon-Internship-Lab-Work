`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2023 10:18:11 AM
// Design Name: 
// Module Name: four_bit_processor
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

// Top module
module four_bit_processor(
input clk_in,
input reset,
output reg [3:0] result
);

wire clk;

wire [3:0] pc;
wire [7:0] signal;
wire carry;
wire c_save;
wire null, null2;
wire [3:0] RA_out, RB_out, R0_out;
wire [3:0] alu_out;
wire RA_en, RB_en, R0_en;
wire [3:0] data_to_write;
wire a_temp;
wire load_in;

clock_divider c1(clk_in, clk);

// instantiating the instruction memory module
instr_mem m1(
.addr(pc),
.instr(signal)
);

counter pc1(
.Load(load_in),
.IN({1'b0, signal[2:0]}),
.clk(clk),
.clr(reset),
.A(pc)
);

two_to_four_decoder dec1(
.A(signal[4]),
.B(signal[5]),
.D3(null2),
.D2(R0_en),
.D1(RB_en),
.D0(RA_en)
);

mux_2to1_4bit mux1(
.inp_1(alu_out),
.inp_2({1'b0, signal[2:0]}),
.sel(signal[3]),
.data_out(data_to_write)
);

four_bit_register RA(
.inp(data_to_write),
.en(RA_en),
.clk(clk),
.clr(reset),
.reg_data(RA_out)
);

four_bit_register RB(
.inp(data_to_write),
.en(RB_en),
.clk(clk),
.clr(reset),
.reg_data(RB_out)
);

four_bit_register R0(
.inp(RA_out),
.en(R0_en),
.clk(clk),
.clr(reset),
.reg_data(R0_out)
);


four_bit_adder_subtractor alu1(
.A(RA_out),
.B(RB_out),
.sel(signal[2]),
.sum(alu_out),
.carry_out(carry)
);

D_flip_flop dff1(
.D(carry),
.clk(clk),
.clr(reset),
.Q(c_save),
.Q_neg(null)
);

and g1(a_temp, c_save, signal[6]);

or g2(load_in, a_temp, signal[7]);

always @(*)
  result = R0_out;

endmodule

