// top.sv
// Jordan Carlin, jcarlin@hmc.edu, 2 September 2024
// 7-segment LED decoder

module seg_decoder(
  input logic [3:0] s,
  output logic [6:0] segs
);

  always_comb
    case(s)
      4'b0000: segs = 7'b0111111; // 0
      4'b0001: segs = 7'b0000110; // 1
      4'b0010: segs = 7'b1011011; // 2
      4'b0011: segs = 7'b1001111; // 3
      4'b0100: segs = 7'b1100110; // 4
      4'b0101: segs = 7'b1101101; // 5
      4'b0110: segs = 7'b1111101; // 6
      4'b0111: segs = 7'b0000111; // 7
      4'b1000: segs = 7'b1111111; // 8
      4'b1001: segs = 7'b1100111; // 9
      4'b1010: segs = 7'b1110111; // A
      4'b1011: segs = 7'b1111100; // B
      4'b1100: segs = 7'b0111001; // C
      4'b1101: segs = 7'b1011110; // D
      4'b1110: segs = 7'b1111001; // E
      4'b1111: segs = 7'b1110001; // F
    endcase

endmodule
