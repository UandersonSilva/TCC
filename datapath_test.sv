`timescale 1 ns / 10 ps

module datapath_test#(
        parameter DATA_WIDTH = 11
    );

    logic [DATA_WIDTH - 1:0] operand, data_memory;
    logic alu_op, sel_B, acc_wr, clock;
    logic status_wr, status_reset, acc_reset;
    logic [1:0] sel_A;
    logic [DATA_WIDTH - 1:0] data_out, ext_out;
    logic [DATA_WIDTH - 1:0] data_memory_address_out;
    logic flag_Z_out, flag_N_out;

    clock_generator GCLOCK(clock);

    datapath datapath0(
        .operand_in(operand), 
        .data_memory_in(data_memory),
        .alu_op_in(alu_op),
        .sel_A_in(sel_A), 
        .sel_B_in(sel_B),
        .clock_in(clock), 
        .acc_wr_in(acc_wr),
        .acc_reset_in(acc_reset), 
        .status_wr_in(status_wr), 
        .status_reset_in(status_reset), 
        .data_out(data_out), 
        .ext_out(ext_out),
        .data_memory_address_out(data_memory_address_out),
        .flag_Z_out(flag_Z_out), 
        .flag_N_out(flag_N_out)
    );

    initial
    begin
        operand = 11'b00000000001; data_memory = 11'b00000000001;
        alu_op = 1; sel_A = 0; sel_B = 0; acc_wr = 1'b0; acc_reset = 1; status_reset = 1;
        #2 acc_reset = 0; status_reset = 0; status_wr  = 1'b0;
        #2 acc_wr = 1'b1;
        #2 acc_wr = 1'b0;
        #2 sel_A = 2'b10;
        #2 status_wr  = 1'b1;
        #2 status_wr  = 1'b0;
        #2 acc_wr = 1'b1;
        #2 acc_wr = 1'b0;
    end
endmodule