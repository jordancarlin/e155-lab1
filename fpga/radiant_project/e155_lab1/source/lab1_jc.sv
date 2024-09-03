// lab1_jc.sv
// Jordan Carlin, jcarlin@hmc.edu, 2 September 2024
// FPGA implementation for E155 Lab 1

module lab1_jc (
  input  logic [3:0] s,
  output logic [2:0] led,
  output logic [6:0] segs
);

	logic clk;

	// Internal high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));

	// Main verilog module
	top top (.clk, .s, .led, .segs);
endmodule
