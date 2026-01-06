module top_module(
  input [31:0] a,
  input [31:0] b,
  output [31:0] sum
);


wire low_half_cout;
wire [15:0] low_half_sum;

wire [15:0] top_half_cin1_sum;
wire [15:0] top_half_cin0_sum;


add16 low_half_adder(
  .a(a[15:0]),
  .b(b[15:0]),
  .cin(1'b0),
  .sum(low_half_sum),
  .cout(low_half_cout)
);

add16 top_half_adder_cin0(
  .a(a[31:16]),
  .b(b[31:16]),
  .cin(1'b0),
  .sum(top_half_cin0_sum)
);

add16 top_half_adder_cin1(
  .a(a[31:16]),
  .b(b[31:16]),
  .cin(1'b1),
  .sum(top_half_cin1_sum)
);

assign sum = low_half_cout ? { top_half_cin1_sum, low_half_sum } : { top_half_cin0_sum, low_half_sum };


endmodule
