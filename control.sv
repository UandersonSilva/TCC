module control#(
    parameter DATA_WIDTH = 11,
    parameter INSTRUCTION_WIDTH = 16
)
(
    input logic [INSTRUCTION_WIDTH - 1:0] instruction_in,
    input logic clock_in, status_Z_in, status_N_in, reset_in,
    output logic [DATA_WIDTH - 1:0] address_out, operand_out,
    output logic sel_B_out, alu_op_out, data_memory_wr_out,  
    output logic acc_wr_out,  status_wr_out, 
    output logic acc_reset_out,  status_reset_out, 
    output logic [1:0] sel_A_out
);

logic [INSTRUCTION_WIDTH - DATA_WIDTH:0] op_code,
logic pc_wr, ir_wr,
logic pc_reset, ir_reset, branch,

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

    register pc0(
        .reg_in(reg_in), 
        .reg_wr(reg_wr), 
        .reg_reset(reg_reset), 
        .clock(clock), 
        .reg_out(reg_out)
    );

    instruction_register ir0(
        .ir_in(instruction_in), 
        .ir_wr(ir_wr), 
        .ir_reset(ir_reset), 
        .clock(clock), 
        .ir_out(ir_out)
    );

    mux_2x1 pc_mux0(
        .in_1(ext_in),
        .in_0(data_memory_in),
        .select_2x1(sel_B),
        .mux_out(mux_B_out)
    );

     pc_adder pc_adder0(
        .pc_adder_in(pc_adder_in),
        .pc_adder_out(pc_adder_out)
    );

endmodule