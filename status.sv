module status#(
        parameter DATA_WIDTH = 11
    )
    (
        input logic zero_indicator_in, signal_bit_in,
        input logic status_reset, clock, status_wr,
        output logic flag_Z, flag_N
    );
	 

    always_ff @(posedge clock or posedge status_reset)
    begin
        if(status_reset==1'b1)
        begin
            flag_Z <= 1'b0;
            flag_N <= 1'b0;
        end
        else
        begin
            if(status_wr==1'b1)
            begin
                flag_Z <= zero_indicator_in;			
                flag_N <= signal_bit_in;
            end
        end
    end
endmodule