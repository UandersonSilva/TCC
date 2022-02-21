module BIP2#(
        parameter OPERAND_ADDRESS_WIDTH = 11,
        parameter INSTRUCTION_DATA_WIDTH = 16
    )
    (
        input logic clock_in, reset_in,
        input logic [INSTRUCTION_DATA_WIDTH - 1:0] instruction_in, data_in,
        output logic [OPERAND_ADDRESS_WIDTH - 1:0] instruction_address_out, data_address_out,
        output logic [INSTRUCTION_DATA_WIDTH - 1:0] data_out,
        output logic data_memory_wr_out
    );

    logic [OPERAND_ADDRESS_WIDTH - 1:0] operand;
    //logic [INSTRUCTION_DATA_WIDTH - 1:0] ext;
    logic status_Z, status_N, status_reset, status_wr;
    logic [1:0] sel_A;
    logic sel_B, alu_op, acc_wr, acc_reset;

    control control0(
        .instruction_in(instruction_in), 
        //.ext_in(ext),
        .clock_in(clock_in), 
        .status_Z_in(status_Z), 
        .status_N_in(status_N), 
        .reset_in(reset_in),
        .instruction_address_out(instruction_address_out), 
        .operand_out(operand),
        .sel_B_out(sel_B), 
        .alu_op_out(alu_op), 
        .data_memory_wr_out(data_memory_wr_out),  
        .acc_wr_out(acc_wr),  
        .status_wr_out(status_wr), 
        .acc_reset_out(acc_reset),  
        .status_reset_out(status_reset), 
        .sel_A_out(sel_A)
    );

    datapath datapath0(
        .operand_in(operand), 
        .data_in(data_in),
        .alu_op_in(alu_op),
        .sel_A_in(sel_A), 
        .sel_B_in(sel_B),
        .clock_in(clock_in), 
        .acc_wr_in(acc_wr),
        .acc_reset_in(acc_reset), 
        .status_wr_in(status_wr), 
        .status_reset_in(status_reset), 
        .data_out(data_out), 
        //.ext_out(ext),
        .data_address_out(data_address_out),
        .status_Z_out(status_Z), 
        .status_N_out(status_N)
    );
endmodule