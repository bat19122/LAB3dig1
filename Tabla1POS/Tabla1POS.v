module Tabla1POS();
  wire nA, nB, nC, O1, O2, O3, OutAnd;
  reg A, B, C;
  not U1 (nA, A);
  not U2 (nB, B);
  not U3 (nC, C);
  or U4 (O1, A, B, nC);
  or U5 (O2, A, nB, nC);
  or U6 (O3, nA, nB, C);
  and a1 (OutAnd, O1, O2, O3);

  initial begin
    $display ("A B C | Y");
    $display ("=========");
    $monitor ("%b %b %b | %b", A, B, C, OutAnd);
    A = 0; B = 0; C = 0;
    #1 C = 1;
    #1 B = 1; C = 0;
    #1 C = 1;
    #1 A = 1; B = 0; C = 0;
    #1 C = 1;
    #1 B = 1; C = 0;
    #1 C = 1;
    #1 $finish;
  end

  initial begin
    $dumpfile ("Tabla1POS_tb.vcd");
    $dumpvars (0, Tabla1POS);
    end
endmodule
