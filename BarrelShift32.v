module Shift32(
    input [1:0] ALUFN,
    input [31:0] A,
    input [4:0] B,
    output reg [31:0] shift
);
    always @(*) begin
        case (ALUFN)
            2'b00: shift = A << B;
            2'b01: shift = A >> B;
            2'b11: shift = $signed(A) >>> B;
            default: shift = A; 
        endcase
    end
endmodule