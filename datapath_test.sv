`timescale 1 ns / 10 ps

module datapath_test#(
        parameter OPERAND_WIDTH = 11,
        parameter DATA_WIDTH = 16
    );

    logic [DATA_WIDTH - 1:0] data;
    logic [OPERAND_WIDTH - 1:0] operand, data_address_out;
    logic alu_op, sel_B, acc_wr, clock;
    logic status_wr, status_reset, acc_reset;
    logic [1:0] sel_A;
    logic [DATA_WIDTH - 1:0] data_out; //ext_out;
    logic status_Z_out, status_N_out;

    clock_generator GCLOCK(clock);

    datapath datapath0(
        .operand_in(operand), 
        .data_in(data),
        .alu_op_in(alu_op),
        .sel_A_in(sel_A), 
        .sel_B_in(sel_B),
        .clock_in(clock), 
        .acc_wr_in(acc_wr),
        .acc_reset_in(acc_reset), 
        .status_wr_in(status_wr), 
        .status_reset_in(status_reset), 
        .data_out(data_out), 
        //.ext_out(ext_out),
        .data_address_out(data_address_out),
        .status_Z_out(status_Z_out), 
        .status_N_out(status_N_out)
    );

    initial
    begin
        operand = 11'b00000000010; data = 16'b00000_00000000001;
        alu_op = 0; sel_A = 0; sel_B = 0; acc_wr = 1'b0; status_wr = 0; acc_reset = 1; status_reset = 1;
        #1 acc_reset = 0; status_reset = 0; status_wr  = 1'b0; acc_wr = 1'b1;
        #2  sel_A = 2'b01; acc_wr = 1'b0;
        #2 acc_wr = 1'b1;
        #2 sel_A = 2'b10; status_wr  = 1'b1;
        #2 sel_A = 2'b00; status_wr  = 1'b0;
        #2 alu_op = 1; sel_A = 2'b10; status_wr  = 1'b1; acc_wr = 1'b1;
        #2 sel_B = 1'b1;
        #2 status_wr  = 1'b0; acc_wr = 1'b0;
        #2 alu_op = 0; operand = 11'b00000000101; sel_A = 2'b01; acc_wr = 1'b1; 
        #2 sel_A = 2'b10; sel_B = 1'b0; acc_wr = 1'b1; status_wr  = 1'b1;
        #2 status_wr  = 1'b0; acc_wr = 1'b0;
    end
endmodule