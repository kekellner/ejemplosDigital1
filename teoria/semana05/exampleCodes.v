module gates(input wire [3:0] a, b, output wire [3:0] y1, y2, y3, y4, y5);

  assign y1 = a & b;    // AND
  assign y2 = a | b;    // OR
  assign y3 = a ^ b;    // XOR
  assign y4 = ~(a & b); // NAND
  assign y5 = ~(a | b); // NOR

endmodule

module sillyFunction(input wire a,b,c, output wire y);

  assign y = ~a & ~b & ~c |
              a & ~b & ~c |
              a & ~b &  c;
              
endmodule

module inv(input wire [3:0] a, output wire [3:0] y);

  assign y = ~a;

endmodule
