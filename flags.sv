module flags#(
        parameter DATA_WIDTH = 11
    )
    (
        input logic [DATA_WIDTH - 1:0] flags_in,
        input logic flags_reset, clock, flags_wr,
        output logic flag_Z, flag_N
    );
	 

    always_ff @(posedge clock)
    begin
        if(flags_reset==1'b0 && flags_wr==1'b1)
        begin
            if(flags_in==11'b0)
                flag_Z <= 1'b1;
            else
                flag_Z <= 1'b0;			
            flag_N <= flags_in[DATA_WIDTH - 1];
        end
        else if(flags_reset==1'b1)
        begin
            flag_Z <= 1'b0;
            flag_N <= 1'b0;
        end
    end
endmodule