`include "../ElementaryLogicGates.v"

module AND16_tb;

    reg [15:0] A;
    reg [15:0] B;
    wire [15:0] Y;

    AND16 and16_gate(Y, A, B);

    initial begin
            A = 16'b0101010101010101; B = 16'b0101010101010101;
        #1  A = 16'b1100110011001100; B = 16'b0101010101010101;
        #1  A = 16'b1000010111011101; B = 16'b1111111111111111;
        #1  A = 16'b0000010100010101; B = 16'b0000000000000000;
    end

    initial begin
        $monitor ("%t | A = %b | B = %b | Y = %b", $time, A, B, Y);
        $dumpfile("./DumpFiles/and16_dump.vcd");
        $dumpvars();
    end

endmodule