`include "../ElementaryLogicGates.v"

module NAND_tb;

    reg A, B;
    wire Y;

    NAND nand_gate(Y, A, B);

    initial begin
            A = 0; B = 0;
        #1  A = 0; B = 1;
        #1  A = 1; B = 0;
        #1  A = 1; B = 1;
    end

    initial begin
        $monitor ("%t | A = %d | B = %d | Y = %d", $time, A, B, Y);
        $dumpfile("./DumpFiles/nand_dump.vcd");
        $dumpvars();
    end

endmodule