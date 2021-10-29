`include "../Arithmetic.v"

module HALFADDER_tb;

    reg A, B, C;
    wire sum, carry;

    FULLADDER fulladder(.sum(sum), .carry(carry), .A(A), .B(B), .C(C));

    initial begin
            A = 0; B = 0; C = 0;
        #1  A = 0; B = 0; C = 1;
        #1  A = 0; B = 1; C = 0;
        #1  A = 0; B = 1; C = 1;
        #1  A = 1; B = 0; C = 0;
        #1  A = 1; B = 0; C = 1;
        #1  A = 1; B = 1; C = 0;
        #1  A = 1; B = 1; C = 1;
    end

    initial begin
        $monitor ("%t | A = %d | B = %d | C = %d | sum = %d | carry = %d", $time, A, B, C, sum, carry);
        $dumpfile("./DumpFiles/fulladder_dump.vcd");
        $dumpvars();
    end

endmodule