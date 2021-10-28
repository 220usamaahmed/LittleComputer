`include "not.v"

module OR (
    output Y,
    input A, B
);

    wire notA, notB;
    NOT not_gate_1(notA, A);
    NOT not_gate_2(notB, B);
    NAND nand_gate(Y, notA, notB);

endmodule