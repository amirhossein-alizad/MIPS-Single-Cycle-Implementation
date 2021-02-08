`timescale 1ns/1ns
module ALUcontrol(input [2:0] ALUop, input[5:0] func, output logic[2:0] ALUoperation);
  always @(ALUop, func) begin
    ALUoperation = 3'b0;
    case(ALUop)
      3'b000: ALUoperation = 3'b010;
      3'b001: ALUoperation = 3'b110;
      3'b010: begin
        case(func)
          6'b100_000: ALUoperation = 3'b010;
          6'b100_010: ALUoperation = 3'b110;
          6'b100_100: ALUoperation = 3'b0;
          6'b100_101: ALUoperation = 3'b001;
          6'b101_010: ALUoperation = 3'b111;
        endcase
      end
      3'b011: ALUoperation = 3'b010;
      3'b100: ALUoperation = 3'b0;
    endcase
  end
endmodule
