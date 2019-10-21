module alu#(
        parameter DATA_WIDTH = 11
    )
    (
        input logic [DATA_WIDTH - 1:0] A_in, B_in,
        input logic  operation,
        output logic [DATA_WIDTH - 1:0] alu_out
    );

    localparam _soma = 1'b0, _subt = 1'b1;

    always_comb
    begin
        case(operation)
            _soma: 
                alu_out = A_in + B_in;
            _subt:
                alu_out = A_in - B_in;
        endcase
    end
endmodule 