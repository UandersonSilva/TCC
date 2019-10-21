module mux_A
#(
    parameter DATA_WIDTH = 11
)
(
    input logic [DATA_WIDTH - 1:0] ULA_in, DATA_MEMORY_in, EXT_in,
    input logic [1:0] sel_A,
    output logic [DATA_WIDTH - 1:0] MA_out
    );

localparam
    _ULA = 2'b10,
    _EXT = 2'b01,
    _DATA_MEMORY = 2'b00;

always_latch 
    begin
        case(sel_A)
            _DATA_MEMORY: 
                MA_out <= DATA_MEMORY_in;
            _EXT:
                MA_out <= EXT_in;
            _ULA: 
                MA_out <= ULA_in;
		endcase
    end

endmodule