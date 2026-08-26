module PC_Target(ImmExtE, PCE, PCTargetE);
input [31:0] ImmExtE, PCE;
output [31:0] PCTargetE;
assign PCTargetE = ImmExtE + PCE;
endmodule
