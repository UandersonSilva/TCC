`timescale 1 ns/1 ps

module ext_test;

logic [10:0] data_in, ext_out;

ext ext0(data_in, ext_out);

initial
begin
	data_in = 11'b00011000110;
	#1 data_in = 11'b10000000001;
	#1 data_in = 11'b00001001001;
	#1 data_in = 11'b11000000111;
	#1 data_in = 11'b00000000000;
end

endmodule