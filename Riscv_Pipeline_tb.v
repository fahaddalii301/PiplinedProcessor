`timescale 1ns/1ps
module Riscv_Pipeline_tb;
reg clk;
reg reset;
// Instantiate DUT
Riscv_Pipeline dut (
.clk(clk),
.reset(reset)
);
initial begin
clk = 0;
forever #5 clk = ~clk;
end
initial begin
reset = 1;
#50;
reset = 0;
#5000;
$finish;
end
endmodule
