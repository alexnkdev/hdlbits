module top_module (
  input a,
  input b,
  input c,
  input d,
  output out1,
  output out2
);

  wire wout1, wout2, wa, wb, wc, wd;

  mod_a instance1 (
    wout1,
    wout2,
    wa,
    wb,
    wc,
    wd
  );

  assign out1 = wout1;
  assign out2 = wout2;

  assign wa = a;
  assign wb = b;
  assign wc = c;
  assign wd = d;


endmodule
