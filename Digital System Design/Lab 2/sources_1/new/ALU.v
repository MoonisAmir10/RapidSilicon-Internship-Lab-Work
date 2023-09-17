`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2023 09:43:32 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
input [3:0] inp1,
input [3:0] inp2,
input add,
input sub,
input slt,
input sltu,
input shift,
output reg [3:0] res
);

always @(*)
begin
 if (add)
   res = inp1 + inp2;
 else if (sub)
   res = inp1 - inp2;
 else if (slt)
   begin
    if ($signed(inp1) < $signed(inp2))
      res = 1;
    else
      res = 0;
   end
 else if (sltu)
    begin
     if ($unsigned(inp1) < $unsigned(inp2))
       res = 1;
     else
       res = 0;
    end
 else if (shift)
     res = inp1 >>> inp2;       
end

endmodule
