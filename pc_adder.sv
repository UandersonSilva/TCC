module pc_adder#(
        parameter OPERAND_WIDTH = 11
    )
    (
        input logic [OPERAND_WIDTH - 1:0] pc_adder_in,
        output logic [OPERAND_WIDTH - 1:0] pc_adder_out
    );

    always_comb
    begin
        pc_adder_out <= pc_adder_in + 1'b1;
    end 
endmodule