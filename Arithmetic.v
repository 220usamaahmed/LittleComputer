// `include "./ElementaryLogicGates.v"

module HALFADDER (
    output sum, carry, 
    input A, B
    );

    XOR xor_gate(sum, A, B);
    AND and_gate(carry, A, B);

endmodule

module FULLADDER (
    output sum, carry,
    input A, B, C
    );

    wire ha1_sum, ha1_carry, ha2_carry;

    HALFADDER ha1(.sum(ha1_sum), .carry(ha1_carry), .A(A), .B(B));
    HALFADDER ha2(.sum(sum), .carry(ha2_carry), .A(C), .B(ha1_sum));
    OR or_gate(carry, ha1_carry, ha2_carry);

endmodule

module ADD16 (
    output [15:0] sum,
    input [15:0] A, B
);

    wire [15:0] carry;

    HALFADDER ha(.sum(sum[0]), .carry(carry[0]), .A(A[0]), .B(B[0]));

    genvar i;
    generate
        for (i = 1; i < 16; i = i + 1) begin
            FULLADDER fa(.sum(sum[i]), .carry(carry[i]), .A(A[i]), .B(B[i]), .C(carry[i - 1]));
        end
    endgenerate

endmodule

module INC16 (
    output [15:0] Y,
    input [15:0] A
);

    ADD16 add16(.sum(Y), .A(A), .B(16'h0001));

endmodule