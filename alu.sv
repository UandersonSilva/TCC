module alu#(
        parameter DATA_WIDTH = 16
    )
    (
        input logic [DATA_WIDTH - 1:0] A_in, B_in,
        input logic  operation,
        output logic [DATA_WIDTH - 1:0] alu_out,
        output logic zero_indicator_out, signal_bit_out
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
        
        if(alu_out==11'b0)
            zero_indicator_out <= 1'b1;
        else
            zero_indicator_out <= 1'b0;

        signal_bit_out <= alu_out[DATA_WIDTH - 1];
    end
endmodule 