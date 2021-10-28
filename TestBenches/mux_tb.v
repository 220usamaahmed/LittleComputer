`include "../ElementaryLogicGates.v"

module MUX_tb;

    reg S, A, B;
    wire Y;

    MUX mux_gate(Y, S, A, B);

    initial begin
            S = 0; A = 0; B = 0;
        #1  S = 0; A = 0; B = 1;
        #1  S = 0; A = 1; B = 0;
        #1  S = 0; A = 1; B = 1;
        #1  S = 1; A = 0; B = 0;
        #1  S = 1; A = 0; B = 1;
        #1  S = 1; A = 1; B = 0;
        #1  S = 1; A = 1; B = 1;
    end

    initial begin
        $monitor ("%t | S = %d | A = %d | B = %d | Y = %d", $time, S, A, B, Y);
        $dumpfile("./DumpFiles/mux_dump.vcd");
        $dumpvars();
    end

endmodule