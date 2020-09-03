module t01POS(input wire a, b, c, output wire y);
    
    wire w1, w2, w3, w4, w5;
    wire notA, notB, notC;
    
    not (notA, a);
    not (notB, b);
    not (notC, c);
    
    and (w1, notA, notB, notC);
    and (w2, notA, B, notC);
    and (w3, a, notB, notC);
    and (w4, a, notB, c);
    and (w5, a, b, c);
    
    or (y, w1, w2, w3, w4, w5);
    
endmodule
