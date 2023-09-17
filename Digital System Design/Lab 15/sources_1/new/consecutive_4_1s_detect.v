`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2023 11:02:23 PM
// Design Name: 
// Module Name: consecutive_4_1s_detect
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


module consecutive_4_1s_detect(
input ain, 
input clk, reset,
output reg yout
);

reg [2:0] state = 3'b000, next_state;
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;

//to update state
always @(posedge clk or posedge reset)
begin
  if (reset == 1'b1)
    state <= S0; 
  else
    state <= next_state;
end

always @(state or ain)
begin
  case (state)
  S0: begin if (ain == 1'b1)
        next_state = S1;
      else 
        next_state = S0;
      end
   S1: begin if (ain == 1'b1)
         next_state = S2;
       else
         next_state = S0;
       end 
    S2: begin if (ain == 1'b1)
          next_state = S3;
        else
          next_state = S0;
        end
    S3: begin if (ain == 1'b1)
          next_state = S4;
        else
          next_state = S0;
        end
    S4: begin if (ain == 1'b1)
          next_state = S4;
        else
          next_state = S0;
        end
     default: next_state = S0;
     endcase
end

always @(state)
begin
  case (state)
   S0, S1, S2, S3: yout = 1'b0;
   S4: yout = 1'b1;
  default: yout = 1'b0; 
  endcase
end

endmodule
