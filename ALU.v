module ALU(SrcAE, Src2BE, ALUControlE, ZeroE, ALUResultE);
input [31:0] SrcAE, Src2BE;
input [2:0] ALUControlE;
output reg ZeroE;
output reg [31:0] ALUResultE;
always @ (*)
begin
case(ALUControlE)
3'b000: ALUResultE=SrcAE+Src2BE;
3'b001: ALUResultE=SrcAE-Src2BE;
3'b101: ALUResultE=SrcAE<Src2BE;
3'b011: ALUResultE=SrcAE|Src2BE;
3'b010: ALUResultE=SrcAE&Src2BE;
3'b110: ALUResultE = SrcAE << Src2BE[4:0];
default: ALUResultE=32'bx;
endcase
end
always @ (ALUResultE)
begin
if (ALUResultE)
ZeroE = 0;
else
ZeroE = 1;
end
endmodule
