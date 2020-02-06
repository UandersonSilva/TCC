module status
    (
        input logic zero_indicator_in, signal_bit_in,
        input logic status_reset, clock, status_wr,
        output logic status_Z, status_N
    );
	 

    always_ff @(posedge clock or posedge status_reset)
    begin
        if(status_reset==1'b1)
        begin
            status_Z <= 1'b0;
            status_N <= 1'b0;
        end
        else
        begin
            if(status_wr==1'b1)
            begin
                status_Z <= zero_indicator_in;			
                status_N <= signal_bit_in;
            end
        end
    end
endmodule