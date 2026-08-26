module Control_Unit(Opcode, funct3, funct7, ALUSrcD, ResultSrcD,
ImmSrcD, RegWriteD, MemWriteD, ALUControlD, BranchD, JumpD);
input [6:0] Opcode;
input funct7;
input [2:0] funct3;
output [2:0] ALUControlD;
output [1:0] ImmSrcD, ResultSrcD;
output MemWriteD, ALUSrcD, RegWriteD;
output BranchD, JumpD;
wire [1:0] ALUOp;
Main_decoder main_dec(Opcode, BranchD, JumpD, ImmSrcD, ResultSrcD,
ALUOp, MemWriteD, ALUSrcD, RegWriteD);
ALU_decoder alu_dec(ALUOp, funct3, funct7, ALUControlD);
endmodule
