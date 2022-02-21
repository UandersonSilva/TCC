module control#(
    parameter OPERAND_WIDTH = 11,
    parameter INSTRUCTION_WIDTH = 16
)
(
    input logic [INSTRUCTION_WIDTH - 1:0] instruction_in, //ext_in,
    input logic clock_in, status_Z_in, status_N_in, reset_in,
    output logic [OPERAND_WIDTH - 1:0] instruction_address_out, operand_out,
    output logic sel_B_out, alu_op_out, data_memory_wr_out,  
    output logic acc_wr_out,  status_wr_out, 
    output logic acc_reset_out,  status_reset_out, 
    output logic [1:0] sel_A_out
);

logic [INSTRUCTION_WIDTH - OPERAND_WIDTH - 1:0] opcode;
logic [OPERAND_WIDTH - 1:0]selected_address, instruction_address, instruction_address_plus_1;
logic [OPERAND_WIDTH - 1:0] operand;
logic pc_wr, ir_wr;
logic pc_reset, ir_reset, branch;

    register ir0(
        .reg_in(instruction_in), 
        .reg_wr(ir_wr), 
        .reg_reset(ir_reset), 
        .clock(clock_in), 
        .reg_out({opcode, operand})
    );

    register #(.WIDTH(OPERAND_WIDTH)) pc0(
        .reg_in(selected_address), 
        .reg_wr(pc_wr), 
        .reg_reset(pc_reset), 
        .clock(clock_in), 
        .reg_out(instruction_address)
    );

    mux_2x1 #(.WIDTH(OPERAND_WIDTH)) mux_pc0(
        .in_1(operand),
        .in_0(instruction_address_plus_1),
        .sel_2x1_in(branch),
        .mux_2x1_out(selected_address)
    );

    pc_adder pc_adder0(
        .pc_adder_in(instruction_address),
        .pc_adder_out(instruction_address_plus_1)
    );

    decoder decoder0(
        .opcode_in(opcode),
        .status_Z_in(status_Z_in),
        .status_N_in(status_N_in),
        .reset_in(reset_in),
        .clock_in(!clock_in),
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

    

    //assign opcode = instruction[INSTRUCTION_WIDTH - 1: OPERAND_WIDTH];
    assign operand_out = operand; //instruction[OPERAND_WIDTH - 1:0];
    assign instruction_address_out = instruction_address;

endmodule