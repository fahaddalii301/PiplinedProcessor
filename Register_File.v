module Register_File(RS1, RS2, rdW, ResultW, RegWriteW, RD1D, RD2D,
clk);
input [4:0] RS1, RS2, rdW;
input [31:0] ResultW;
input RegWriteW, clk;
output [31:0] RD1D, RD2D;
reg [31:0] registers [31:0];
assign RD1D = registers[RS1];
assign RD2D = registers[RS2];
integer i;
always @(negedge clk)
if (RegWriteW)
begin
registers[rdW] = ResultW;
end
initial
begin
for(i=0; i<32; i=i+1)
begin
registers[i] = 0;
end
end
endmodule
