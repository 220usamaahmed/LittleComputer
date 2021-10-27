`include "not.v"

module NOT_tb;

    reg A;
    wire Y;

    NOT not_gate(Y, A);

    initial begin
            A = 0;
        #1  A = 1;
    end

    initial begin
        $monitor ("%t | A = %d | Y = %d", $time, A, Y);
        $dumpfile("./not_dump.vcd");
        $dumpvars();
    end

endmodule