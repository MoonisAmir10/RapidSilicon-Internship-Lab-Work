`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 12:28:43 PM
// Design Name: 
// Module Name: traffic_controller
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

module traffic_contr_rom(
input [2:0] state,
output reg [1:0] sig_A_state,
output reg [1:0] sig_B_state,
output reg [2:0] next_state
);

parameter G = 2'b00, Y = 2'b01, R = 2'b10;

//reg [2:0] mem [7:0]; //6 locations of 3 bits each

//initial 
//begin
//  mem[0] = 3'b000;
//  mem[1] = 3'b001;
//  mem[2] = 3'b010;
//  mem[3] = 3'b011;
//  mem[4] = 3'b100;
//  mem[5] = 3'b101;
//  mem[6] = 3'b110;
//  mem[7] = 3'b111;
//end

always @(state)
begin
  case(state)
    3'b000: begin sig_A_state <= G; sig_B_state <= R; next_state <= 3'b001; end
    3'b001: begin sig_A_state <= G; sig_B_state <= R; next_state <= 3'b010; end
    3'b010: begin sig_A_state <= Y; sig_B_state <= R; next_state <= 3'b011; end
    3'b011: begin sig_A_state <= R; sig_B_state <= Y; next_state <= 3'b100; end
    3'b100: begin sig_A_state <= R; sig_B_state <= G; next_state <= 3'b101; end
    3'b101: begin sig_A_state <= R; sig_B_state <= G; next_state <= 3'b110; end
    3'b110: begin sig_A_state <= Y; sig_B_state <= Y; next_state <= 3'b000; end
    //3'b111: begin sig_A_state <= G; sig_B_state <= R; next_state <= 3'b000; end
  endcase
end

endmodule

module traffic_controller(
input clk, reset,
output reg [1:0] sig_A_state,
output reg [1:0] sig_B_state
);

reg [2:0] state;
wire [2:0] next_state;
wire [1:0] A_st;
wire [1:0] B_st;

traffic_contr_rom tcr1(state, A_st, B_st, next_state);

always @(posedge clk or posedge reset)
begin
  if (reset == 1'b1)
    state <= 3'b000;
  else
    state <= next_state;
    sig_A_state <= A_st;
    sig_B_state <= B_st;
end

//always@(*)
//begin
//sig_A_state <= A_st;
//sig_B_state <= B_st;
//end

endmodule
