module Fetch_Pipe(PCF, PCNext, clk, reset, enable);
output reg [31:0] PCF;
input [31:0] PCNext;
input clk, reset, enable;
always @ (posedge clk)
begin
if (reset)
PCF <= 0;
else if (enable)
PCF <= PCF;
else
PCF <= PCNext;
end
endmodule
