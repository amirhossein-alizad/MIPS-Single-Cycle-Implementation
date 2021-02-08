`timescale 1ns/1ns
module RegFile(input [4:0]Read_Reg1, Read_Reg2, Write_Reg, input[31:0]Write_Data, input clk, RegWrite,
               output logic[31:0] Read_Data1, Read_Data2);
               
  logic [31:0] registers [0:31];
  initial registers[0] = 32'b0;
  
  assign Read_Data2 = registers[Read_Reg2];
  assign Read_Data1 = registers[Read_Reg1];
  always @(Read_Reg1,Read_Reg2) begin
    $display("Read_Data1 is now : %d and Read_Data2 is : %d", Read_Data1, Read_Data2);
  end
  always@(posedge clk) begin
    if (RegWrite) begin
      if (Write_Reg != 0) 
        registers[Write_Reg] <= Write_Data;
        $display("%d being written in register %d", Write_Data, Write_Reg);
    end
  end
  
endmodule
    
  
  