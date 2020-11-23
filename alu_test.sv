`timescale 1 ns / 10 ps

module alu_test#(
        parameter DATA_WIDTH = 16
    );

    logic [DATA_WIDTH - 1:0] alu_A_in, alu_B_in;
    logic  alu_op_in;
    logic [DATA_WIDTH - 1:0] alu_out;
    logic alu_Z_out, alu_N_out;

    alu U(
        .alu_A_in(alu_A_in), 
        .alu_B_in(alu_B_in), 
        .alu_op_in(alu_op_in), 
        .alu_out(alu_out),
        .alu_Z_out(alu_Z_out), 
        .alu_N_out(alu_N_out)
    );

    initial
    begin
        alu_A_in = 11'b01111111111; 
        alu_B_in = 11'b00000000001;
        alu_op_in = 1'b0;
        #2 alu_op_in = 1'b1;
        #2 alu_B_in = 11'b00000000010;
        #2 alu_op_in = 1'b0;
        #2 alu_A_in = 11'b00000000011;
        #2 alu_op_in = 1'b1;
        #2 alu_B_in = 11'b00000000011;
        #2 alu_op_in = 1'b0;
        #2 alu_B_in = 11'b00000000100;
        #2 alu_op_in = 1'b1;
        #2 alu_op_in = 1'b0;
    end
endmodule