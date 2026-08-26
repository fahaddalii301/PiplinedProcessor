module ImmExt(InstrD, ImmSrcD, ImmExtD);
input [31:0] InstrD;
input [1:0] ImmSrcD;
output [31:0] ImmExtD;
reg [31:0] ImmExtD;
always @(*)
begin
case(ImmSrcD)
  2'b00: ImmExtD = {{20{InstrD[31]}},InstrD[31:20]}; //I
  2'b01: ImmExtD = {{20{InstrD[31]}},InstrD[31:25],InstrD[11:7]}; //S
  2'b10: ImmExtD = {{20{InstrD[31]}},InstrD[7],InstrD[30:25],InstrD[11:8],1'b0}; //B
  2'b11: ImmExtD = {{12{InstrD[31]}},InstrD[19:12],InstrD[20],InstrD[30:21],1'b0}; //J
  default: ImmExtD = 32'bx;
endcase
end
endmodule
