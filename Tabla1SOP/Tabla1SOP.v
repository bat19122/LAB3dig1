module Tabla1SOP();
  wire nA, nB, nC, a1O, a2O, a3O, a4O, a5O, YOut;
  reg A1, B1, C1;
  not n1 (nA, A1);
  not n2 (nB, B1);
  not n3 (nC, C1);
  and a1 (a1O, nA, nB, nC);
  and a2 (a2O, nA, B1, nC);
  and a3 (a3O, A1, nB, nC);
  and a4 (a4O, A1, nB, C1);
  and a5 (a5O, A1, B1, C1);
  or o1 (YOut, a1O, a2O, a3O, a4O, a5O);

  initial begin
      $display ("A B C | Y");
      $display ("=========");
      $monitor ("%b %b %b | %b", A1, B1, C1, YOut);
      A1 = 0; B1 = 0 ; C1 = 0;
      #1 C1 = 1;
      #1 B1 = 1; C1 = 0;
      #1 C1 = 1;
      #1 A1 = 1; B1 = 0; C1 = 0;
      #1 C1 = 1;
      #1 B1 = 1; C1 = 0;
      #1 C1 = 1;
  end
  initial
    begin
      $dumpfile("Tabla1SOP_tb.vcd");
      $dumpvars(0, Tabla1SOP); 
    end
endmodule
