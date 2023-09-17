module input1_mux(
input [31:0] read_reg_data1,
input [31:0] pc,
input asel,
output reg [31:0] read_data1
);

always @(*)
begin
  case(asel)
   2'b00: read_data1 = read_reg_data1;
   2'b01: read_data1 = pc;
  endcase 
end

endmodule 
