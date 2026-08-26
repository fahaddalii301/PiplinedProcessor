module Main_decoder(Opcode, Branch, Jump, ImmSrc, ResultSrc, ALUOp,
MemWrite, ALUSrc, RegWrite);
input [6:0] Opcode;
output [1:0] ImmSrc, ResultSrc, ALUOp;
output Branch, Jump, MemWrite, ALUSrc, RegWrite;
wire [10:0] controls;
assign {ALUSrc, ResultSrc, ImmSrc, RegWrite, MemWrite, Branch, Jump,
ALUOp} = controls;
assign controls =
(Opcode == 7'b0110011) ? 11'b0_00_xx_1_0_0_0_10: // r type
(Opcode == 7'b0000011) ? 11'b1_01_00_1_0_0_0_00: // lw type
(Opcode == 7'b0100011) ? 11'b1_xx_01_0_1_0_0_00: // sw type
(Opcode == 7'b1100011) ? 11'b0_xx_10_0_0_1_0_01: // sb type
(Opcode == 7'b0010011) ? 11'b1_00_00_1_0_0_0_10: // addi type
(Opcode == 7'b1101111) ? 11'bx_10_11_1_0_0_1_xx: // j type
11'b0_00_00_0_0_0_0_00;
endmodule
