// lab1_tb.sv
// Jordan Carlin, jcarlin@hmc.edu, 2 September 2024
// Testbench for the E155 Lab 1 FPGA design

`timescale 1ns/1ns
`default_nettype none
`define N_TV 16

module lab1_tb();
  // Set up test signals
  logic       clk;
  logic [3:0] s;
  logic [2:0] led, led_expected;
  logic [6:0] segs, segs_expected;
  logic [31:0] vectornum, errors;
  logic [12:0] testvectors[10000:0]; // Vectors of format s[3:0]_led0_led1_segs[6:0]

  // Instantiate the device under test
  top dut(.*);

  // Generate clock signal with a period of 10 timesteps.
  always begin
    clk = 1; #5;
    clk = 0; #5;
  end
  
  // At the start of the simulation:
  //  - Load the testvectors
  //  - Pulse the reset line (if applicable)
  initial begin
    $readmemb("lab1_testvectors.tv", testvectors, 0, `N_TV - 1);
    vectornum = 0; errors = 0;
  end

  // Apply test vector on the rising edge of clk
  always @(posedge clk) begin
    #1; {s, led_expected[0], led_expected[1], segs_expected} = testvectors[vectornum];
  end

  // Create dumpfile for signals
  initial begin
    $dumpfile("lab1_tb.vcd");
    $dumpvars(0, lab1_tb);
  end

  // Check results on the falling edge of clk
  always @(negedge clk) begin
    if (led[0] != led_expected[0] || led[1] != led_expected[1] || segs[0] != segs_expected[0]) begin
      $display("Error: inputs: s=%b", s);
      $display(" outputs: led[0]=%b (%b expected), led[1]=%b (%b expected), segs=%b (%b expected)", led[0], led_expected[0], led[1], led_expected[1], segs, segs_expected);
      errors = errors + 1;
    end

    vectornum = vectornum + 1;
    if (testvectors[vectornum] === 13'bx) begin
      $display("%d tests completed with %d errors.", vectornum, errors);
      $stop;
    end
  end
endmodule
