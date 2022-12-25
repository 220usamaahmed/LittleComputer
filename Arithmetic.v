`include "../ElementaryLogicGates.v"

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

module ALU (
    output [15:0] out,
    output zr, ng,
    input [15:0] A, B,
    input za, na, zb, nb, f, no
);

    wire [15:0] za_out, na_out, zb_out, nb_out;
    wire not_za, not_zb;

    NOT not_1(not_za, za);
    NOT not_2(not_zb, zb);

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            AND and_gate_1(za_out[i], not_za, A[i]);
            AND and_gate_2(zb_out[i], not_zb, B[i]);

            XOR xor_gate_1(na_out[i], na, za_out[i]);
            XOR xor_gate_2(nb_out[i], nb, zb_out[i]);
        end
    endgenerate

    wire [15:0] bitwise_and, sum;

    AND16 and16 (bitwise_and, na_out, nb_out);
    ADD16 add16 (sum, na_out, nb_out);

    wire [15:0] f_out;

    MUX16 mux16 (f_out, f, bitwise_and, sum);

    genvar j;
    generate
        for (j = 0; j < 16; j = j + 1) begin
            XOR xor_gate_1(out[j], no, f_out[j]);
        end
    endgenerate

    assign ng = out[15];
    assign zr = out == 16'h0000;

endmodule