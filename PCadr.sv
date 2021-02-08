`timescale 1ns/1ns
module PCadr(input[25:0] adrin,input[3:0]Pcout, output[31:0]adrout);
  assign adrout = {Pcout,adrin,2'b00};
endmodule
