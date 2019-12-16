`timescale 1 ns/10 ps
module decoder_test#(
        parameter DATA_WIDTH = 11,
        parameter INSTRUCTION_WIDTH = 16
    );

	    logic [INSTRUCTION_WIDTH - DATA_WIDTH:0] op_code;
		logic clock_in, status_Z_in, status_N_in, reset_in;
		logic branch_out, sel_B_out, alu_op_out, data_memory_wr_out;  
		logic acc_wr_out, pc_wr_out, status_wr_out, ir_wr_out;
		logic acc_reset_out, pc_reset_out, status_reset_out, ir_reset_out;
		logic [1:0] sel_A_out;

clock_generator GCLOCK(clock_in);

decoder decoder0(
	.op_code(op_code),
	.status_Z_in(status_Z_in),
	.status_N_in(status_N_in),
	.reset_in(reset_in),
	.clock_in(clock_in),
    .branch_out(branch_out),
    .sel_A_out(sel_A_out), 
    .sel_B_out(sel_B_out), 
    .alu_op_out(alu_op_out), 
    .data_memory_wr_out(data_memory_wr_out),
    .acc_wr_out(acc_wr_out), 
    .pc_wr_out(pc_wr_out), 
    .status_wr_out(status_wr_out), 
    .ir_wr_out(ir_wr_out),
    .acc_reset_out(acc_reset_out), 
    .pc_reset_out(pc_reset_out), 
    .status_reset_out(status_reset_out), 
    .ir_reset_out(ir_reset_out)
	);
initial
	begin
		op_code = 5'b00000;//HLT 
		status_Z_in=1'b0; status_N_in=1'b0; reset_in = 1;
	
		#6 op_code=5'b00001;//STO
		#4 op_code=5'b00010;//LD
		#4 op_code=5'b00011;//LDI
		#4 op_code=5'b00100;//ADD
		#4 op_code=5'b00101;//ADDI
		#4 op_code=5'b00110;//SUB
		#4 op_code=5'b00111;//SUBI
		#4 op_code=5'b01000;//BEQ
			status_Z_in=1'b1;
		#4 status_Z_in=1'b0;
		#4 op_code=5'b01001;//BNE
			status_Z_in=1'b1;
		#4 status_Z_in=1'b0; 
		#4 op_code=5'b01010;//BGT
		#4 status_Z_in=1'b1;
		#4 status_N_in=1'b1;
		#4 status_Z_in=1'b0;
		#4 status_N_in=1'b0;
		#4 op_code=5'b01011;//BGE
		#4 status_N_in=1'b1;
		#4 op_code=5'b01100;//BLT
		#4 status_N_in=1'b0;
		#4 op_code=5'b01101;//BLE
		#4 status_Z_in=1'b1;
		#4 status_N_in=1'b1;
		#4 op_code=5'b01110;//JMP
		#4	reset_in = 1'b0;	
	end	
endmodule 