`timescale 1ns/1ns
module DataPath(input clk, rst, RegWrite, ALUsrc, Mem_Read, Mem_Write, PCsrc, input[1:0] RegDst, jPC, MemtoReg,
                input[2:0] ALUoperation, output [5:0] opcod,func, output zero, output [31:0] res1, res2);
                
  logic [31:0] Pcin, Pcout, instruction, Write_Data , Read_Data1, Read_Data2, seout, B, ALUresult, Memout, Pc4, shout,
  addout, PCsel, adrout;
  logic [4:0] Write_Reg;  
  logic [31:0] four = {29'b0,3'b100};
  logic [4:0] R31 = 5'b11111;
  PC m1 (Pcin, clk, rst, Pcout);
  InstMem m2 (Pcout, instruction);
  mux_3_5 m3 (instruction[20:16], instruction[15:11], R31, RegDst, Write_Reg);
  RegFile m4 (instruction[25:21], instruction[20:16], Write_Reg, Write_Data, clk, RegWrite, Read_Data1, Read_Data2);
  mux_2_32 m5 (Read_Data2, seout, ALUsrc, B);
  ALU m6 (Read_Data1, B, ALUoperation, ALUresult, zero);
  DataMem m7 (ALUresult, Read_Data2, clk, Mem_Read, Mem_Write, Memout, res1, res2);
  mux_3_32 m8 (ALUresult, Memout,Pc4, MemtoReg, Write_Data);
  SignExtend m9 (instruction[15:0], seout);
  adder m10 (four , Pcout, Pc4);
  shl2 m11 (seout, shout);
  adder m12 (Pc4, shout, addout);
  mux_2_32 m13 (Pc4, addout, PCsrc, PCsel);
  PCadr m14 (instruction[25:0], Pcout[31:28], adrout);
  mux_3_32 m15 (PCsel, adrout, Read_Data1, jPC, Pcin);
  assign opcod = instruction[31:26];
  assign func = instruction[5:0];
  assign inst = instruction;
endmodule