module mux_pc#(
        parameter DATA_WIDTH = 11
    )
    (
        input logic [DATA_WIDTH - 1:0] ext_in, pc_adder_in,
        input logic sel_pc,
        output logic [DATA_WIDTH - 1:0] mux_pc_out
    );

    always_comb
    begin
        if(sel_pc)
            mux_pc_out <= ext_in;
        else
            mux_pc_out <= pc_adder_in;
    end
endmodule