`timescale 1 ns / 10 ps

module ext_test#(
        parameter DATA_WIDTH = 16,
		parameter OPERAND_WIDTH = 11
    );

logic [DATA_WIDTH - 1:0] ext_out;
logic [OPERAND_WIDTH - 1:0] ext_in;

ext ext0(
	.ext_in(ext_in), 
	.ext_out(ext_out)
);

initial
begin
	ext_in = 11'b00000000000;
	#1 ext_in = 11'b10000000001;
	#1 ext_in = 11'b00001001001;
	#1 ext_in = 11'b11000000111;
	#1 ext_in = 11'b00011000110;
end

endmodule