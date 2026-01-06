module top_module(
  input [31:0] a,
  input [31:0] b,
  input sub,
  output [31:0] sum
);

  wire [15:0] lsb_sum;
  wire [15:0] msb_sum;
  wire lsb_cout;
  wire [31:0] b_xor = b ^ {32{sub}};

  
  add16 adder_lsb_half(
    .a(a[15:0]),
    .b(b_xor[15:0]),
    .cin(sub),
    .cout(lsb_cout),
    .sum(lsb_sum)
  );

  add16 adder_msb_half(
    .a(a[31:16]),
    .b(b_xor[31:16]),
    .cin(lsb_cout),
    .sum(msb_sum)
  );

  assign sum = { msb_sum, lsb_sum }; 

endmodule
