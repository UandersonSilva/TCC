module datapath#(
        parameter DATA_WIDTH = 11
    )
    (
        input logic [DATA_WIDTH - 1:0] operand_in, data_memory_in,
        input logic op_alu_in, sel_B_in, acc_wr_in, clock_in,
        input logic status_wr_in, status_reset_in, acc_reset_in,
        input logic [1:0] sel_A_in,
        output logic [DATA_WIDTH - 1:0] data_out, ext_out,
        output logic [DATA_WIDTH - 1:0] data_memory_address_out,
        output logic flag_Z_out, flag_N_out
    );

    logic [DATA_WIDTH - 1:0] ext_out_mux_A_and_B_in, alu_out_mux_A_in;
    logic [DATA_WIDTH - 1:0] mux_A_out_acc_in, mux_B_out_alu_B_in;
    logic [DATA_WIDTH - 1:0] acc_out_data_out_and_alu_A_in;
    logic zero_indicator, signal_bit;

    register acc0(
        .reg_in(mux_A_out_acc_in), 
        .reg_wr(acc_wr_in), 
        .reg_reset(acc_reset_in), 
        .clock(clock_in), 
        .reg_out(acc_out_data_out_and_alu_A_in)
    );

    alu alu0(
        .A_in(acc_out_data_out_and_alu_A_in), 
        .B_in(mux_B_out_alu_B_in), 
        .operation(op_alu_in), 
        .alu_out(alu_out_mux_A_in),
        .zero_indicator_out(zero_indicator),
        .signal_bit_out(signal_bit)
    );

    ext ext0(
        .data_in(operand_in), 
        .ext_out(ext_out_mux_A_and_B_in)
	);

    status status0(
        .zero_indicator_in(zero_indicator), 
	    .signal_bit_in(signal_bit), 
        .clock(clock_in), 
        .status_wr(status_wr_in), 
        .status_reset(status_reset_in), 
        .flag_Z(flag_Z_out), 
        .flag_N(flag_N_out)
    );

    mux_A mux_A0( 
        .alu_in(alu_out_mux_A_in), 
        .ext_in(ext_out_mux_A_and_B_in), 
        .data_memory_in(data_memory_in), 
        .sel_A(sel_A_in), 
        .mux_A_out(mux_A_out_acc_in)
    );

    mux_B mux_B0(
        .ext_in(ext_out_mux_A_and_B_in), 
        .data_memory_in(data_memory_in), 
        .sel_B(sel_B_in), 
        .mux_B_out(mux_B_out_alu_B_in)
    );

    assign data_memory_address_out = operand_in;
    assign ext_out = ext_out_mux_A_and_B_in;
    assign data_out = acc_out_data_out_and_alu_A_in;

endmodule