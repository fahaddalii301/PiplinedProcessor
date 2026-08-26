module ResultSrc(ALUResultW, ReadDataW, PCplus4W, ResultSrcW, ResultW);
input [31:0] ALUResultW, ReadDataW, PCplus4W;
input [1:0] ResultSrcW;
output [31:0] ResultW;
assign ResultW = (ResultSrcW==2'b00) ? ALUResultW :
(ResultSrcW==2'b01) ? ReadDataW :
(ResultSrcW==2'b10) ? PCplus4W : 32'bx;
endmodule
