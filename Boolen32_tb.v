`timescale 1ns/1ps

module Boolen32_tb;
    reg [3:0] ALUFN;
    reg [31:0] A, B;
    wire[31:0] boole;
    Boolen_32 uut(
        .ALUFN(ALUFN),
        .A(A),
        .B(B),
        .boole(boole)
    );

    initial begin
        $dumpfile("Boolen_test.vcd");
        $dumpvars(0, Boolen32_tb);
        
        ALUFN = 4'b1000;
        A = 32'hF0F0F0F0; B = 32'hFFFF0000;
        #10;
        
        ALUFN = 4'b1110;
        A = 32'hF0F0F0F0; B = 32'h0F0F0F0F;
        #10;

        ALUFN = 4'b1010;
        A = 32'h12345678; B = 32'hFFFFFFFF;
        #10;

        ALUFN = 4'b0110;
        A = 32'hF0F0FF00; B = 32'h0F0F0F0F;
        #10;
        $finish;
    end
endmodule