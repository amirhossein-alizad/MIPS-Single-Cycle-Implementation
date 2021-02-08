`timescale 1ns/1ns
module InstMem(input [31:0] Address, output logic [31:0] instruction);
  logic [31:0] memory[0:199];
  initial begin
    $readmemb("1.txt", memory);
  end
  always @(Address) begin
    instruction = 32'b0;
    instruction = memory[Address[31:2]];
    $display("instruction is now: %b", instruction);
  end
endmodule