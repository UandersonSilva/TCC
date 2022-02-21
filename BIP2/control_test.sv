`timescale 1 ns / 10 ps

module control_test#(
    parameter OPERAND_WIDTH = 11,
    parameter INSTRUCTION_WIDTH = 16
);

	logic [INSTRUCTION_WIDTH - 1:0] instruction;
    logic clock, status_Z, status_N, reset;
    logic [OPERAND_WIDTH - 1:0] address, operand;
    logic sel_B, alu_op, data_memory_wr;  
    logic acc_wr,  status_wr;
    logic acc_reset,  status_reset; 
    logic [1:0] sel_A;

	clock_generator GCLOCK(clock);
	
	control control0(
		.instruction_in(instruction), 
        //.ext_in(ext),
        .clock_in(clock), 
        .status_Z_in(status_Z), 
        .status_N_in(status_N), 
        .reset_in(reset),
        .instruction_address_out(address), 
        .operand_out(operand),
        .sel_B_out(sel_B), 
        .alu_op_out(alu_op), 
        .data_memory_wr_out(data_memory_wr),  
        .acc_wr_out(acc_wr),  
        .status_wr_out(status_wr), 
        .acc_reset_out(acc_reset),  
        .status_reset_out(status_reset), 
        .sel_A_out(sel_A)
    );

	initial
	begin
		status_Z=1'b0; status_N=1'b0; reset = 1;
		//ext = 16'b0000001010101100;
		instruction = 16'b0000100000001101;//STO
		//#4 instruction = 16'b0001000000000000;//LD
		//#4 instruction = 16'b0001100000000001;//LDI
		#6 instruction = 16'b0010000000000010;//ADD
		//#4 instruction = 16'b0010100000000101;//ADDI
		//#4 instruction = 16'b0011000000000011;//SUB
		#4 instruction = 16'b0011100000011000;//SUBI
		#4 instruction = 16'b0100000000110011;//BEQ
			status_Z=1'b1;
		#4 status_Z=1'b0;
		/*#4 instruction = 16'b0100100000000000;//BNE
			status_Z=1'b1;
		#4 status_Z=1'b0; 
		#4 instruction = 16'b0101000000000000;//BGT
		#4 status_Z=1'b1;
		#4 status_N=1'b1;
		#4 status_Z=1'b0;
		#4 status_N=1'b0;*/
		#4 instruction = 16'b0101100000001000;//BGE
		#4 status_N=1'b1;
		//#4 instruction = 16'b0110000000000000;//BLT
		//#4 status_N=1'b0;
		//#4 instruction = 16'b0110100000000000;//BLE
		//#4 status_Z=1'b1;
		//#4 status_N=1'b1;
		//#4 instruction = 16'b0111000000000000;//JMP
		#6 reset = 1'b0;	
	end	
endmodule 