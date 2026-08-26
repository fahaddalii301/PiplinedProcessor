Data Memory
module Data_Memory(ALUResultM, WriteDataM, clk, MemWriteM, ReadDataM);
input [31:0] ALUResultM, WriteDataM;
input clk, MemWriteM;
output [31:0] ReadDataM;
reg [7:0] memory [63:0];
integer i;
initial
begin
for(i=0; i<63; i=i+4)
memory[i] = i;
end
initial
begin
for(i=0; i<63; i=i+1)
memory[i] = 0;
end
assign ReadDataM = {memory[ALUResultM+3], memory[ALUResultM+2],
memory[ALUResultM+1], memory[ALUResultM]};
always @(posedge clk)
begin
if (MemWriteM)
{memory[ALUResultM+3], memory[ALUResultM+2], memory[ALUResultM+1],
memory[ALUResultM]} = WriteDataM;
end
endmodule
