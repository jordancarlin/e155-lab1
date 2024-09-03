// pulse.sv
// Jordan Carlin, jcarlin@hmc.edu, 2 September 2024
// Pulse module that outputs a configuirable frequency signal

module pulse #(parameter THRESHOLD = 100) (
  input  logic clk,
  output logic led
);

  logic        ck_stb;
  logic [31:0] counter;

  // Generate sloer clock signal
  always_ff @(posedge clk)
    ck_stb <= (counter == THRESHOLD-1'b1);

  // Toggle the LED when the counter reaches the threshold
  always_ff @(posedge clk) begin
    if (ck_stb) begin
      led <= ~led;
      counter <= 0;
    end else
      counter <= counter + 1;
  end
endmodule
