`timescale 1ns/1ps

module BarrelShift32_tb;
    reg [1:0] ALUFN0;
    reg [31:0] A;
    reg [4:0] B;
    wire [31:0] shift;

    Shift32 uut(
        .ALUFN(ALUFN0),
        .A(A),
        .B(B),
        .shift(shift)
    );

    initial begin 
        $dumpfile("Barrel_test.vcd");
        $dumpvars(0, BarrelShift32_tb);

        A = 32'd10; B = 5'd16; ALUFN0 = 2'b00;
        #10;
        
        A = 32'd12; B = 5'd12; ALUFN0 = 2'b01;
        #10;

        A = -32'd11; B = 5'd31; ALUFN0 = 2'b11;
        #10;
        $finish;
    end
endmodule

