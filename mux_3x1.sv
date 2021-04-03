module mux_3x1#(
    parameter DATA_WIDTH = 16
  )
  (
    input logic [DATA_WIDTH - 1:0] in_10, in_01, in_00,
    input logic [1:0] sel_3x1_in,
    output logic [DATA_WIDTH - 1:0] mux_3x1_out
  );

  logic [DATA_WIDTH - 1:0] mux_0_out;

  mux_2x1 mux_0(
    .in_0(in_00),
    .in_1(in_01),
    .sel_2x1_in(sel_3x1_in[0]),
    .mux_2x1_out(mux_0_out)
    );
  mux_2x1 mux_1(
    .in_0(mux_0_out),
    .in_1(in_10),
    .sel_2x1_in(sel_3x1_in[1]),
    .mux_2x1_out(mux_3x1_out)
    );
  /*always_comb 
  begin
    case(select_3x1)
      2'b00:
        mux_3x1_out <= in_00;
      2'b01:
        mux_3x1_out <= in_01;
      2'b10:
        mux_3x1_out <= in_10;
      2'b11:
        mux_3x1_out <= in_10;
    endcase
  end */
endmodule
