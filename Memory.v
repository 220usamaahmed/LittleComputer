`include "../ElementaryLogicGates.v"

/*
 * SR Latch
 * If S == R == 1 then Q[t + 1] = Q[t]
 * If S == 1, R == 0 then Q[t + 1] = 1
 * If S == 0, R == 1 then Q[t + 1] = 0
 * S == 0, R == 0 is not used (invalid state)
 */
module SRLATCH(
    output Q, Qn,
    input S, R
);

NAND nand_gate_1(Q, R, Qn);
NAND nand_gate_2(Qn, Q, S);

endmodule

/*
 * An SR Latch which updates when the clock is 1
*/
module SRFLIPFLOP(
    output Q, Qn,
    input S, R, CLK
);

    wire T1, T2;
    NAND nand_gate_1(T1, S, CLK);
    NAND nand_gate_2(T2, R, CLK);
    SRLATCH sr_latch(Q, Qn, T1, T2);

endmodule

/**
 * 1-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 *                 else out does not change (out[t+1] = out[t])
 */
module BIT (
    output OUT,
    input IN, LOAD
);

    wire not_IN, OUTn;
    NOT not_gate(not_IN, IN);
    SRFLIPFLOP srflipflop(OUT, OUTn, not_IN, IN, LOAD);

endmodule

/**
 * 8 bits combined to build a byte register
 */
module REGISTER (OUT, IN, LOAD);

    input [15:0] IN;
    input LOAD;
    output [15:0] OUT;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            BIT bit(OUT[i], IN[i], LOAD);
        end
    endgenerate

endmodule