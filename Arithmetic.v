// `include "./ElementaryLogicGates.v"

module HALFADDER(
    output sum, carry, 
    input A, B
    );

    XOR xor_gate(sum, A, B);
    AND and_gate(carry, A, B);

endmodule

module FULLADDER(
    output sum, carry,
    input A, B, C
    );

    wire ha1_sum, ha1_carry, ha2_carry;

    HALFADDER ha1(.sum(ha1_sum), .carry(ha1_carry), .A(A), .B(B));
    HALFADDER ha2(.sum(sum), .carry(ha2_carry), .A(C), .B(ha1_sum));
    OR or_gate(carry, ha1_carry, ha2_carry);

endmodule