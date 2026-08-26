module Instr_Memory(PCF, InstrF);
input [31:0] PCF;
output [31:0] InstrF;
reg [31:0] InstrF;
reg [7:0] memory [83:0];
initial
begin
memory[0] = 8'b00010011; // 0x13
memory[1] = 8'b00001011; // 0x0B
memory[2] = 8'b00000000; // 0x00
memory[3] = 8'b00000000; // 0x00
memory[4] = 8'b10010011; // 0x93
memory[5] = 8'b00001011; // 0x0B
memory[6] = 8'b00000000; // 0x00
memory[7] = 8'b00000000; // 0x00
memory[8] = 8'b00010011; // 0x13
memory[9] = 8'b00000101; // 0x05
memory[10] = 8'b10100000; // 0xA0
memory[11] = 8'b00000000; // 0x00
memory[12] = 8'b00010011; // 0x13
memory[13] = 8'b00011100; // 0x1C
memory[14] = 8'b00101011; // 0x2B
memory[15] = 8'b00000000; // 0x00
memory[16] = 8'b00100011; // 0x23
memory[17] = 8'b00100000; // 0x20
memory[18] = 8'b01101100; // 0x6C
memory[19] = 8'b00100001; // 0x21
memory[20] = 8'b00010011; // 0x13
memory[21] = 8'b00001011; // 0x0B
memory[22] = 8'b00011011; // 0x1B
memory[23] = 8'b00000000; // 0x00
memory[24] = 8'b11100011; // 0xE3
memory[25] = 8'b00011010; // 0x1A
memory[26] = 8'b10101011; // 0xAB
memory[27] = 8'b11111110; // 0xFE
memory[28] = 8'b00010011; // 0x13
memory[29] = 8'b00001011; // 0x0B
memory[30] = 8'b00000000; // 0x00
memory[31] = 8'b00000000; // 0x00
memory[32] = 8'b00010011; // 0x13
memory[33] = 8'b00011100; // 0x1C
memory[34] = 8'b00101011; // 0x2B
memory[35] = 8'b00000000; // 0x00
memory[36] = 8'b10110011; // 0xB3
memory[37] = 8'b00001011; // 0x0B
memory[38] = 8'b00001011; // 0x0B
memory[39] = 8'b00000000; // 0x00
memory[40] = 8'b10010011; // 0x93
memory[41] = 8'b10011100; // 0x9C
memory[42] = 8'b00101011; // 0x2B
memory[43] = 8'b00000000; // 0x00
memory[44] = 8'b10000011; // 0x83
memory[45] = 8'b00100000; // 0x20
memory[46] = 8'b00001100; // 0x0C
memory[47] = 8'b00100000; // 0x20
memory[48] = 8'b00000011; // 0x03
memory[49] = 8'b10100001; // 0xA1
memory[50] = 8'b00001100; // 0x0C
memory[51] = 8'b00100000; // 0x20
memory[52] = 8'b01100011; // 0x63
memory[53] = 8'b11011000; // 0xD8
memory[54] = 8'b00100000; // 0x20
memory[55] = 8'b00000000; // 0x00
memory[56] = 8'b10110011; // 0xB3
memory[57] = 8'b10000010; // 0x82
memory[58] = 8'b00000000; // 0x00
memory[59] = 8'b00000000; // 0x00
memory[60] = 8'b00100011; // 0x23
memory[61] = 8'b00100000; // 0x20
memory[62] = 8'b00101100; // 0x2C
memory[63] = 8'b00100000; // 0x20
memory[64] = 8'b00100011; // 0x23
memory[65] = 8'b10100000; // 0xA0
memory[66] = 8'b01011100; // 0x5C
memory[67] = 8'b00100000; // 0x20
memory[68] = 8'b10010011; // 0x93
memory[69] = 8'b10001011; // 0x8B
memory[70] = 8'b00011011; // 0x1B
memory[71] = 8'b00000000; // 0x00
memory[72] = 8'b11100011; // 0xE3
memory[73] = 8'b10010000; // 0x90
memory[74] = 8'b10101011; // 0xAB
memory[75] = 8'b11111110; // 0xFE
memory[76] = 8'b00010011; // 0x13
memory[77] = 8'b00001011; // 0x0B
memory[78] = 8'b00011011; // 0x1B
memory[79] = 8'b00000000; // 0x00
memory[80] = 8'b11100011; // 0xE3
memory[81] = 8'b00011000; // 0x18
memory[82] = 8'b10101011; // 0xAB
memory[83] = 8'b11111100; // 0xFC
end
always @(PCF)
InstrF = {memory[PCF+3], memory[PCF+2], memory[PCF+1], memory[PCF+0]};
endmodule

