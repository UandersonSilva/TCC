module mux_A#(
        parameter DATA_WIDTH = 11
    )
    (
        input logic [DATA_WIDTH - 1:0] alu_in, ext_in, data_memory_in,
        input logic [1:0] sel_A,
        output logic [DATA_WIDTH - 1:0] mux_A_out
    );

    localparam
        _ALU = 2'b10,
        _EXT = 2'b01,
        _DATA_MEMORY = 2'b00;

    always_latch 
    begin
        case(sel_A)
            _DATA_MEMORY: 
                mux_A_out <= data_memory_in;
            _EXT:
                mux_A_out <= ext_in;
            _ALU: 
                mux_A_out <= alu_in;
        endcase
    end
endmodule