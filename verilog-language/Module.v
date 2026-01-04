module top_module ( input a, input b, output out );

  wire wa, wb, wc;

  mod_a instance1 (
    .out(wc),
    .in1(wa),
    .in2(wb)
  );
  
  assign wa = a;
  assign wb = b;
  assign out = wc;

endmodule
