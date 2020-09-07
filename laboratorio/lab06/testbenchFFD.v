`include "ejemploFFD.v"

module testbench();
    
    reg clk, reset, D;
    wire Q;
    
    FF U1(clk, reset, D, Q);

    initial begin
       $display("clk reset D | Q");
       $monitor("%b %b %b | %b", clk, reset, D, Q);
    end

    initial begin
        clk = 0;
        reset = 0;
        D = 0;
        //#1 reset = 1;
        //#1 reset = 0;
        #11 D = 1;
        #100
        $finish;
    end
    
    always
        #5 clk = ~clk;
        
    initial begin
        $dumpfile("timing.vcd");
        $dumpvars(0, testbench);
    end

endmodule
