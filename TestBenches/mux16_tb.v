`include "../ElementaryLogicGates.v"

module MUX16_tb;

    reg [15:0] A;
    reg [15:0] B;
    reg S;
    wire [15:0] Y;

    MUX16 mux16_gate(Y, S, A, B);

    initial begin
            S = 0; A = 16'b0101010101010101; B = 16'b0101010101010101;
        #1  S = 1; A = 16'b1100110011001100; B = 16'b0101010101010101;
        #1  S = 0; A = 16'b1000010111011101; B = 16'b1111111111111111;
        #1  S = 1; A = 16'b0000010100010101; B = 16'b0000000000000000;
    end

    initial begin
        $monitor ("%t | S = %b | A = %b | B = %b | Y = %b", $time, S, A, B, Y);
        $dumpfile("./DumpFiles/or16_dump.vcd");
        $dumpvars();
    end

endmodule