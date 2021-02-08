`timescale 1ns/1ns
module mux_3_5(input [4:0] inp1,inp2,inp3, input [1:0] select, output [4:0] out);
  assign out = select[1] ? inp3 : (select[0] ? inp2 : inp1);
endmodule