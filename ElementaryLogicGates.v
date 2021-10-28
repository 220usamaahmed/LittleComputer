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

module OR8WAY (Y, A);

    input [7:0] A;
    output Y;

    wire or_01, or_23, or_45, or_67, or_0123, or_4567;
    OR or_gate_1(or_01, A[0], A[1]);
    OR or_gate_2(or_23, A[2], A[3]);
    OR or_gate_3(or_45, A[4], A[5]);
    OR or_gate_4(or_67, A[6], A[7]);
    
    OR or_gate_5(or_0123, or_01, or_23);
    OR or_gate_6(or_4567, or_45, or_67);

    OR or_gate_7(Y, or_0123, or_4567);

endmodule

module MUX4WAY16 (Y, S, A, B, C, D);

    input [1:0] S;
    input [15:0] A, B, C, D;
    output [15:0] Y;

    wire [15:0] T1, T2;

    MUX16 mux16_gate_1(T1, S[0], A, B);
    MUX16 mux16_gate_2(T2, S[0], C, D);
    MUX16 mux16_gate_3(Y, S[1], T1, T2);

endmodule

module MUX8WAY16 (Y, S, A, B, C, D, E, F, G, H);

    input [2:0] S;
    input [15:0] A, B, C, D, E, F, G, H;
    output [15:0] Y;

    wire [15:0] T1, T2;

    MUX4WAY16 mux4way16_gate_1(T1, S[1:0], A, B, C, D);
    MUX4WAY16 mux4way16_gate_2(T2, S[1:0], E, F, G, H);
    MUX16 mux16_gate(Y, S[2], T1, T2);

endmodule