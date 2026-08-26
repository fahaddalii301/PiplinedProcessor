module Riscv_Pipeline(clk, reset);
input clk, reset;
wire PCSrcE, BranchE, JumpE, ALUSrcE, RegWriteE, MemWriteE, ZeroE;
wire BranchD, JumpD, ALUSrcD, RegWriteD, MemWriteD;
wire RegWriteM, MemWriteM;
wire RegWriteW;
wire StallD, StallF, FlushE, FlushD;
wire [1:0] ResultSrcE, ResultSrcD, ImmSrcD, ResultSrcM, ResultSrcW,
ForwardAE, ForwardBE;
wire [2:0] ALUControlE, ALUControlD;
wire [4:0] rdW, rdE, rdM, rs1E, rs2E;
wire [31:0] PCplus4F, PC, PCF, InstrF;
wire [31:0] RD1D, RD2D, InstrD, PCD, PCplus4D, ImmExtD;
wire [31:0] PCTargetE, RD1E, RD2E, PCE, ImmExtE, PCplus4E, SrcAE,
SrcBE, Src2BE, ALUResultE;
wire [31:0] PCplus4M, ALUResultM, WriteDataM, ReadDataM;
wire [31:0] ResultW, PCplus4W, ALUResultW, ReadDataW;
parameter [31:0] pc_increment = 32'd4;
// Instantiating PCmux
PCmux MUX1(PCplus4F, PCTargetE, PCSrcE, PC);
// Instantiating Fetch_Pipe
Fetch_Pipe IF(PCF, PC, clk, reset, StallF);
// Instantiating Instr_Memory
Instr_Memory Instr_Mem(PCF, InstrF);
// Instantiating PC_Adder
PC_Adder PCplus(PCF, pc_increment, PCplus4F);
// Instantiating Decode_Pipe
Decode_Pipe ID(clk, reset, FlushD, StallD, InstrF, PCF, PCplus4F,
InstrD, PCD, PCplus4D);
// Instantiating Control_Unit
Control_Unit CU(InstrD[6:0], InstrD[14:12], InstrD[30], ALUSrcD,
ResultSrcD, ImmSrcD, RegWriteD, MemWriteD, ALUControlD, BranchD, JumpD);
// Instantiating Register_File
Register_File RF(InstrD[19:15], InstrD[24:20], rdW, ResultW,
RegWriteW, RD1D, RD2D, clk);
// Instantiating ImmExt
ImmExt Imm_Ext(InstrD, ImmSrcD, ImmExtD);
// Instantiating Execute_Pipe
Execute_Pipe IE(clk, reset, FlushE, RegWriteD, MemWriteD, JumpD,
BranchD, ALUSrcD, ALUControlD, ResultSrcD, ImmSrcD, InstrD[11:7], RD1D,
RD2D, PCD, ImmExtD, PCplus4D, RegWriteE, MemWriteE, JumpE, BranchE,
ALUSrcE, ALUControlE, ResultSrcE, rdE, RD1E, RD2E, PCE, ImmExtE, PCplus4E, 
                InstrD[19:15], InstrD[24:20], rs1E, rs2E);
// Instantiating ForwardAE_mux
ForwardAE_mux Mux1_3x1(RD1E, ResultW, ALUResultM, ForwardAE, SrcAE);
// Instantiating ForwardBE_mux
ForwardBE_mux Mux2_3x1(RD2E, ResultW, ALUResultM, ForwardBE, SrcBE);
// Instantiating ALUmux
ALUmux Mux2(SrcBE, ImmExtE, ALUSrcE, Src2BE);
// Instantiating ALU
ALU ALU_Unit(SrcAE, Src2BE, ALUControlE, ZeroE, ALUResultE);
assign PCSrcE = JumpE | (BranchE & ZeroE);
// Instantiating PC_Target
PC_Target PCplusImm(ImmExtE, PCE, PCTargetE);
// Instantiating Memory_Pipe
Memory_Pipe IM(RegWriteM, MemWriteM, ResultSrcM, rdM, PCplus4M,
ALUResultM, WriteDataM, clk, reset, RegWriteE, MemWriteE, ResultSrcE,
rdE, PCplus4E, ALUResultE, SrcBE);
// Instantiating Data_Memory
Data_Memory DM(ALUResultM, WriteDataM, clk, MemWriteM, ReadDataM);
// Instantiating Writeback_Pipe
Writeback_Pipe IWB(clk, reset, RegWriteM, ResultSrcM, rdM, PCplus4M,
RegWriteW, ResultSrcW, rdW, PCplus4W, ALUResultW, ReadDataW, ALUResultM,
ReadDataM);
// Instantiating ResultSrc
ResultSrc Mux3_3x1(ALUResultW, ReadDataW, PCplus4W, ResultSrcW,
ResultW);
// Instantiating Hazard_Unit
Hazard_Unit HU(ForwardAE, ForwardBE, StallD, StallF, FlushE, FlushD,
InstrD[19:15], InstrD[24:20], rs1E, rs2E, rdM, rdW, rdE, RegWriteM,
RegWriteW, ResultSrcE, PCSrcE);
endmodule

