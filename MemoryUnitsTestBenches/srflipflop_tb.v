`include "../Memory.v"

module SRFLIPFLOP_tb;

    reg S, R, CLK;
    wire Q, Qn;

    SRFLIPFLOP srflipflop(Q, Qn, S, R, CLK);

    initial begin
            S = 1; R = 1; CLK = 0;
        #1  S = 0; R = 1; CLK = 0;
        #1  S = 1; R = 0; CLK = 0;
        #1  S = 0; R = 0; CLK = 0;
        #1  S = 1; R = 0; CLK = 1;
        #1  S = 0; R = 0; CLK = 0;
        #1  S = 0; R = 1; CLK = 1;
        #1  S = 0; R = 0; CLK = 0;
        #1  S = 1; R = 1; CLK = 1;
        
        $finish;
    end

    initial begin
        $monitor ("%t | CLK = %d | S = %d | R = %d | Q = %d | Qn = %d", $time, CLK, S, R, Q, Qn);
        $dumpfile("./DumpFiles/srflipflop_tb.vcd");
        $dumpvars();
    end

endmodule