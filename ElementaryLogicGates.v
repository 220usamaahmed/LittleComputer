//------------------------------------------------------------------------------
// Elementary Logic Gates
// Each gate only uses the gates defined before in its implementation.
//------------------------------------------------------------------------------

module NAND (
    output Y,
    input A, B
);

    wire T;
    and(T, A, B);
    not(Y, T);

endmodule

module NOT (
    output Y,
    input A
);

    NAND nand_gate(Y, A, A);

endmodule

module AND (
    output Y,
    input A, B
);

    wire T;
    NAND nand_gate(T, A, B);
    NOT not_gate(Y, T);

endmodule

module OR (
    output Y,
    input A, B
);

    wire notA, notB;
    NOT not_gate_1(notA, A);
    NOT not_gate_2(notB, B);
    NAND nand_gate(Y, notA, notB);

endmodule

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

module MUX (
    output Y,
    input S, A, B
);

    wire not_S, and_nSA, and_SB;
    
    NOT not_gate(not_S, S);

    AND and_gate_1(and_nSA, not_S, A);
    AND and_gate_2(and_SB, S, B);
    OR or_gate(Y, and_nSA, and_SB);

endmodule

module DMUX (
    output X, Y,
    input S, A
);

    wire not_S;
    NOT not_gate(not_S, S);
    AND and_gate_1(X, not_S, A);
    AND and_gate_2(Y, S, A);

endmodule

module NOT16 (Y, A);

    input [15:0] A;
    output [15:0] Y;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            NOT not_gate(Y[i], A[i]);
        end
    endgenerate

endmodule

module AND16 (Y, A, B);

    input [15:0] A;
    input [15:0] B;
    output [15:0] Y;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            AND and_gate(Y[i], A[i], B[i]);
        end
    endgenerate

endmodule

module OR16 (Y, A, B);

    input [15:0] A;
    input [15:0] B;
    output [15:0] Y;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            OR or_gate(Y[i], A[i], B[i]);
        end
    endgenerate

endmodule

module MUX16 (Y, S, A, B);

    input S;
    input [15:0] A;
    input [15:0] B;
    output [15:0] Y;

    wire not_S;
    wire [15:0] and_nSA;
    wire [15:0] and_SB;

    NOT not_gate(not_S, S);

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            AND and_gate_1(and_nSA[i], not_S, A[i]);
            AND and_gate_2(and_SB[i], S, B[i]);
        end
    endgenerate

    OR16 or_gate(Y, and_nSA, and_SB);

endmodule