`include "../Memory.v"

module REGISTER_tb;

    reg [7:0] IN;
    reg LOAD;
    wire [7:0] OUT;

    REGISTER register(OUT, IN, LOAD);

    initial begin
            IN = 8'b00001100; LOAD = 0;
        #1  IN = 8'b00001100; LOAD = 1;
        #1  IN = 8'b01001100; LOAD = 0;
        #1  IN = 8'b00000110; LOAD = 1;
        #1  IN = 8'b11101100; LOAD = 0;
        #1  IN = 8'b01000011; LOAD = 1;
        #1  IN = 8'b10101101; LOAD = 0;
        #1  IN = 8'b10101101; LOAD = 0;
        #1  IN = 8'b11111111; LOAD = 1;

        $finish;
    end

    initial begin
        $monitor ("%t | IN = %b | LOAD = %d | OUT = %b", $time, IN, LOAD, OUT);
        $dumpfile("./DumpFiles/register_dump.vcd");
        $dumpvars();
    end

endmodule