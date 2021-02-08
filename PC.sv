`timescale 1ns/1ns
module PC(input [31:0] Pcin, input clk, rst, output logic[31:0] Pcout);
  initial Pcout = 32'b0;
  always @(posedge clk, posedge rst) begin
    if (rst) Pcout <= 32'b0;
    else Pcout <= Pcin;
    $display("PC is now: %d ", Pcout);
  end
endmodule