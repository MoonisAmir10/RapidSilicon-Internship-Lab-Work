`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2023 11:58:43 AM
// Design Name: 
// Module Name: controller_with_nested_subroutine
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

module instr_mem(
input [31:0] addr,
output [31:0] out
);

endmodule


//condtional mux
module cond_mux(
input cond0,
input cond1,
input [1:0] sel,
output reg cond_mux_out
);

always@(*)
begin
  case(sel)
   2'b00: cond_mux_out = 1'b0; //no branch
   2'b01: cond_mux_out = cond0; //conditional branch 
   2'b10: cond_mux_out = cond1; 
   2'b11: cond_mux_out = 1'b1; //unconditional jump
   default: cond_mux_out = 1'b0;
  endcase
end
endmodule


//next address mux
module next_addr_mux(
input [31:0] pc,
input [31:0] subroutine_addr,
input [31:0] second_addr,
input [10:0] brn_addr,
input [1:0] sel,
output reg [31:0] next_addr
);

always@(*)
begin
  case(sel)
   2'b00: next_addr = pc;
   2'b01: next_addr = subroutine_addr;
   2'b10: next_addr = second_addr;
   2'b11: next_addr = {21'd0, brn_addr};
   default: next_addr = pc;
  endcase
end
endmodule


//program counter
module program_counter(
input clk,
input reset,
input [31:0] pc_update,
output reg [31:0] count
);


//PC register
always@(posedge clk, negedge reset)
if (!reset) //active low reset
  count <= 0;
else
  count <= pc_update + 1'b1;

endmodule


module controller_with_nested_subroutine(
input clk,
input reset
);

wire [1:0] next_addr_sel;
wire polarity;
wire [1:0] brn_cond_sel;
wire [10:0] brn_addr;



endmodule
