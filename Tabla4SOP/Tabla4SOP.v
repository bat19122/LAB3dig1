module Tabla4SOP();
  wire nA, nB, nC, nD, A1, A2, A3, A4, A5, A6, A7, OrOut;
  reg A, B, C, D;
  not U1 (nA, A);
  not U2 (nB, B);
  not U3 (nC, C);
  not U4 (nD, D);
  and U5 (A1, nA, nB, nC, nD);
  and U6 (A2, nA, nB, C, nD);
  and U7 (A3, nA, nB, C, D);
  and U8 (A4, nA, B, C, nD);
  and U9 (A5, nA, B, C, D);
  and U10 (A6, A, nB, nC, nD);
  and U11 (A7, A, nB, C, nD);
  or U12 (OrOut, A1, A2, A3, A4, A5, A6, A7);

  initial begin
    $display("A B C D | Y");
    $display("===========");
    $monitor("%b %b %b %b | %b", A, B, C, D, OrOut);
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
    $dumpfile("Tabla4SOP_tb.vcd");
    $dumpvars(0, Tabla4SOP);
  end
endmodule
