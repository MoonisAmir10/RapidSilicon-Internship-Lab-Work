`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2023 09:47:22 AM
// Design Name: 
// Module Name: subroutine_ret_addr_stack
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


module subroutine_ret_addr_stack(Stack_Empty, Stack_Full, Data_Out, PushPop, Data_In, Clock, Reset, Enable); 

output reg Stack_Empty, Stack_Full;
output reg [7:0] Data_Out;
input PushPop, Clock, Reset, Enable; 
input [7:0] Data_In;
reg [7:0] Stack_Mem [7:0];
reg [2:0] Stack_Pointer;
always@ (posedge Clock or negedge Reset)
if (Reset==0) /// As usual We check the reset condition first
begin
Stack_Pointer = 3'd0; Stack_Empty <= 1'b1; Stack_Full <= 1'b0;
end
else
if (Enable==1) // If Enable == 1 then DO Push/Pop, Otherwise no operation
   if (PushPop==1 && Stack_Full==0) // For Push, Make sure stack is not already full begin
    begin
    Stack_Empty <= 0;
    Stack_Pointer = Stack_Pointer + 1;
    Stack_Mem [Stack_Pointer] <= Data_In;
    
      if (Stack_Pointer==3'd7)
       Stack_Full <= 1;
    end
 else if (PushPop==0 && Stack_Empty==0)// For Pop, Make sure stack is not already Empty begin
    begin
    Stack_Full <= 0;
    Data_Out <= Stack_Mem[Stack_Pointer];
    Stack_Pointer = Stack_Pointer - 1;
    
      if (Stack_Pointer==3'd0)
       Stack_Empty <= 1;
end
endmodule
