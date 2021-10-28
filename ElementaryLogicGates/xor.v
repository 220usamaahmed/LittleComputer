`include "nand.v"

module XOR (
    output Y,
    input A, B
);

    wire T1, T2, T3;
    NAND nand_gate_1(T1, A, B);
    NAND nand_gate_2(T2, T1, A);
    NAND nand_gate_3(T3, T1, B);
    NAND nand_gate_4(Y, T2, T3);

endmodule