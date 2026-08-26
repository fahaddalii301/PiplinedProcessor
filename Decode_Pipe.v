module Decode_Pipe(clk, reset, clear, enable, InstrF, PCF, PCplus4F,
InstrD, PCD, PCplus4D);
input clk, reset, clear, enable;
input [31:0] InstrF, PCF, PCplus4F;
output reg [31:0] InstrD, PCD, PCplus4D;
always @ (posedge clk)
begin
if (reset | clear)
begin
PCD
<= 0;
InstrD <= 0;
PCplus4D <= 0;
end
else if (enable)
begin
PCD
<= PCD;
InstrD <= InstrD;
PCplus4D <= PCplus4D;
end
else
begin
PCD
<= PCF;
InstrD <= InstrF;
PCplus4D <= PCplus4F;
end
end
endmodule
