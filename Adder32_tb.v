`timescale 1ns/1ps

module Adder32_tb;
    reg [31:0] A, B;
    reg ALUFN0;
    wire [31:0] S;
    wire Z, V, N;
    
    adder_32 uut (
        .A(A),
        .B(B),
        .ALUFN0(ALUFN0),
        .S(S),
        .Z(Z),
        .V(V),
        .N(N)
    );
    
    initial begin
        
        $dumpfile("adder_test.vcd");
        $dumpvars(0, Adder32_tb);
        
        A = 32'd10; B = 32'd20; ALUFN0 = 0;
        #10;
        $display("Test 1 - Addition: %d + %d = %d, Z=%b, V=%b, N=%b", A, B, S, Z, V, N);
        
        A = 32'd50; B = 32'd30; ALUFN0 = 1;
        #10;
        $display("Test 2 - Subtraction: %d - %d = %d, Z=%b, V=%b, N=%b", A, B, S, Z, V, N);
        
        A = 32'd100; B = 32'd100; ALUFN0 = 1;
        #10;
        $display("Test 3 - Zero result: %d - %d = %d, Z=%b, V=%b, N=%b", A, B, S, Z, V, N);
        
        A = 32'd20; B = 32'd50; ALUFN0 = 1;
        #10;
        $display("Test 4 - Negative result: %d - %d = %d, Z=%b, V=%b, N=%b", A, B, S, Z, V, N);
        
        A = 32'hFFFFFFFF; B = 32'h00000001; ALUFN0 = 0;
        #10;
        $display("Test 5 - Overflow: 0x%h + 0x%h = 0x%h, Z=%b, V=%b, N=%b", A, B, S, Z, V, N);
        
        A = 32'h7FFFFFFF; B = 32'h00000001; ALUFN0 = 0;
        #10;
        $display("Test 6 - Signed overflow: 0x%h + 0x%h = 0x%h, Z=%b, V=%b, N=%b", A, B, S, Z, V, N);
        
        #10;
        $display("\nHoan thanh tat ca cac test!");
        $finish;
    end
endmodule
