`include "../ElementaryLogicGates.v"

module DMUX8WAY_tb;

    reg [2:0] S;
    reg A;
    wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

    DMUX8WAY dmux8way_gate(Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, S, A);

    initial begin
            A = 0; S = 3'b000;
        #1  S = 3'b001;
        #1  S = 3'b010;
        #1  S = 3'b011;
        #1  S = 3'b100;
        #1  S = 3'b101;
        #1  S = 3'b110;
        #1  S = 3'b111;


        #1  A = 1; S = 3'b000;
        #1  S = 3'b001;
        #1  S = 3'b010;
        #1  S = 3'b011;
        #1  S = 3'b100;
        #1  S = 3'b101;
        #1  S = 3'b110;
        #1  S = 3'b111;
    end

    initial begin
        $monitor ("%t | S = %b | A = %b | Y0 = %b | Y1 = %b | Y2 = %b | Y3 = %b | Y4 = %b | Y5 = %b | Y6 = %b | Y7 = %b", $time, S, A, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7);
        $dumpfile("./DumpFiles/dmux8way_dump.vcd");
        $dumpvars();
    end

endmodule