`timescale 1ns / 1ps

module DFF(
input D,
input clk,
input clk_en,
output reg Q = 0
);

always @(posedge clk)
begin
 if (clk_en == 1)
   Q <= D;
end
endmodule


module clk_enable(
input clk_100MHz,
output reg slow_clk_en
);

reg [26:0] count = 0;
always @(posedge clk_100MHz)
    begin
       count <= (count>19)?0:count+1;
       slow_clk_en <= (count == 19)?1'b1:1'b0;
       
    end
 
endmodule


module Debounce(
input btn_in,
input clk,
output btn_out,
output slow_clk_en
);

wire Q0;
wire Q1;
wire Q2;
wire Q2_bar;

clk_enable c1(clk, slow_clk_en);

DFF d1(btn_in, clk, slow_clk_en, Q0);
DFF d2(Q0, clk, slow_clk_en, Q1);
DFF d3(Q1, clk, slow_clk_en, Q2);

assign Q2_bar = ~Q2;

assign btn_out = Q1 & Q2_bar;

endmodule
