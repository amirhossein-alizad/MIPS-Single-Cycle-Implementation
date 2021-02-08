`timescale 1ns/1ns
module mux_3_32(input [31:0] inp1,inp2,inp3, input[1:0] select, output [31:0] out);
  assign out = select[1] ? inp3 : (select[0] ? inp2 : inp1);
endmodule