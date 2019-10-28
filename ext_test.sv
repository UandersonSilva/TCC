`timescale 1 ns / 10 ps

module ext_test#(
        parameter DATA_WIDTH = 11
    );

logic [DATA_WIDTH - 1:0] data, ext_out;

ext ext0(
	.data_in(data), 
	.ext_out(ext_out)
);

initial
begin
	data = 11'b00011000110;
	#1 data = 11'b10000000001;
	#1 data = 11'b00001001001;
	#1 data = 11'b11000000111;
	#1 data = 11'b00000000000;
end

endmodule