module mux_pc#(
        parameter OPERAND_WIDTH = 11
    )
    (
        input logic [OPERAND_WIDTH - 1:0] in_0, in_1,
        input logic select_mux_pc,
        output logic [OPERAND_WIDTH - 1:0] mux_pc_out
    );

    always_comb
    begin
        if(select_mux_pc)
            mux_pc_out <= in_1;
        else
            mux_pc_out <= in_0;
    end
endmodule