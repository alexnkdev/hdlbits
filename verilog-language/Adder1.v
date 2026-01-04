module top_module(
  input [31:0] a,
  input [31:0] b,
  output [31:0] sum
);

  wire adder1_cout;
  wire [15:0] adder1_sum;
  wire [15:0] adder2_sum;

  add16 adder1(
    .a(a[15:0]),
    .b(b[15:0]),
    .sum(adder1_sum),
    .cout(adder1_cout)
  );

  add16 adder2(
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(adder1_cout),
    .sum(adder2_sum)
  );

  assign sum = { adder2_sum, adder1_sum };



endmodule
