`timescale 1ns / 1ps

module sequential_3_bit_mult(
input [2:0] M,
input [2:0] Q,
input start,
input clk,
input reset,
output reg [5:0] product,
output reg [2:0] acc,
output reg [1:0] counter,
output reg cnt_done
);

reg [2:0] multiplier;

//reg cnt_done;
wire cnt_up, done, shift, add;

//reg acc_lsb = 1'b0, acc_msb = 1'b0, multiplier_lsb = 1'b0;
reg [6:0] total = 7'd0;
reg carry = 1'b0;

// Use a single clock edge and a reset signal
always @ (posedge clk or posedge reset)
begin
  if (reset == 1'b1) // Reset the registers to zero
    begin
      multiplier <= Q;
      counter <= 2'b00;
      acc <= 3'b000;
      //product <= 6'b000000;
      cnt_done <= 1'b0;
    end
  else // Perform the multiplication logic
    begin
      if (start == 1'b1) // Load the inputs
       begin
          //multiplier <= Q;
          counter <= 2'b00;
          acc <= 3'b000;
          cnt_done <= 1'b0;
       end
    end
end

control_unit cu1(clk, reset, start, multiplier[0], cnt_done, cnt_up, done, add, shift);

always @(*)
begin
  if (add == 1'b1)
    {carry, acc} = acc + M;
  if (shift == 1'b1)
    begin
      total = {carry, acc, multiplier};
      total = total >> 1;
      
      multiplier = total[2:0];
     
      acc = total[5:3];
      carry = total[6];
    end
  if (cnt_up == 1'b1)
    counter = counter + 1'b1;
  if (counter == 2'b11)
    cnt_done = 1'b1;
    
  if (done == 1'b1) // Store the output
     begin
              product = {acc, multiplier};
              counter = 2'b00;
              cnt_done = 1'b0;
              multiplier = Q;
     end
  else
    product = product;
end

endmodule
