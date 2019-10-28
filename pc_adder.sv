module pc_adder#(
        parameter DATA_WIDTH = 11
    )
    (
        input logic [DATA_WIDTH - 1:0] pc_adder_in,
        output logic [DATA_WIDTH - 1:0] pc_adder_out
    );

    always_comb
    begin
        pc_adder_out <= pc_adder_in + 1'b1;
    end 
endmodule