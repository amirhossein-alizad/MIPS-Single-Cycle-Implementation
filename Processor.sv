`timescale 1ns/1ns
module Processor(input clk, rst, output[31:0] res1, res2);
  logic [5:0] OPC, func;
  logic RegWrite, ALUsrc, Mem_Read, Mem_Write, PCsrc, zero;
  logic [1:0] RegDst, jPC, MemtoReg, branch;
  logic [2:0] ALUop, ALUoperation;
  
  
  controller m1(clk, zero, OPC,func, RegWrite, ALUsrc, Mem_Read, Mem_Write, PCsrc, RegDst,jPC, MemtoReg, ALUoperation);
  DataPath m2 (clk, rst, RegWrite, ALUsrc, Mem_Read, Mem_Write, PCsrc, RegDst, jPC, MemtoReg, ALUoperation, 
                OPC, func, zero, res1, res2);
endmodule

