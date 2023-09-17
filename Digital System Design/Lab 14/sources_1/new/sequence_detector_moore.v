`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2023 03:47:03 PM
// Design Name: 
// Module Name: sequence_detector_moore
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


module sequence_detector_moore(
input [1:0] ain, 
input clk, reset,
output reg yout
);

reg [2:0] state = 3'b000, next_state = 3'b000;
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;

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
  S0: begin if (ain == 2'b01)
        next_state = S1;
      else if (ain == 2'b11)
        next_state = S3;
      else if (ain == 2'b10)
        next_state = S2;
      else if (ain == 2'b00)
        next_state = S0;
      end
   S1: begin if (ain == 2'b00)
         next_state = S0;
       else if (ain == 2'b01)
         next_state = S1;
       else if (ain == 2'b10)
         next_state = S2;
       else if (ain == 2'b11)
         next_state = S3;
       end 
    S2: begin if (ain == 2'b00)
          next_state = S4;
        else if (ain == 2'b01)
          next_state = S2;
        else if (ain == 2'b10)
          next_state = S1;
        else if (ain == 2'b11)
          next_state = S3;
        end
    S3: begin if (ain == 2'b00)
          next_state = S4;
        else if (ain == 2'b01)
          next_state = S1;
        else if (ain == 2'b10)
          next_state = S2;
        else if (ain == 2'b11)
          next_state = S3;
        end
    S4: begin if (ain == 2'b00)
          next_state = S4;
        else if (ain == 2'b01)
          next_state = S6;
        else if (ain == 2'b10)
          next_state = S7;
        else if (ain == 2'b11)
          next_state = S5;
        end
     S5: begin if (ain == 2'b00)
           next_state = S5;
         else if (ain == 2'b01)
           next_state = S6;
         else if (ain == 2'b10)
           next_state = S7;
         else if (ain == 2'b11)
           next_state = S5;
         end
     S6: begin if (ain == 2'b00)
           next_state = S0;
         else if (ain == 2'b01)
           next_state = S6;
         else if (ain == 2'b10)
           next_state = S7;
         else if (ain == 2'b11)
           next_state = S5;
         end
     S7: begin if (ain == 2'b00)
           next_state = S0;
         else if (ain == 2'b01)
           next_state = S6;
         else if (ain == 2'b10)
           next_state = S7;
         else if (ain == 2'b11)
           next_state = S5;
         end
     endcase
end

always @(state)
begin
  case (state)
   S0, S1, S2, S3: yout = 1'b0;
   S4, S5, S6, S7: yout = 1'b1;
  default: yout = 1'b0; 
  endcase
end

endmodule
