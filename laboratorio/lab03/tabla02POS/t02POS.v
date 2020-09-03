module t01POS(input wire a, b, c, output wire y);
    
    wire w1, w2, w3, w4, w5;
    wire notA, notB, notC;
    
    not (notA, a);
    not (notB, b);
    not (notC, c);
    
    or (w1, notA, notB, notC);
    or (w2, notA, B, notC);
    or (w3, a, notB, notC);
    or (w4, a, notB, c);
    or (w5, a, b, c);
    
    and (y, w1, w2, w3, w4, w5);
    
endmodule
