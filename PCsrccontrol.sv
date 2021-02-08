`timescale 1ns/1ns
module PCsrccontrol(input [1:0] branch , input zero, output PCsrc);
  assign PCsrc = (branch[0] & zero) | (branch[1] & ~zero);
endmodule
  