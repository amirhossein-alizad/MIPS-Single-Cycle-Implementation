`timescale 1ns/1ns
module ALU(input [31:0] A,B, input[2:0] ALUoperation, output logic [31:0] ALUResult, output logic zero);
  always @(A,B,ALUoperation) begin
    {ALUResult, zero} = 33'b0;
    case (ALUoperation)
      3'b000: ALUResult = A & B;
      3'b001: ALUResult = A | B;
      3'b010: ALUResult = A + B;
      3'b110: begin 
        ALUResult = A - B;
        if (A == B) zero = 1'b1;
        else  zero = 1'b0;
      end
      3'b111: begin
        if({~A[31], A[30:0]} < {~B[31],B[30:0]}) ALUResult = {31'b0,1'b1};
        else ALUResult = 32'b0;
      end
    endcase
    $display("A is : %d and B is : %d", A, B);
    $display("ALU result is : %d", ALUResult);
  end
endmodule  