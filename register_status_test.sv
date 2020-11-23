`timescale 1 ns / 10 ps

module register_status_test#(
        parameter WIDTH = 2
    );

	logic  status_Z_in, status_N_in;
	logic status_reset, status_wr;
	logic clock;
	logic status_Z_out, status_N_out;

	clock_generator GCLOCK(clock);

    register #(.WIDTH(WIDTH)) status0(
        .reg_in({status_Z_in, status_N_in}), 
        .reg_wr(status_wr), 
        .reg_reset(status_reset), 
        .clock(clock), 
        .reg_out({status_Z_out, status_N_out})
    );

	initial
	begin
		status_reset = 1'b1;
		status_wr = 1'b0;
		status_Z_in = 1'b0; status_N_in = 1'b1;
        #2 status_reset = 1'b0;
		#2 status_wr = 1'b1;
		#2 status_wr = 1'b0; status_Z_in = 1'b1; status_N_in = 1'b0;
		#2 
		#2 status_wr = 1'b1;
		#2 status_wr = 1'b0; status_Z_in = 1'b0; status_N_in = 1'b0;
		#2 
		#2 status_wr = 1'b1;
		#2 status_wr = 1'b0;
		#2 status_reset = 1'b1;
		#2 status_reset = 1'b0;
	end
endmodule