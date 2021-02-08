`timescale 1 ns/1ns
module DataMem(input [31:0] Address, Write_Data, input clk, Mem_Read, Mem_Write, 
              output logic[31:0] Read_Data, output[31:0]out1, out2);
  logic [31:0]memory[0:7999];
  initial begin
    $readmemb("array.txt", memory, 250);
  end
  
  always@(Address, Mem_Read) begin
    Read_Data = 32'b0;
    if (Mem_Read)
      Read_Data = memory[Address[31:2]];
      $display("Read_Data is : %d from : %d", Read_Data,Address);
  end
  
  always@(posedge clk) begin
    if(Mem_Write) 
      memory[Address[31:2]] <= Write_Data;
      $display("Write_Data : %d being written in : %d", Write_Data, Address[31:2]);
  end
  assign out1 = memory[500];
  assign out2 = memory[501];
endmodule
    
   
    
    
  
