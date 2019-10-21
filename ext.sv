module ext#(
        parameter DATA_WIDTH = 11
    )
    (
        input logic [DATA_WIDTH - 1:0] data_in,
        output logic [DATA_WIDTH - 1:0] ext_out
    );

    always @(data_in)
    begin
        ext_out <= data_in;
    end
endmodule