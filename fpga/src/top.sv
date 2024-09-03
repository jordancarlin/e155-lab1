// top.sv
// Jordan Carlin, jcarlin@hmc.edu, 2 September 2024
// Top-level module for the E155 Lab 1 FPGA design

module top (
  input  logic       clk,
  input  logic [3:0] s,
  output logic [2:0] led,
  output logic [6:0] segs
);

  // Logic driven LEDs
  assign led[0] = s[0] ^ s[1];
  assign led[1] = s[2] & s[3];

  // Pulse driven LED
  pulse #(20000000) pulse (.clk, .led(led[2]));

  // Seven-segment display decoder
  seg_decoder seg_decoder (.s, .segs);

endmodule
