`include "../Arithmetic.v"

module ALU_tb;

    reg [15:0] A, B;
    reg za, na, zb, nb, f, no;
    wire [15:0] out;
    wire zr, ng;

    ALU alu (out, zr, ng, A, B, za, na, zb, nb, f, no);

    initial begin
           A = 16'b0000000000000000; B = 16'b1111111111111111; za=1; na=0; zb=1; nb=0; f=1; no=0; // out=0000000000000000 zr=1 ng=0
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=1; na=1; zb=1; nb=1; f=1; no=1; // out=0000000000000001 zr=0 ng=0
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=1; na=1; zb=1; nb=0; f=1; no=0; // out=1111111111111111 zr=0 ng=1
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=0; na=0; zb=1; nb=1; f=0; no=0; // out=0000000000000000 zr=1 ng=0
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=1; na=1; zb=0; nb=0; f=0; no=0; // out=1111111111111111 zr=0 ng=1
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=0; na=0; zb=1; nb=1; f=0; no=1; // out=1111111111111111 zr=0 ng=1
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=1; na=1; zb=0; nb=0; f=0; no=1; // out=0000000000000000 zr=1 ng=0
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=0; na=0; zb=1; nb=1; f=1; no=1; // out=0000000000000000 zr=1 ng=0
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=1; na=1; zb=0; nb=0; f=1; no=1; // out=0000000000000001 zr=0 ng=0
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=0; na=1; zb=1; nb=1; f=1; no=1; // out=0000000000000001 zr=0 ng=0
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=1; na=1; zb=0; nb=1; f=1; no=1; // out=0000000000000000 zr=1 ng=0
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=0; na=0; zb=1; nb=1; f=1; no=0; // out=1111111111111111 zr=0 ng=1
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=1; na=1; zb=0; nb=0; f=1; no=0; // out=1111111111111110 zr=0 ng=1
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=0; na=0; zb=0; nb=0; f=1; no=0; // out=1111111111111111 zr=0 ng=1
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=0; na=1; zb=0; nb=0; f=1; no=1; // out=0000000000000001 zr=0 ng=0
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=0; na=0; zb=0; nb=1; f=1; no=1; // out=1111111111111111 zr=0 ng=1
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=0; na=0; zb=0; nb=0; f=0; no=0; // out=0000000000000000 zr=1 ng=0
        #1 A = 16'b0000000000000000; B = 16'b1111111111111111; za=0; na=1; zb=0; nb=1; f=0; no=1; // out=1111111111111111 zr=0 ng=1
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=1; na=0; zb=1; nb=0; f=1; no=0; // out=0000000000000000 zr=1 ng=0
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=1; na=1; zb=1; nb=1; f=1; no=1; // out=0000000000000001 zr=0 ng=0
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=1; na=1; zb=1; nb=0; f=1; no=0; // out=1111111111111111 zr=0 ng=1
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=0; na=0; zb=1; nb=1; f=0; no=0; // out=0101101110100000 zr=0 ng=0
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=1; na=1; zb=0; nb=0; f=0; no=0; // out=0001111011010010 zr=0 ng=0
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=0; na=0; zb=1; nb=1; f=0; no=1; // out=1010010001011111 zr=0 ng=1
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=1; na=1; zb=0; nb=0; f=0; no=1; // out=1110000100101101 zr=0 ng=1
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=0; na=0; zb=1; nb=1; f=1; no=1; // out=1010010001100000 zr=0 ng=1
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=1; na=1; zb=0; nb=0; f=1; no=1; // out=1110000100101110 zr=0 ng=1
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=0; na=1; zb=1; nb=1; f=1; no=1; // out=0101101110100001 zr=0 ng=0
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=1; na=1; zb=0; nb=1; f=1; no=1; // out=0001111011010011 zr=0 ng=0
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=0; na=0; zb=1; nb=1; f=1; no=0; // out=0101101110011111 zr=0 ng=0
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=1; na=1; zb=0; nb=0; f=1; no=0; // out=0001111011010001 zr=0 ng=0
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=0; na=0; zb=0; nb=0; f=1; no=0; // out=0111101001110010 zr=0 ng=0
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=0; na=1; zb=0; nb=0; f=1; no=1; // out=0011110011001110 zr=0 ng=0
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=0; na=0; zb=0; nb=1; f=1; no=1; // out=1100001100110010 zr=0 ng=1
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=0; na=0; zb=0; nb=0; f=0; no=0; // out=0001101010000000 zr=0 ng=0
        #1 A = 16'b0101101110100000; B = 16'b0001111011010010; za=0; na=1; zb=0; nb=1; f=0; no=1; // out=0101111111110010 zr=0 ng=0
    end

    initial begin
        $monitor ("%t | A = %b | B = %b | za = %b | na = %b | zb = %b | nb = %b | f = %b | no = %b | out = %b | zr = %b | ng = %b", $time, A, B, za, na, zb, nb, f, no, out, zr, ng);
        $dumpfile("./DumpFiles/alu16_dump.vcd");
        $dumpvars();
    end

endmodule