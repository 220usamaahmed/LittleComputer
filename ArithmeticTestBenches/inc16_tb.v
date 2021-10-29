`include "../Arithmetic.v"

module INC16_tb;

    reg [15:0] A;
    wire [15:0] Y;

    INC16 inc16(.Y(Y), .A(A));

    initial begin
            A = 16'b0000000000000000; // out -> 0000000000000001
        #1  A = 16'b1111111111111111; // out -> 0000000000000000
        #1  A = 16'b0000000000000101; // out -> 0000000000000110
        #1  A = 16'b1111111111111011; // out -> 1111111111111100
    end

    initial begin
        $monitor ("%t | A = %b | Y = %b", $time, A, Y);
        $dumpfile("./DumpFiles/inc16_dump.vcd");
        $dumpvars();
    end

endmodule