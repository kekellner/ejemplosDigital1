module FFD (input clk, reset, D, output reg Q);

  always @ (posedge clk or posedge reset) begin
    if (reset)
      Q <= 1'b0;
    else
      Q <= D;
  end
endmodule

// Flip Flop D de 2 bits implementado con FF de 1 bit

module FFD_2(input clk, reset, input [1:0] D, output reg [1:0] Q);

    FFD U1(clk, reset, D[1], Q[1]);
    FFD U2(clk, reset, D[0], Q[0]);

endmodule

// Flip Flop D de 2 bits implementado en 1 sólo módulo

module FFD_2 (input clk, reset, input [1:0] D, output reg [1:0] Q);

  always @ (posedge clk or posedge reset) begin
    if (reset)
      Q <= 2'b0;
    else
      Q <= D;
  end
endmodule

module FFD_2 (input clk, reset, input [1:0] D, output reg [1:0] Q);

  always @ (posedge clk or posedge reset) begin
    if (reset)
      Q <= 2'b0;
    else
      Q[1] <= D[1];
      Q[0] <= D[0];
  end
endmodule

module ejercicio1(input A, B, clk, reset, output wire Y, output wire [1:0] S_presente, S_futuro);

    // Cables necesarios para interconexiones
    wire S0_presente, S1_presente, S0_futuro, S1_futuro;
    
    // Nube combinacional del estado futuro
    assign S0_futuro = (~S1_presente & ~S0_presente & A);
    assign S1_futuro = (S0_presente & B) | (S1_presente & A & B);
    // Nube combinacional de las salidas (FSM de Mealy)
    assign Y = (S1_presente & ~S0_presente & A & B);
    
    FFD S1(.clk(clk), .reset(reset), .D(S1_futuro), .Q(S1_presente));
    FFD S0(clk, reset, S0_futuro, S0_presente);
    
    // Queremos ver los estados actuales y futuros para
    // ver si nuestra FSM funciona bien
    assign S_presente = {S1_presente, S0_presente};
    assign S_futuro = {S1_futuro, S0_futuro};

endmodule
