`include "../Memory.v"

module SRLATCH_tb;

    reg IN, LOAD;
    wire OUT;

    BIT bit(OUT, IN, LOAD);

    initial begin
            IN = 1; LOAD = 0;
        #1  IN = 1; LOAD = 1;
        #1  IN = 1; LOAD = 1;
        #1  IN = 1; LOAD = 0;
        #1  IN = 0; LOAD = 1;
        #1  IN = 1; LOAD = 1;
        #1  IN = 0; LOAD = 1;
        #1  IN = 1; LOAD = 0;

        $finish;
    end

    initial begin
        $monitor ("%t | IN = %d | LOAD = %d | OUT = %d", $time, IN, LOAD, OUT);
        $dumpfile("./DumpFiles/bit_tb.vcd");
        $dumpvars();
    end

endmodule