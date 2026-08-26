module ALU_decoder(ALUOp, funct3, funct7, ALUControl);
input [1:0] ALUOp;
input [2:0] funct3;
input funct7;
output reg [2:0] ALUControl;
always @(*)
begin
case(ALUOp)
2'b00: ALUControl=3'b000;
2'b01: ALUControl=3'b001;
2'b10: begin
case(funct3)
3'b000: ALUControl = funct7 ? 3'b001 : 3'b000;
3'b001: ALUControl = 3'b110;
3'b111: ALUControl=3'b010;
3'b110: ALUControl=3'b011;
3'b010: ALUControl=3'b101;
default: ALUControl = 3'bxxx;
endcase
end
default: ALUControl= 3'bxxx;
endcase
end
endmodule
