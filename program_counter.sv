module program_counter#(
        parameter OPERAND_WIDTH = 11
    )
    (
        input logic [OPERAND_WIDTH - 1:0] pc_in, 
        input logic pc_wr, pc_reset, clock, 
        output logic [OPERAND_WIDTH - 1:0] pc_out
    );

    always_ff @(posedge clock or posedge pc_reset)
    begin
        if(pc_reset==1'b1)
            pc_out <= 11'b00000000000;
        else
        begin
            if (pc_wr == 1'b1)
                pc_out <= pc_in;
        end
    end
endmodule