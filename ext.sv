module ext#(
        parameter OPERAND_WIDTH = 11,
        parameter DATA_WIDTH = 16
    )
    (
        input logic [OPERAND_WIDTH - 1:0] data_in,
        output logic [DATA_WIDTH - 1:0] ext_out
    );

    always @(data_in)
    begin
        ext_out[OPERAND_WIDTH - 1:0] <= data_in;
        ext_out[OPERAND_WIDTH] = data_in[OPERAND_WIDTH-1];
        ext_out[OPERAND_WIDTH+1] = data_in[OPERAND_WIDTH-1];
        ext_out[OPERAND_WIDTH+2] = data_in[OPERAND_WIDTH-1];
        ext_out[OPERAND_WIDTH+3] = data_in[OPERAND_WIDTH-1];
        ext_out[OPERAND_WIDTH+4] = data_in[OPERAND_WIDTH-1];
    end
endmodule