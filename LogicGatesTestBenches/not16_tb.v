`include "../ElementaryLogicGates.v"

module NOT16_tb;

    reg [15:0] A;
    wire [15:0] Y;

    NOT16 not16_gate(Y, A);

    initial begin
            A = 16'b0101010101010101;
        #1  A = 16'b1100110011001100;
        #1  A = 16'b1000010111011101;
        #1  A = 16'b0000010100010101;
    end

    initial begin
        $monitor ("%t | A = %b | Y = %b", $time, A, Y);
        $dumpfile("./DumpFiles/not16_dump.vcd");
        $dumpvars();
    end

endmodule