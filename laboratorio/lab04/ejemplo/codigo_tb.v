// Esto es para aquellos que están usando iverilog de compilador
// Para los que usan apio pueden obviarlo
//`include "codigo.v"
// ` -> backtick
// ' -> comilla simple


module testbench();

  reg p1, p2, p3, p4, p5, p6;
  wire led1, led2;

  gateLevel   G1(p1, p2, p3, led1);
  operadores OP1(p4, p5, p6, led2);

  initial begin
    $display(" Tabla 1 y 2");
    $display("A B C | Y1 Y2");
    $display("------|------");
    $monitor("%b %b %b | %b  %b", p1, p2, p3, led1, led2);
       p1 = 0; p2 = 0; p3 = 0;
    #1 p1 = 0; p2 = 0; p3 = 1;
    #1 p1 = 0; p2 = 1; p3 = 0;
    #1 p1 = 0; p2 = 1; p3 = 1;
    #1 p1 = 1; p2 = 0; p3 = 0;
    #1 p1 = 1; p2 = 0; p3 = 1;
    #1 p1 = 1; p2 = 1; p3 = 0;
    #1 p1 = 1; p2 = 1; p3 = 1;
  end
  
  initial begin
    #9
    $display("\n");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", p4, p5, p6, led2);
       p4 = 0; p5 = 0; p6 = 0;
    #1 p4 = 0; p5 = 0; p6 = 1;
    #1 p4 = 0; p5 = 1; p6 = 0;
    #1 p4 = 0; p5 = 1; p6 = 1;
    #1 p4 = 1; p5 = 0; p6 = 0;
    #1 p4 = 1; p5 = 0; p6 = 1;
    #1 p4 = 1; p5 = 1; p6 = 0;
    #1 p4 = 1; p5 = 1; p6 = 1;
  end
  
  initial
    #20 $finish;
  
  initial begin
    $dumpfile("codigo_tb.vcd");
    $dumpvars(0, testbench);
  end
  
endmodule
