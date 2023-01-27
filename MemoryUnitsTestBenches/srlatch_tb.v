`include "../Memory.v"

module SRLATCH_tb;

    reg S, R;
    wire Q, Qn;

    SRLATCH srlatch(Q, Qn, S, R);

    initial begin
            S = 1; R = 1;
        #1  S = 0; R = 1;
        #1  S = 1; R = 1;
        #1  S = 1; R = 0;
        #1  S = 1; R = 1;
        #1  S = 1; R = 1;
        #1  S = 0; R = 0;

        $finish;
    end

    initial begin
        $monitor ("%t | S = %d | R = %d | Q = %d | Qn = %d", $time, S, R, Q, Qn);
        $dumpfile("./DumpFiles/srlatch_tb.vcd");
        $dumpvars();
    end

endmodule