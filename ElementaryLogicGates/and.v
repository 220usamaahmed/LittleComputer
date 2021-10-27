`include "not.v"

module AND (
    output Y,
    input A, B
);

    wire T;
    NAND nand_gate(T, A, B);
    NOT not_gate(Y, T);

endmodule