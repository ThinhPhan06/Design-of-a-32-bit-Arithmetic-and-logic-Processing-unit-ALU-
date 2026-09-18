module ALU(
    input [31:0] A, B,
    input [5:0] ALUFN,
    output [31:0] ALU_out,
    output Z, V, N
);
    wire[31:0] add_res, boole_res, shift_res, cmp_res, mul_res;
    wire z_out, v_out, n_out;

    adder_32 adder_unit(
        .A(A), .B(B), .ALUFN0(ALUFN[0]),
        .S(add_res), .Z(z_out), .V(v_out), .N(n_out)
    );
    Boolen_32 boole_unit(
        .A(A), .B(B), .ALUFN(ALUFN[3:0]),
        .boole(boole_res)
    );
    Shift32 shift_unit(
        .A(A), .B(B[4:0]), .ALUFN(ALUFN[1:0]),
        .shift(shift_res)
    );
    Compare_32 cmp_unit(
        .Z(z_out), .V(v_out), .N(n_out),
        .ALUFN(ALUFN[2:1]),
        .cmp(cmp_res)
    );

    assign Z = z_out;
    assign V = v_out;
    assign N = n_out;

    assign mul_res = A * B;
    assign ALU_out = (ALUFN[5:4] == 2'b00) ? add_res:
                     (ALUFN[5:4] == 2'b01) ? boole_res:
                     (ALUFN[5:4] == 2'b10) ? (ALUFN[3] ? mul_res : shift_res):
                     cmp_res;
endmodule