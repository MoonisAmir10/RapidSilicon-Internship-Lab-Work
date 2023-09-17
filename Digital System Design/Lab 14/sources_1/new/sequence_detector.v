`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2023 11:23:47 AM
// Design Name: 
// Module Name: sequence_detector
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


module sequence_detector(
input ain, clk, reset,
output reg yout,
output reg [3:0] count = 4'b0000
);

reg [1:0] state, next_state;
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

//to update state
always @(posedge clk or posedge reset)
begin
  if (reset == 1'b1)
    begin state <= S0; 
    //count <= 4'b0000; 
    end
  else
    state <= next_state;

//if (ain == 1'b1)
//    count <= count + 4'b0001;
// else
//        count <= count;
end

always @(posedge clk or posedge reset or posedge ain)
begin
if (ain == 1'b1 && reset == 1'b0)
        count <= count + 4'b0001;
 else if (reset == 1'b1)
        count <= 4'b0000;
  else
    count <= count;
end

always @(state or ain)
begin
  case (state)
    S0: begin 
         if (ain == 1'b1)
           next_state = S1;
         else
           next_state = S0;
        end
    S1: begin
          if (ain == 1'b1)
            next_state = S2;
         else
           next_state = S1;
        end
    S2: begin
          if (ain == 1'b1)
             next_state = S3;
          else
             next_state = S2;
        end
    S3: begin
          if (ain == 1'b1)
             next_state = S1;
          else
             next_state = S3;
        end   
    default: next_state = S0;
   endcase
end

always@(state or ain)
begin
  case (state)
  S0, S1, S2: yout = 1'b0;
  S3: yout = 1'b1;
   default: yout = 1'b0;
  endcase
end
endmodule


//begin
//             if (ain == 1'b1)
//               yout = 1'b0;
//             else
//               yout = 1'b1;
//            end