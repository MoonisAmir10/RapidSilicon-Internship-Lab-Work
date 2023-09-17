`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 10:58:13 AM
// Design Name: 
// Module Name: moore_fsm_rom
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

module ROM(
input [2:0] state,
output reg [2:0] count,
output reg [2:0] next_state
);

reg [2:0] mem [5:0]; //6 locations of 3 bits each

initial 
begin
  mem[0] = 3'b000;
  mem[1] = 3'b001;
  mem[2] = 3'b011;
  mem[3] = 3'b101;
  mem[4] = 3'b111;
  mem[5] = 3'b010;
end

always @(*)
begin
  case(state)
    3'b000: begin count <= mem[0]; next_state <= 3'b001; end
    3'b001: begin count <= mem[1]; next_state <= 3'b010; end
    3'b010: begin count <= mem[2]; next_state <= 3'b011; end
    3'b011: begin count <= mem[3]; next_state <= 3'b100; end
    3'b100: begin count <= mem[4]; next_state <= 3'b101; end
    3'b101: begin count <= mem[5]; next_state <= 3'b000; end
  endcase
end

endmodule



module moore_fsm_rom(
input clk, reset,
output reg [2:0] count = 3'b000
);

reg [2:0] state = 3'b000;
//reg [2:0] next_state = 3'b000;

wire [2:0] ns_temp;

wire [2:0] temp;

parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;

ROM m1(state, temp, ns_temp);

always @(posedge clk or posedge reset)
begin
  if (reset == 1'b1)
    state <= S0;
  else
    state <= ns_temp;

begin
count <= temp; end
//next_state <= ns_temp;
end

endmodule
