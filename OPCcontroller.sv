`timescale 1ns/1ns
module OPCcontroller(input [5:0] OPC, output logic RegWrite, ALUsrc, Mem_Read, Mem_Write, output logic [1:0] RegDst, jPC, MemtoReg, branch, output logic [2:0] ALUop);
  always @(OPC) begin
    {RegWrite, ALUsrc, Mem_Read, Mem_Write} = 4'b0;
    RegDst = 2'b0;
    jPC = 2'b0;
    branch = 2'b0;
    MemtoReg = 2'b0;
    ALUop = 3'b0;
    case(OPC)
      6'b0: begin 
        RegDst = 2'b01; RegWrite = 1; ALUsrc = 0; Mem_Read = 0; Mem_Write = 0; MemtoReg = 2'b0; branch = 2'b0; ALUop = 3'b010; jPC = 2'b0; 
      end
      6'b001_000: begin
        RegDst = 2'b0; RegWrite = 1; ALUsrc = 1; Mem_Read = 0; Mem_Write = 0; MemtoReg = 2'b0; branch = 2'b0; ALUop = 3'b011; jPC = 2'b0; 
      end
      6'b001_100: begin
        RegDst = 2'b0; RegWrite = 1; ALUsrc = 1; Mem_Read = 0; Mem_Write = 0; MemtoReg = 2'b0; branch = 2'b0; ALUop = 3'b100; jPC = 2'b0; 
      end
      6'b100_011: begin
        RegDst = 2'b0; RegWrite = 1; ALUsrc = 1; Mem_Read = 1; Mem_Write = 0; MemtoReg = 2'b01; branch = 2'b0; ALUop = 3'b0; jPC = 2'b0;
      end
      6'b101_011: begin
        RegWrite = 0; ALUsrc = 1; Mem_Read = 0; Mem_Write = 1; branch = 2'b0; ALUop = 3'b0; jPC = 2'b0;
      end
      6'b000_100: begin
        RegWrite = 0; ALUsrc = 0; Mem_Read = 0; Mem_Write = 0; branch = 2'b01; ALUop = 3'b001; jPC = 2'b0;
      end
      6'b000_101: begin 
        RegWrite = 0; ALUsrc = 0; Mem_Read = 0; Mem_Write = 0; branch = 2'b10; ALUop = 3'b001; jPC = 2'b0;
      end
      6'b000_010: begin
        jPC = 2'b01;
      end
      6'b000_011: begin
        jPC = 2'b10;
      end
      6'b001_001: begin
        jPC = 2'b01; RegDst = 2'b10; MemtoReg = 2'b10; RegWrite = 1;
      end
    endcase
  end
endmodule