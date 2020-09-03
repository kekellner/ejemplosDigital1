module testbench();
    reg p1, p2, p3;
    wire led;
    
    t01POS U1(p1, p2, p3, led);
    
    initial begin
        $display("A B C | Y ");
        $display("------|--");
        $monitor("%b %b %b | %b", p1, p2, p3, led);
           p1 = 0; p2 = 0; p3 = 0;
        #1 p1 = 0; p2 = 0; p3 = 1;
        #1 p1 = 0; p2 = 1; p3 = 0;
        #1 p1 = 0; p2 = 1; p3 = 1;
        #1 p1 = 1; p2 = 0; p3 = 0;
        #1 p1 = 1; p2 = 0; p3 = 1;
        #1 p1 = 1; p2 = 1; p3 = 0;
        #1 p1 = 1; p2 = 1; p3 = 1;
    end

endmodule
