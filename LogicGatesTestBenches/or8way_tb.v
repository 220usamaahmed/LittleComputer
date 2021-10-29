`include "../ElementaryLogicGates.v"

module OR8WAY_tb;

    reg [7:0] A;
    wire Y;

    OR8WAY or16way_gate(Y, A);

    initial begin
            A = 16'b01010101;
        #1  A = 16'b11001100;
        #1  A = 16'b10000101;
        #1  A = 16'b00000101;
        #1  A = 16'b00000000;
    end

    initial begin
        $monitor ("%t | A = %b | Y = %b", $time, A, Y);
        $dumpfile("./DumpFiles/or16way_dump.vcd");
        $dumpvars();
    end

endmodule