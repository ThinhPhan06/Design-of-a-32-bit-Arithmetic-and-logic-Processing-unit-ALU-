module Compare_32(
    input [1:0] ALUFN,
    input Z, V, N,
    output [31:0] cmp
);
    wire lsb;
    assign lsb = (ALUFN == 2'b01) ? Z :
                 (ALUFN == 2'b10) ? (N ^ V) :
                 (ALUFN == 2'b11) ? (Z | (N ^ V)) :
                 1'b0;
    assign cmp = {31'b0, lsb};
endmodule