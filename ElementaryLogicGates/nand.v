// NAND gate (primitive)

module NAND (
    output Y,
    input A, B
);

    wire T;
    and(T, A, B);
    not(Y, T);

endmodule