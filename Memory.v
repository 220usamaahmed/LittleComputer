`include "../ElementaryLogicGates.v"

/*
 * SR Latch
 * If S == R == 1 then Q[t + 1] = Q[t]
 * If S == 1, R == 0 then Q[t + 1] = 1
 * If S == 0, R == 1 then Q[t + 1] = 0
 * S == 0, R == 0 is not used (invalid state)
 */
`timescale 1ps/1ps
module SRLATCH(
    output Q, Qn,
    input S, R
);
 
wire Q_int, Qn_int;
 
assign #1 Q_int = ~(S & Qn_int);
assign #1 Qn_int = ~(R & Q_int);
assign Q = Qn_int;
assign Qn = Q_int;
 
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

module RAM8 (OUT, ADDRESS, IN, LOAD);

    input [2:0] ADDRESS;
    input [15:0] IN;
    input LOAD;
    output [15:0] OUT;

    wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;
    wire [15:0] OUT0, OUT1, OUT2, OUT3, OUT4, OUT5, OUT6, OUT7;

    DMUX8WAY dmux8way(Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, ADDRESS, LOAD);

    REGISTER register0(OUT0, IN, Y0);
    REGISTER register1(OUT1, IN, Y1);
    REGISTER register2(OUT2, IN, Y2);
    REGISTER register3(OUT3, IN, Y3);
    REGISTER register4(OUT4, IN, Y4);
    REGISTER register5(OUT5, IN, Y5);
    REGISTER register6(OUT6, IN, Y6);
    REGISTER register7(OUT7, IN, Y7);

    MUX8WAY16 mux8way16(OUT, ADDRESS, OUT0, OUT1, OUT2, OUT3, OUT4, OUT5, OUT6, OUT7);

endmodule