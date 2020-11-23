module mux_3x1#(
        parameter DATA_WIDTH = 16
    )
    (
        input logic [DATA_WIDTH - 1:0] in_10, in_01, in_00,
        input logic [1:0] select_3x1,
        output logic [DATA_WIDTH - 1:0] mux_out
    );

	 logic [DATA_WIDTH - 1:0] mux_0_out;

	 mux_2x1 mux_0(
       .in_0(in_00),
       .in_1(in_01),
       .sel_2x1_in(select_3x1[0]),
       .mux_out(mux_0_out)
     );
	 mux_2x1 mux_1(
       .in_0(mux_0_out),
       .in_1(in_10),
       .sel_2x1_in(select_3x1[1]),
       .mux_out(mux_out)
     );
endmodule
