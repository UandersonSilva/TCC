`timescale 1 ns / 1 ps

module flags_test;

reg [10:0] flags_in;
reg flags_reset, flags_wr;
wire clock;
wire flag_Z, flag_N;

clock_generator GCLOCK(clock);
flags FLAGS(flags_in, clock, flags_wr, flags_reset, flag_Z, flag_N);

initial
begin
	flags_in = 11'b00000000000; flags_reset = 1'b0; flags_wr = 1'b0;
	#2 flags_wr = 1'b1;
	#2 flags_in = 11'b10000100000;
	#2 flags_wr = 1'b0;
	#2 flags_wr = 1'b1;
	#2 flags_in = 11'b00010101000;
	#2 flags_wr = 1'b0;
	#2 flags_in = 11'b10000100111;
	#2 flags_wr = 1'b1;
	#2 flags_wr = 1'b0;
	#2 flags_reset = 1'b1;
	#2 flags_reset = 1'b0;
end
endmodule