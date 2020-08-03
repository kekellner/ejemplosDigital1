//`include "exampleCodes.v

module testbench();


// Variables para probar el módulo gates
reg [3:0] A, B;
wire [3:0] Y1, Y2, Y3, Y4, Y5;

// Variables para probar el módulo sillyFunction
reg a1, b1, c1;
wire y;

gates U1(A, B, Y1, Y2, Y3, Y4, Y5);
sillyFunction U2(a1, b1, c1, y);

initial begin
  $display("A\tB\tY1\tY2\tY3\tY4\tY5");
  $monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b", A, B, Y1, Y2, Y3, Y4, Y5);
  A = 4'b0000; B = 4'd0;
  #1 A = 4'b0001; B = 4'd1;
  #1 A = 4'd7; B = 4'd3;
end

initial begin
  #30
  $display("a b c | y");
  $display("------|--");
  $monitor("%b %b %b | %b", a1, b1, c1, y);
     a1 = 0; b1 = 0; c1 = 0;
  #1 a1 = 0; b1 = 0; c1 = 1;
  #1 a1 = 0; b1 = 1; c1 = 0;
  #1 a1 = 0; b1 = 1; c1 = 1;
  #1 a1 = 1; b1 = 0; c1 = 0;
  #1 a1 = 1; b1 = 0; c1 = 1;
  #1 a1 = 1; b1 = 1; c1 = 0;
  #1 a1 = 1; b1 = 1; c1 = 1;
end

initial
  #50 $finish;

initial begin
  $dumpfile("exampleCodes_tb.vcd");
  $dumpvars(0, testbench);
end

endmodule
