module Tabla2SOP();
  wire nA, nB, nC, A1, A2, A3, OrOut;
  reg A, B, C;
  not U1 (nA, A);
  not U2 (nB, B);
  not U3 (nC, C);
  and U4 (A1, nA, nB, C);
  and U5 (A2, A, B, nC);
  and U6 (A3, A, B, C);
  or U7 (OrOut, A1, A2, A3);

  initial begin
    $display ("A B C | Y");
    $display ("=========");
    $monitor ("%b %b %b | %b", A, B, C, OrOut);
    A = 0; B = 0; C = 0;
    #1 C = 1;
    #1 B = 1; C = 0;
    #1 C = 1;
    #1 A =1; B = 0; C = 0;
    #1 C = 1;
    #1 B = 1; C = 0;
    #1 C = 1;
    #1 $finish;
  end

  initial begin
    $dumpfile("Tabla2SOP_tb.vcd");
    $dumpvars(0, Tabla2SOP);
  end
endmodule
