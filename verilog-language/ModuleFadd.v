module top_module (
  input [31:0] a,
  input [31:0] b,
  output [31:0] sum
);

  wire [15:0] sum_half;
  wire [1:0] cout_half;
  wire [15:0] sum_half2;

  add16 adder1(
    .a(a[15:0]),
    .b(b[15:0]),
    .cin(0),
    .sum(sum_half),
    .cout(cout_half)
  );

  add16 adder2(
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(cout_half),
    .sum(sum_half2),
  );

  assign sum = { sum_half2, sum_half };

endmodule

module add1(input a, input b, input cin, output sum, output cout);
  wire [1:0] tmp;
  assign tmp = a + b + cin;
  assign sum = tmp[0];
  assign cout = tmp[1];
endmodule
