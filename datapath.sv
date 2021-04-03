module datapath#(
        parameter DATA_WIDTH = 16,
        parameter OPERAND_WIDTH = 11
    )
    (
        
        input logic [OPERAND_WIDTH - 1:0] operand_in,
        input logic [DATA_WIDTH - 1:0] data_in,
        input logic alu_op_in, sel_B_in, clock_in,
        input logic status_wr_in, status_reset_in, acc_wr_in , acc_reset_in,
        input logic [1:0] sel_A_in,
        output logic [OPERAND_WIDTH - 1:0] data_address_out,
        output logic [DATA_WIDTH - 1:0] data_out, //ext_out,
        output logic status_Z_out, status_N_out
    );

    logic [DATA_WIDTH - 1:0] extended_operand, alu_result;
    logic [DATA_WIDTH - 1:0] selected_data_A, operand_B;
    logic [DATA_WIDTH - 1:0] operand_A;
    logic Z, N;

    ext ext0(
        .ext_in(operand_in),
        .ext_out(extended_operand)
	);
 
    mux_3x1 mux_A0(
        .in_10(alu_result),
        .in_01(extended_operand),
        .in_00(data_in),
        .sel_3x1_in(sel_A_in),
        .mux_3x1_out(selected_data_A)
    );

    mux_2x1 mux_B0(
        .in_1(extended_operand),
        .in_0(data_in),
        .sel_2x1_in(sel_B_in),
        .mux_2x1_out(operand_B)
    );

    register acc0(
        .reg_in(selected_data_A),
        .reg_wr(acc_wr_in),
        .reg_reset(acc_reset_in),
        .clock(clock_in),
        .reg_out(operand_A)
    );

    alu alu0(
        .alu_A_in(operand_A),
        .alu_B_in(operand_B),
        .alu_op_in(alu_op_in),
        .alu_out(alu_result),
        .alu_Z_out(Z),
        .alu_N_out(N)
    );

    register #(.WIDTH(2)) status0(
        .reg_in({Z, N}), 
        .reg_wr(status_wr_in), 
        .reg_reset(status_reset_in), 
        .clock(clock_in), 
        .reg_out({status_Z_out, status_N_out})
    );


    assign data_address_out = operand_in;
    //assign ext_out = ext_out_mux_A01_and_B1_in;
    assign data_out = operand_A;

endmodule