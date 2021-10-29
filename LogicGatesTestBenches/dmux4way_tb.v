`include "../ElementaryLogicGates.v"

module DMUX4WAY_tb;

    reg [1:0] S;
    reg A;
    wire Y0, Y1, Y2, Y3;

    DMUX4WAY dmux4way_gate(Y0, Y1, Y2, Y3, S, A);

    initial begin
        
            A = 0; S = 2'b00;
        #1  S = 2'b01;
        #1  S = 2'b10;
        #1  S = 2'b11;


        #1  A = 1; S = 2'b00;
        #1  S = 2'b01;
        #1  S = 2'b10;
        #1  S = 2'b11;
    end

    initial begin
        $monitor ("%t | S = %b | A = %b | Y0 = %b | Y1 = %b | Y2 = %b | Y3 = %b", $time, S, A, Y0, Y1, Y2, Y3);
        $dumpfile("./DumpFiles/dmux4way_dump.vcd");
        $dumpvars();
    end

endmodule