module instruction_register#(
        parameter INSTRUCTION_WIDTH = 16
    )
    (
        input logic [INSTRUCTION_WIDTH - 1:0] ir_in, 
        input logic ir_wr, ir_reset, clock, 
        output logic [INSTRUCTION_WIDTH - 1:0] ir_out
    );

    always_ff @(posedge clock or posedge ir_reset)
    begin
        if(ir_reset==1'b1)
            ir_out <= 16'b0000000000000000;
        else
        begin
            if (ir_wr == 1'b1)
                ir_out <= ir_in;
        end
    end

endmodule