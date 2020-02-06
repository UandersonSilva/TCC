module control#(
    parameter OPERAND_WIDTH = 11,
    parameter INSTRUCTION_WIDTH = 16
)
(
    input logic [INSTRUCTION_WIDTH - 1:0] instruction_in, ext_in,
    input logic clock_in, status_Z_in, status_N_in, reset_in,
    output logic [OPERAND_WIDTH - 1:0] instruction_address_out, operand_out,
    output logic sel_B_out, alu_op_out, data_memory_wr_out,  
    output logic acc_wr_out,  status_wr_out, 
    output logic acc_reset_out,  status_reset_out, 
    output logic [1:0] sel_A_out
);

logic [INSTRUCTION_WIDTH - OPERAND_WIDTH:0] op_code;
logic [OPERAND_WIDTH - 1:0]pc_in, pc_out, pc_adder_out;
logic [INSTRUCTION_WIDTH - 1:0] ir_out;
logic pc_wr, ir_wr;
logic pc_reset, ir_reset, branch;

decoder decoder0(
	.op_code(op_code),
	.status_Z_in(status_Z_in),
	.status_N_in(status_N_in),
	.reset_in(reset_in),
	.clock_in(clock_in),
    .branch_out(branch),
    .sel_A_out(sel_A_out), 
    .sel_B_out(sel_B_out), 
    .alu_op_out(alu_op_out), 
    .data_memory_wr_out(data_memory_wr_out),
    .acc_wr_out(acc_wr_out), 
    .pc_wr_out(pc_wr), 
    .status_wr_out(status_wr_out), 
    .ir_wr_out(ir_wr),
    .acc_reset_out(acc_reset_out), 
    .pc_reset_out(pc_reset), 
    .status_reset_out(status_reset_out), 
    .ir_reset_out(ir_reset)
	);

    program_counter pc0(
        .pc_in(pc_in), 
        .pc_wr(pc_wr), 
        .pc_reset(pc_reset), 
        .clock(clock_in), 
        .pc_out(pc_out)
    );

    instruction_register ir0(
        .ir_in(instruction_in), 
        .ir_wr(ir_wr), 
        .ir_reset(ir_reset), 
        .clock(clock_in), 
        .ir_out(ir_out)
    );

    mux_pc mux_pc0(
        .in_1(ext_in[OPERAND_WIDTH - 1:0]),
        .in_0(pc_adder_out),
        .select_mux_pc(branch),
        .mux_pc_out(pc_in)
    );

     pc_adder pc_adder0(
        .pc_adder_in(pc_out),
        .pc_adder_out(pc_adder_out)
    );

    assign op_code = ir_out[INSTRUCTION_WIDTH - 1: OPERAND_WIDTH];
    assign operand_out = ir_out[OPERAND_WIDTH - 1:0];
    assign instruction_address_out = pc_out;

endmodule