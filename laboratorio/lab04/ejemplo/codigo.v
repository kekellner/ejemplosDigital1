// Ecuación a implementar: Y = (A * B * C') + (B + C)';


module gateLevel(input wire A, B, C, output wire Y);

  wire w1, w2, w3, w4;

  not (w1, C);
  and (w2, A, B, w1);
  or  (w3, B, C);
  not (w4, w3);
  or  (Y, w2, w4);

endmodule

module operadores(input wire A, B, C, output wire Y);

  assign Y = (A & B & ~C) | ~(B | C);

endmodule
