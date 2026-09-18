module Boolen_32(
    input [3:0] ALUFN,
    input [31:0] A, B,
    output [31:0] boole
);
    genvar i;
    generate
        for(i = 0; i < 32; i = i + 1) begin: gen_mux
        assign boole[i] = (B[i]) ? ((A[i]) ? ALUFN[3] : ALUFN[2] ) : ((A[i]) ? ALUFN[1] : ALUFN[0]);
        end  
    endgenerate
endmodule