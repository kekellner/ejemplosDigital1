module t01POS(input wire a, b, c, output wire y);
    
    wire w1, w2, w3;
    wire notA, notB, notC;
    
    not (notA, a);
    not (notB, b);
    not (notC, c);
    
    or (w1, a, b, notC);
    or (w2, a, notB, notC);
    or (w3, notA, notB, c);
    
    and (y, w1, w2, w3);
    
endmodule
