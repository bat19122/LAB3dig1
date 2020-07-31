module Tabla2POS();
  wire nA, nB, nC, O1, O2, O3, O4, O5, AndOut;
  reg A, B, C;
  not U1 (nA, A);
  not U2 (nB, B);
  not U3 (nC, C);
  or U4 (O1, A, B, C);
  or U5 (O2, A, nB, C);
  or U6 (O3, A, nB, nC);
  or U7 (O4, nA, B, C);
  or U8 (O5, nA, B, nC);
  and U9 (AndOut, O1, O2, O3, O4, O5);

  initial begin
    $display ("A B C | Y");
    $display ("=========");
    $monitor ("%b %b %b | %b", A, B, C, AndOut);
    A = 0; B = 0; C = 0;
    #1 C = 1;
    #1 B = 1; C = 0;
    #1 C = 1;
    #1 A = 1; B = 0; C =0;
    #1 C = 1;
    #1 B = 1; C = 0;
    #1 C = 1;
    #1 $finish;
  end

  initial begin
    $dumpfile("Tabla2POS_tb.vcd");
    $dumpvars(0, Tabla2POS);
end
endmodule
