module DataMem(
input [31:0] dm_read_addr,
input [31:0] dm_write_data_rs2,
input dm_write_en,
input clk,
output reg [31:0] dm_read_data
);

//define the memory size in bytes
`define MEM_SIZE 256

//define the number of rows and columns in the array
`define ROWS (`MEM_SIZE / 4)

reg [31:0] memory [`ROWS - 1:0];
wire [5:0] ram_addr = dm_read_addr[5:0];
integer i;

//initializing all locations to be 8, for testing purposes
initial 
begin
 for(i=0;i<63;i=i+1)
   begin memory[i] = 32'd0; end


memory[8] = 32'd10;
memory[9] = 32'd3;
memory[10] = 32'd7;
memory[11] = 32'd21;
memory[12] = 32'd25;
memory[13] = 32'd29;
memory[14] = 32'd11;
memory[15] = 32'd17;
memory[16] = 32'd23;
memory[17] = 32'd32;
memory[18] = 32'd1;

end



always @(posedge clk) begin 
  if (dm_write_en)
   memory[ram_addr] <= dm_write_data_rs2;
 end 

always@(*)
dm_read_data = memory[ram_addr];

endmodule 