`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 03:03:33 PM
// Design Name: 
// Module Name: shift_add_multiplier
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

module shift_add_multiplier( clk,rst,A, B, C);
parameter m=8, n=8;
integer i;
input clk,rst;
input [m-1:0] A;
input [n-1:0] B;
output reg [m+n-1:0]C;
reg [m+n-1:0]A1;
reg [n-1:0]B1;
always@(posedge clk or posedge rst )
begin
		if (rst)
		begin
		C=0;
		end
		else 
		begin
		C=0;
		A1[m-1:0]=A;
		A1[m+n-1:m]=0;
		B1=B;
        for (i=0;i<n;i=i+1)
        begin
			if(B1[i]==1'b0)
			begin
				C = C + 0;
			end
			else if (B1[i]==1'b1)
			begin
				C=C+(A1<<i);
			end
		end
		end
end
endmodule
