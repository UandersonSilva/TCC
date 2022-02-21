module ext#(
        parameter OPERAND_WIDTH = 11,
        parameter DATA_WIDTH = 16
    )
    (
        input logic [OPERAND_WIDTH - 1:0] ext_in,
        output logic [DATA_WIDTH - 1:0] ext_out
    );

    always @(ext_in)
    begin
		ext_out[OPERAND_WIDTH - 1:0] <= ext_in;
		ext_out[DATA_WIDTH - 1:OPERAND_WIDTH] <= {(DATA_WIDTH - OPERAND_WIDTH){ext_in[OPERAND_WIDTH - 1]}};
		/*
		if(ext_in[OPERAND_WIDTH - 1])
		    ext_out[DATA_WIDTH - 1:OPERAND_WIDTH] <= {(DATA_WIDTH - OPERAND_WIDTH){1'b1}};
		else
			ext_out[DATA_WIDTH - 1:OPERAND_WIDTH] <= {(DATA_WIDTH - OPERAND_WIDTH){1'b0}};
		*/	 
    end
endmodule
