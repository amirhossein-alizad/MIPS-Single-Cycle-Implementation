`timescale 1ns/1ns
module test();
  logic clk = 0, rst;
  logic [31:0] res1, res2;
  Processor cut (clk, rst, res1, res2);
  always #10 clk = ~clk;
  initial begin
    #4000 $stop;
  end
endmodule

