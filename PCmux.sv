module PCmux(PCplus4F, PCTargetE, PCSrcE, PCNext);
input [31:0] PCplus4F, PCTargetE;
input PCSrcE;
output [31:0] PCNext;
assign PCNext = PCSrcE ? PCTargetE : PCplus4F;
endmodule
