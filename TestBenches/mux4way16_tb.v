`include "../ElementaryLogicGates.v"

module MUX4WAY16_tb;

    reg [1:0] S;
    reg [15:0] A;
    reg [15:0] B;
    reg [15:0] C;
    reg [15:0] D;
    wire [15:0] Y;

    MUX4WAY16 mux4way16_gate(Y, S, A, B, C, D);

    initial begin
            S = 2'b00; A = 16'hF000; B = 16'h0F00; C = 16'h00F0; D = 16'h000F;
        #1  S = 2'b01;
        #1  S = 2'b10;
        #1  S = 2'b11;
    end

    initial begin
        $monitor ("%t | S = %x | A = %x | B = %x | C = %x | D = %x | Y = %x", $time, S, A, B, C, D, Y);
        $dumpfile("./DumpFiles/mux4way16_dump.vcd");
        $dumpvars();
    end

endmodule