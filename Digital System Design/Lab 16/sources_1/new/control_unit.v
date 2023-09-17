`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2023 10:30:47 AM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
input clk,
input reset,
input start,
input Q_lsb,
input cnt_done,
output reg cnt_up,
output reg done,
output reg add,
output reg shift
);

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
reg [1:0] state = 2'b00;
reg [1:0] next_state;

//to update state
always @(posedge clk or posedge reset)
begin
  if (reset == 1'b1)
    state <= S0; 
  else
    state <= next_state;
end

always @(state or start or Q_lsb or cnt_done)
begin
  case (state)
  S0: begin if (start == 1'b1)
        next_state = S1;
      else 
        next_state = S0;
      end
   S1: next_state = S2;
   S2: begin if (cnt_done == 1'b1)
          next_state = S3;
        else
          next_state = S1;
        end
   S3: next_state = S0;
     default: next_state = S0;
     endcase
end

always @(state)
begin
  case (state)
   S0, S1: begin cnt_up <= 1'b0; add <= 1'b0; done <= 1'b0; shift <= 1'b0; end 
   S2: begin cnt_up <= 1'b1; done <= 1'b0; shift <= 1'b1; add <= Q_lsb; end 
   S3: begin cnt_up <= 1'b0; add <= 1'b0; done <= 1'b1; shift <= 1'b0; end 
  default: begin cnt_up <= 1'b0; add <= 1'b0; done <= 1'b0; shift <= 1'b0; end
  endcase
end

endmodule
