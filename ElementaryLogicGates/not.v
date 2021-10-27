// NOT gate

`include "nand.v"

module NOT (
    output Y,
    input A
);

    NAND nand_gate(Y, A, A);

endmodule