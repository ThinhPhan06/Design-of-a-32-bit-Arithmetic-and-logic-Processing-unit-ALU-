module full_adder(
    input a, b, cin,
    output s, cout
);
    assign s = a ^ b ^ cin;
    assign cout = (a&b) | (b&cin) | (a&cin);
endmodule

module adder_32(
    input [31:0] A,
    input [31:0] B,
    input       ALUFN0,
    output [31:0] S,
    output       Z, V, N
);
    wire [31:0] B_mux;
    wire [32:0] carry;

    assign carry[0] = ALUFN0;
    assign B_mux = B ^ {32{ALUFN0}};

    genvar i;
    generate
        for(i = 0; i < 32; i = i + 1) begin: gen_adder
            full_adder fa(
                .a(A[i]),
                .b(B_mux[i]),
                .cin(carry[i]),
                .s(S[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate
    
    assign N = S[31];
    assign V = (A[31] & B_mux[31] & ~S[31]) | (~A[31] & ~B_mux[31] & S[31]);
    assign Z = (S == 32'b0);
endmodule