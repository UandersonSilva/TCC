module mux_2x1#(
        parameter DATA_WIDTH = 11
    )
    (
        input logic [DATA_WIDTH - 1:0] in_0, in_1,
        input logic select_2x1,
        output logic [DATA_WIDTH - 1:0] mux_out
    );

    always_comb
    begin
        if(select_2x1)
            mux_out <= in_1;
        else
            mux_out <= in_0;
    end
endmodule
