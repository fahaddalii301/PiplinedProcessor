module Hazard_Unit(ForwardAE, ForwardBE, StallD, StallF, FlushE, FlushD,
rs1D, rs2D, rs1E, rs2E, rdM, rdW, rdE,
RegWriteM, RegWriteW, ResultSrcE, PCSrcE);
input [4:0] rs1D, rs2D, rs1E, rs2E, rdM, rdW, rdE;
input RegWriteM, RegWriteW;
input [1:0] ResultSrcE;
input PCSrcE;
output reg [1:0] ForwardAE, ForwardBE;
output StallD, StallF, FlushE, FlushD;
wire lwstall;
always @(*)
begin
if (((rs1E == rdM) & RegWriteM) & (rs1E !=0))
ForwardAE=2'b10;
else if (((rs1E == rdW) & RegWriteW) & (rs1E !=0))
ForwardAE=2'b01;
else
ForwardAE=2'b00;
end
always @(*)
begin
if (((rs2E == rdM) & RegWriteM) & (rs2E !=0))
ForwardBE=2'b10;
else if (((rs2E == rdW) & RegWriteW) & (rs2E !=0))
ForwardBE=2'b01;
else
ForwardBE=2'b00;
end
assign lwstall = (ResultSrcE == 2'b01) && ((rs1D==rdE)|(rs2D==rdE));
assign StallF = lwstall;
assign StallD = lwstall;
assign FlushE = lwstall | PCSrcE;
assign FlushD = PCSrcE;
endmodule
