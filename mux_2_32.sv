`timescale 1ns/1ns
module mux_2_32(input [31:0] inp1, inp2,input select, output[31:0] out);
  assign out = select ? inp2 : inp1;
endmodule