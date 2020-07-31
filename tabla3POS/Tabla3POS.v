module Tabla3POS();
  wire nA, nB, nC, nD, O1, O2, O3, O4, O5, O6, O7, O8, O9, AndOut;
  reg A, B, C, D;
  not U1 (nA, A);
  not U2 (nB, B);
  not U3 (nC, C);
  not U4 (nD, D);
  or U5 (O1, A, nB, C, D);
  or U6 (O2, A, nB, C, nD);
  or U7 (O3, A, nB, nC, D);
  or U8 (O4, A, nB, nC, nD);
  or U9 (O5, nA, B, C, nD);
  or U10 (O6, nA, B, nC, nD);
  or U11 (O7, nA, nB, C, D);
  or U12 (O8, nA, nB, C, nD);
  or U13 (O9, nA, nB, nC, nD);
  and U14 (AndOut, O1, O2, O3, O4, O5, O6, O7, O8, O9);

  initial begin
    $display("A B C D | Y");
    $display("===========");
    $monitor("%b %b %b %b | %b", A, B, C, D, AndOut);
    A = 0; B = 0; C = 0; D = 0;
    #1 D = 1;
    #1 C = 1; D = 0;
    #1 D = 1;
    #1 B = 1; C = 0; D = 0;
    #1 D = 1;
    #1 C = 1; D = 0;
    #1 D = 1;
    #1 A = 1; B = 0; C = 0; D = 0;
    #1 D = 1;
    #1 C = 1; D = 0;
    #1 D = 1;
    #1 B = 1; C = 0; D = 0;
    #1 D = 1;
    #1 C = 1; D = 0;
    #1 D = 1;
    #1 $finish;
  end

  initial begin
    $dumpfile("Tabla3POS_tb.vcd");
    $dumpvars(0, Tabla3POS);
  end
endmodule
