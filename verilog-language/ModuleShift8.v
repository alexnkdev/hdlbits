module top_module (
  input clk,
  input [7:0] d,
  input [1:0] sel,
  output [7:0] q
);

  wire [7:0] wire_q1_d2;
  wire [7:0] wire_q2_d3;
  wire [7:0] wire_q3_q;

  my_dff8 instance1(
    .clk(clk),
    .d(d),
    .q(wire_q1_d2)
  );

  my_dff8 instance2(
    .clk(clk),
    .d(wire_q1_d2),
    .q(wire_q2_d3)
  );

  my_dff8 instance3(
    .clk(clk),
    .d(wire_q2_d3),
    .q(wire_q3_q)
  );
  
  // 4-to-1 multiplexer
  always @(*) begin
    case (sel)
      2'b00: q = d;
      2'b01: q = wire_q1_d2;
      2'b10: q = wire_q2_d3;
      2'b11: q = wire_q3_q;
      default: q = d;
    endcase
  end


endmodule
