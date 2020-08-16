//`include "ejemplo.v"

module testbench();

    reg p1, p0;
    wire y;

    eje1 U1(p1, p0, y);
    
    initial begin
       $display(" A B | Y ");
       $display("-----|---");
       $monitor("%b %b | %b", p1, p0, y);
          p1 = 0; p0 =0;
       #1 p1 = 0; p0 =1;
       #1 p1 = 1; p0 =0;
       #1 p1 = 1; p0 =1;
    end
    
    initial
        #5 $finish;
    
    initial begin
        $dumpfile("testbench_tb.vcd");
        $dumpvars(0, testbench);
    end
endmodule
