`include "../Arithmetic.v"

module HALFADDER_tb;

    reg A, B;
    wire sum, carry;

    HALFADDER halfadder(.sum(sum), .carry(carry), .A(A), .B(B));

    initial begin
            A = 0; B = 0;
        #1  A = 0; B = 1;
        #1  A = 1; B = 0;
        #1  A = 1; B = 1;
    end

    initial begin
        $monitor ("%t | A = %d | B = %d | sum = %d | carry = %d", $time, A, B, sum, carry);
        $dumpfile("./DumpFiles/halfadder_dump.vcd");
        $dumpvars();
    end

endmodule