module acc#(
        parameter DATA_WIDTH = 11
    )
    (
        input logic [DATA_WIDTH - 1:0] acc_in, 
        input logic acc_wr, acc_reset, clock, 
        output logic [DATA_WIDTH - 1:0] acc_out
    );

    always_ff @(posedge clock)
    begin
        if(acc_reset==1'b0)
        begin
            if (acc_wr == 1'b1)
                acc_out <= acc_in;
        end
        else
            acc_out <= 11'b00000000000;
    end
endmodule 