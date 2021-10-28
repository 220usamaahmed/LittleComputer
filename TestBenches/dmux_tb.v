`include "../ElementaryLogicGates.v"

module DMUX_tb;

    reg S, A;
    wire X, Y;

    DMUX dmux_gate(X, Y, S, A);

    initial begin
            S = 0; A = 0;
        #1  S = 0; A = 1;
        #1  S = 1; A = 0;
        #1  S = 1; A = 1;
    end

    initial begin
        $monitor ("%t | S = %d | A = %d | X = %d | Y = %d", $time, S, A, X, Y);
        $dumpfile("./DumpFiles/dmux_dump.vcd");
        $dumpvars();
    end

endmodule