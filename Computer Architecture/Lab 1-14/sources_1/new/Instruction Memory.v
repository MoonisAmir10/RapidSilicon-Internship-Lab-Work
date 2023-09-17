module InstrMem(
input [31:0] pc,
output reg [31:0] instr
);

//define the memory size in bytes
`define MEM_SIZE 256

//define the number of rows and columns in the array
`define ROWS (`MEM_SIZE / 4)

reg [31:0] memory [`ROWS - 1:0];
wire [4:0] instr_addr = pc[6:2]; //there are only (MEM_SIZE / 4) locations

initial
begin
  //assigning instructions
  //$readmemb("instrmem.prog", memory,0,4);
  memory[0] = 32'h00812703;
  memory[1] = 32'h00C1A783; 
  memory[2] = 32'h01022803;
  memory[3] = 32'h0142A883;
  memory[4] = 32'hFEC88813;
  memory[5] = 32'hF9C78713;
  memory[6] = 32'hFCE18293;
  memory[7] = 32'h00E12423;
  memory[8] = 32'h00F1A423;
  memory[9] = 32'h01022423;
  memory[10] = 32'h0112A423;
 end

always @(*)
  instr = memory[instr_addr]; 

endmodule



//module tb_instrmem;

//reg [31:0] pc;
//wire [31:0] instr;

//InstrMem instrmem_inst(
//.pc(pc),
//.instr(instr)
//); 

//initial
//begin

//pc = 32'd0;
//#1
//pc = 32'd4;
//#1
//pc = 32'd8;
//$stop;

//end
//endmodule
