`timescale 1 ns / 10 ps

module BIP2_test#(
        parameter OPERAND_ADDRESS_WIDTH = 11,
        parameter INSTRUCTION_DATA_WIDTH = 16
    );

	logic [INSTRUCTION_DATA_WIDTH - 1:0] instruction, bip2_data_out, data;
	logic clock, reset, data_wr;
	logic [OPERAND_ADDRESS_WIDTH - 1:0] data_address, instruction_address;

clock_generator GCLOCK(clock);

BIP2 bip2(
        .clock_in(clock), 
        .reset_in(reset),
        .instruction_in(instruction), 
        .data_in(data), 
        .instruction_address_out(instruction_address), 
        .data_address_out(data_address),
        .data_out(bip2_data_out), 
        .data_memory_wr_out(data_wr)
    );

	instruction_memory instruction_memory0(
		.address_in(instruction_address),
		.instruction_out(instruction)
	);

	data_memory data_memory0(
		.data_in(bip2_data_out),
        .address_in(data_address),
        .data_memory_wr_in(data_wr),
        .clock_in(clock),
        .data_out(data)
	);

initial
	begin
		reset = 1'b1;
	end 
	/*
		instruction = 16'b00000_00000101010; data = 16'b00000_00000000001;
		reset = 1'b1;
		#6 instruction=16'b00001_00000000001; //STO
		#4 instruction=16'b00010_00000000010; //LD
		#4 instruction=16'b00011_00000000011; //LDI
		#4 instruction=16'b00100_00000000100; //ADD
		#4 instruction=16'b00101_00000000101; //ADDI
		#4 instruction=16'b00110_00000000110; //SUB
		#4 instruction=16'b00111_00000000111; //SUBI
		//Branches
		//#4 instruction=16'b01000_00000001000;//BEQ
		//#4 instruction=16'b01001_00000001001;//BNE
		//#4 instruction=16'b01010_00000001010;
		//#4 instruction=16'b01011_00000001011;
		//#4 instruction=16'b01100_00000001100;
		//#4 instruction=16'b01101_00000001101;
		//#4 instruction=16'b01110_00000001110;

		#6 reset = 1'b0;
		#2 reset = 1'b1;
		#4 instruction=16'b01001_00000001001; //BNE
        #4 instruction=16'b00000_00000000000; //HLT
	end*/
endmodule