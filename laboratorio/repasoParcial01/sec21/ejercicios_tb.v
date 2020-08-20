module testbench();
    
    //wire [1:0] S;
    //wire [3:0] D;
    wire Y;
    reg [5:0] temp;
    integer i;
    
    mux4to1 U1(temp[5:4], temp[3:0], Y);
    
    initial begin
        $display("\tS\tD\tY");
        $monitor("\t%b\t%b\t%b", temp[5:4], temp[3:0], Y);
        temp = 6'd0;
        for (i = 0; i < 64; i++) begin
            #1 temp = i;
            
        end
        $finish;
    end
    
endmodule
