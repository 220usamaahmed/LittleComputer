`include "../Memory.v"

module REGISTER_tb;

    reg [15:0] IN;
    reg LOAD;
    wire [15:0] OUT;

    REGISTER register(OUT, IN, LOAD);

    initial begin
            IN = 16'b0000110000001100; LOAD = 0;
        #1  IN = 16'b0000110000001100; LOAD = 1;
        #1  IN = 16'b0100110001001100; LOAD = 0;
        #1  IN = 16'b0000011000000110; LOAD = 1;
        #1  IN = 16'b1110110011101100; LOAD = 0;
        #1  IN = 16'b0100001101000011; LOAD = 1;
        #1  IN = 16'b1010110110101101; LOAD = 0;
        #1  IN = 16'b1010110110101101; LOAD = 0;
        #1  IN = 16'b1111111111111111; LOAD = 1;

        $finish;
    end

    initial begin
        $monitor ("%t | IN = %b | LOAD = %d | OUT = %b", $time, IN, LOAD, OUT);
        $dumpfile("./DumpFiles/register_dump.vcd");
        $dumpvars();
    end

endmodule