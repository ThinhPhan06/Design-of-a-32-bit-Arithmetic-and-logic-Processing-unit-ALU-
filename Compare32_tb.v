`timescale 1ns/1ps

module Compare32_tb;
    reg [1:0] ALUFN;
    reg Z, V, N;
    wire [31:0] cmp;
    
    Compare_32 uut (
        .ALUFN(ALUFN),
        .Z(Z),
        .V(V),
        .N(N),
        .cmp(cmp)
    );

    initial begin
        $dumpfile("Compare_test.vcd");
        $dumpvars(0, Compare32_tb);

        ALUFN = 2'b01; Z = 1; V = 0; N = 0;
        #10;
        $display("CMPEQ: Z = 1 => CMP = %d", cmp[0]);
        ALUFN = 2'b10; Z = 0; V = 1; N = 0;
        #10;
        $display("CMPLT with overflow: N = 0, V = 1 => CMP = %d", cmp[0]);
        ALUFN = 2'b11; Z = 1; V = 0; N = 0;
        #10;
        $display("CMPLE: Z = 1 => CMP = %d", cmp[0]);
        $finish;
    end         
endmodule
