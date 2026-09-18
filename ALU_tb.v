`timescale 1ns/1ps

module ALU_tb;
    reg [31:0] A, B;
    reg [5:0] ALUFN;
    wire [31:0] ALU_out;
    wire Z, V, N;

    ALU uut(
        .ALUFN(ALUFN),
        .A(A),
        .B(B),
        .ALU_out(ALU_out),
        .Z(Z),
        .V(V),
        .N(N)
    );

    initial begin
        $dumpfile("ALU_test.vcd");
        $dumpvars(0, ALU_tb);
    
    A = 32'd10; B = 32'd20; ALUFN = 6'b000000;
    #10;
    $display("ADD: 10 + 20 = %d | Z = %b V = %b N = %b", ALU_out, Z, V, N);

    A = 32'h7FFFFFFF; B = 32'h7FFFFFFF; ALUFN = 6'b000000;
    #10;
    $display("Overflow ADD test: | Z = %b V = %b N = %b", Z, V, N);

    A = 32'd10; B = 32'd20;
    ALUFN = 6'b000001;
    #10;
    $display("ADD: 10 - 20 = %d | N = %b", $signed(ALU_out), N);

    A = 32'hF0F0F0F0; B = 32'hFFFFFFFF;
    ALUFN = 6'b011000; 
    #10;
    $display("AND: Result = %h", ALU_out);

    A = 32'd1; B = 32'd4;
    ALUFN = 6'b100000;
    #10;
    $display("SHL: 1 << 4 = %d", ALU_out);

    A =32'd10; B = 32'd0;
    ALUFN = 6'b100001;
    #10;
    $display("SHR: 10 << 0 = %d", ALU_out);

    A = 32'd10; B = 32'd31;
    ALUFN = 6'b100000;
    #10;
    $display("SHL: 10 << 32 = %d", ALU_out);

    A = 32'd10; B = 32'd10;
    ALUFN = 6'b110011;
    #10;
    $display("CMPEQ: 10 == 10? result = %d", ALU_out[0]);
    
    A = 32'h7FFFFFFF; B = 32'h00000001;
    ALUFN = 6'b000000; 
    #10;
    $display("OVERFLOW: 0x7FFFFFFF + 0x1 = 0x%h | Z=%b V=%b N=%b", ALU_out, Z, V, N);
    
    A = 32'h7FFFFFFF; B = 32'h80000000;
    ALUFN = 6'b110101; 
    #10;
    $display("CMPLT with overflow condition: Result = %d | Z=%b V=%b N=%b", ALU_out[0], Z, V, N);
    
    A = 32'd10; B = 32'd2;
    ALUFN = 6'b101000;
    #10;
    $display("Multiply 10 x 2: result = %d", ALU_out);
    
    A = -32'd10; B = 32'd2;
    ALUFN = 6'b101000;
    #10;
    $display("Multiply -10 x 2: result = %d", $signed(ALU_out));
    
    $finish;
    end
endmodule


