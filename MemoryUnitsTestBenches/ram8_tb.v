`include "../Memory.v"

module RAM8_tb;

    reg [2:0] ADDRESS;
    reg [15:0] IN;
    reg LOAD;
    wire [15:0] OUT;

    RAM8 ram8(OUT, ADDRESS, IN, LOAD);

    initial begin
            ADDRESS = 3'b000; IN = 16'h0000; LOAD = 1;
        #10 ADDRESS = 3'b001; IN = 16'h0000; LOAD = 1;
        #10 ADDRESS = 3'b010; IN = 16'h0000; LOAD = 1;
        #10 ADDRESS = 3'b011; IN = 16'h0000; LOAD = 1;
        #10 ADDRESS = 3'b100; IN = 16'h0000; LOAD = 1;
        #10 ADDRESS = 3'b101; IN = 16'h0000; LOAD = 1;
        #10 ADDRESS = 3'b110; IN = 16'h0000; LOAD = 1;
        #10 ADDRESS = 3'b111; IN = 16'h0000; LOAD = 1;

        #10 ADDRESS = 3'b000; IN = 16'b0101010101010101; LOAD = 0;
        #10 ADDRESS = 3'b000; IN = 16'b0101010101010101; LOAD = 1;
        #10 ADDRESS = 3'b000; IN = 16'b1010101010101010; LOAD = 0;
        #10 ADDRESS = 3'b000; IN = 16'b0101010101010101; LOAD = 0;

        #10 ADDRESS = 3'b101; IN = 16'b1010101010101010; LOAD = 1;
        #10 ADDRESS = 3'b101; IN = 16'b1010101010101010; LOAD = 0;
        #10 ADDRESS = 3'b000; IN = 16'b0101010101010101; LOAD = 0;

    end

    initial begin
        $monitor ("%t | ADDRESS = %b | IN = %b | LOAD = %d | OUT = %b", $time, ADDRESS, IN, LOAD, OUT);
        $dumpfile("./DumpFiles/register_dump.vcd");
        $dumpvars();
    end

endmodule