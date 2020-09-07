`include "ejemploFFD.v"

module testbench();
    
    reg clk, reset, A, B;
    wire Y;
    wire [1:0] S_futuro, S_presente;
    
    ejercicio1 U1(A, B, clk, reset, Y, S_presente, S_futuro);

    initial begin
       $display("clk reset A B Sf S | Y");
       $monitor("%b %b %b %b %b %b | %b", clk, reset, A, B, S_futuro, S_presente, Y);
    end

    initial begin
        clk = 0;
        reset = 0;
        A = 0;
        B = 0;
        #1 reset = 1;
        #1 reset = 0;
        #10
        A = 1;
        B = 0;
        #20
        A = 0;
        B = 0;
        #10
        A = 1;
        B = 1;
        #30
        A = 0;
        B = 1;
    end
    
    initial
        #100 $finish;
    
    always
        #5 clk = ~clk;
        
    initial begin
        $dumpfile("timing.vcd");
        $dumpvars(0, testbench);
    end

endmodule
