module PC_Adder(PCF, pc_increment, PCplus4F);
input [31:0] PCF, pc_increment;
output [31:0] PCplus4F;
assign PCplus4F = PCF + pc_increment;
endmodule
