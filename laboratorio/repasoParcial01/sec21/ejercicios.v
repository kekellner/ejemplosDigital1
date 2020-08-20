/* n selectores para 2^n entradas de datos
   Por ejemplo:
   
   Si mi mux tiene n=2 selectores entonces voy a tener 2^n = 2^2 = 4
   señales de datos.
   
   Y SIEMPRE sólo 1 salida
   
*/

module mux4to1(input wire [1:0] S, input wire [3:0] D, output wire Y);
    
    assign Y = S[1] ? (S[0] ? D[3]:D[2]) : (S[0] ? D[1]:D[0]);
    /*
        if (S[1] == 1):
            if (S[0] == 1):
                Y = D[3]
            elif (S[0] == 0):
                Y = D[2]
        elif (S[1] == 0):
            if ((S[0] == 1):
                Y = D[1]
            elif (S[0] == 0):
                Y = D[0]
    */
    
endmodule
