module mux_B
#(
    parameter DATA_WIDTH = 11
)
(
    input logic [DATA_WIDTH - 1:0] EXT_in, DATA_MEMORY_in,
    input logic sel_B,
    output logic [DATA_WIDTH - 1:0] MB_out
);

always_comb
    begin
        if(sel_B)
            MB_out <= EXT_in;
        else
            MB_out <= DATA_MEMORY_in;
    end
endmodule