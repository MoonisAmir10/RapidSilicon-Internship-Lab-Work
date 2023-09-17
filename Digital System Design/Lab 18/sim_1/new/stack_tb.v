`timescale 1ns / 1ps


module stack_tb;

reg [7:0] Data_In;
reg PushPop, Clock, Reset, Enable;
wire [7:0] Data_Out;
wire Stack_Empty, Stack_Full;

subroutine_ret_addr_stack dut1(Stack_Empty, Stack_Full, Data_Out, PushPop, Data_In, Clock, Reset, Enable);
//?
initial begin
// Initialize Inputs 
PushPop = 0;
Data_In = 0;
Clock = 0;
Reset = 0;
Enable = 0;
// Wait 100 ns for global reset to finish
#100;
Reset = 1;
PushPop= 1;
Data_In = 8'd1;
Enable = 1;
#100 Data_In = 8'd2; #100 Data_In = 8'd3; #100 Data_In = 8'd4; #100 Data_In = 8'd5; 
#100 Data_In = 8'd6; #100 Data_In = 8'd7; #100 Data_In = 8'd8; 
// Now Pop
#100;
PushPop = 0;
#800;
end
// For clock
always #50 Clock = ~Clock;

endmodule
