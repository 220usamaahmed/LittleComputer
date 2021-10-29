`include "../ElementaryLogicGates.v"

module MUX8WAY16_tb;

    reg [2:0] S;
    reg [15:0] A, B, C, D, E, F, G, H;
    wire [15:0] Y;

    MUX8WAY16 mux8way16_gate(Y, S, A, B, C, D, E, F, G, H);

    initial begin
        A = 16'hF000; B = 16'h0F00; C = 16'h00F0; D = 16'h000F; E = 16'hA000; F = 16'h0A00; G = 16'h00A0; H = 16'h000A;
            
            S = 3'b000;
        #1  S = 3'b001;
        #1  S = 3'b010;
        #1  S = 3'b011;
        #1  S = 3'b100;
        #1  S = 3'b101;
        #1  S = 3'b110;
        #1  S = 3'b111;
    end

    initial begin
        $monitor ("%t | S = %x | A = %x | B = %x | C = %x | D = %x | E = %x | F = %x | G = %x | H = %x | Y = %x", $time, S, A, B, C, D, E, F, G, H, Y);
        $dumpfile("./DumpFiles/mux8way16_dump.vcd");
        $dumpvars();
    end

endmodule