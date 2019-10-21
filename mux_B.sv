module mux_B#(
        parameter DATA_WIDTH = 11
    )
    (
        input logic [DATA_WIDTH - 1:0] ext_in, data_memory_in,
        input logic sel_B,
        output logic [DATA_WIDTH - 1:0] mux_B_out
    );

    always_comb
    begin
        if(sel_B)
            mux_B_out <= ext_in;
        else
            mux_B_out <= data_memory_in;
    end
endmodule