module decoder1to2(input wire a, output wire y1, y0);
    
    assign y1 = ~a;
    assign y0 = a;
    
endmodule

// [1:0] a === a1 a0 (2 bits)
// [3:0] y === y3 y2 y1 y0 (4 bits)
// input wire [1:0] a, output wire [3:0] y)
module decoder2to4(output wire [3:0] y, input wire [1:0] a);
    
    wire y3p, y2p, y1p, y0p;
    
    decoder1to2 U0(a[1], y3p, y2p);
    decoder1to2 U1(a[0], y1p, y0p);
    
    assign y[3] = y3p & y1p;
    assign y[2] = y3p & y0p;
    assign y[1] = y2p & y1p;
    assign y[0] = y2p & y0p;
    
endmodule

/*

Quiero implementar esta tabla de verdad:

    A B | Y
   -----|---
    0 0 | 0
    0 1 | 1
    1 0 | 1
    1 1 | 0

*/

module eje1(input wire a, b, output wire y);

    wire [3:0] yp;
    decoder2to4 U1(yp, {a,b});
    assign y = yp[1] | yp[2]; // Esta es la SOP
    
endmodule
