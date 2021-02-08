`timescale 1ns/1ns
module controller(input clk,zero, input[5:0] OPC,func, output RegWrite, ALUsrc, Mem_Read, Mem_Write, PCsrc, output [1:0] RegDst,jPC, MemtoReg, output [2:0] ALUoperation);
  logic [1:0] branch;
  logic [2:0] ALUop;
  OPCcontroller m1 (OPC, RegWrite, ALUsrc, Mem_Read, Mem_Write, RegDst, jPC, MemtoReg, branch, ALUop);
  PCsrccontrol m2 (branch, zero, PCsrc);
  ALUcontrol m3 (ALUop, func, ALUoperation);
endmodule