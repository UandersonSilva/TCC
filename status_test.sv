`timescale 1 ns / 10 ps

module status_test;

	logic  zero_indicator, signal_bit;
	logic status_reset, status_wr;
	logic clock;
	logic status_Z, status_N;

	clock_generator GCLOCK(clock);
	status status0(
		.zero_indicator_in(zero_indicator), 
		.signal_bit_in(signal_bit), 
		.clock(clock), 
		.status_wr(status_wr), 
		.status_reset(status_reset), 
		.status_Z(status_Z), 
		.status_N(status_N)
	);

	initial
	begin
		status_reset = 1'b1;
		status_wr = 1'b0;
		#2 zero_indicator = 1'b0; signal_bit = 1'b1;
		   status_reset = 1'b0;
		#2 status_wr = 1'b1;
		#2 zero_indicator = 1'b1; signal_bit = 1'b0;
		#2 status_wr = 1'b0;
		#2 status_wr = 1'b1;
		#2 zero_indicator = 1'b0; signal_bit = 1'b0;
		#2 status_wr = 1'b0;
		#2 status_wr = 1'b1;
		#2 status_wr = 1'b0;
		#2 status_reset = 1'b1;
		#2 status_reset = 1'b0;
	end
endmodule