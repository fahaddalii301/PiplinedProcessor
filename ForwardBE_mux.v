module ForwardBE_mux(RD2E, ResultW, ALUResultM, ForwardBE, SrcBE);
input [31:0] RD2E, ResultW, ALUResultM;
input [1:0] ForwardBE;
output [31:0] SrcBE;
assign SrcBE = (ForwardBE==2'b00) ? RD2E :
(ForwardBE==2'b01) ? ResultW :
(ForwardBE==2'b10) ? ALUResultM : 32'bx;
endmodule
