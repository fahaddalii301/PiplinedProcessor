module ForwardAE_mux(RD1E, ResultW, ALUResultM, ForwardAE, SrcAE);
input [31:0] RD1E, ResultW, ALUResultM;
input [1:0] ForwardAE;
output [31:0] SrcAE;
assign SrcAE = (ForwardAE==2'b00) ? RD1E :
(ForwardAE==2'b01) ? ResultW :
(ForwardAE==2'b10) ? ALUResultM : 32'bx;
endmodule
