`timescale 1 ns / 10 ps

module alu_test#(
        parameter DATA_WIDTH = 11
    );

    logic [DATA_WIDTH - 1:0] A_in, B_in;
    logic  operation;
    logic [DATA_WIDTH - 1:0] alu_out;
    logic zero_indicator, signal_bit;

    alu U(
        .A_in(A_in), 
        .B_in(B_in), 
        .operation(operation), 
        .alu_out(alu_out),
        .zero_indicator_out(zero_indicator), 
        .signal_bit_out(signal_bit)
    );

    initial
    begin
        A_in = 11'b01111111111; 
        B_in = 11'b00000000001;
        operation = 1'b0;
        #2 operation = 1'b1;
        #2 B_in = 11'b00000000010;
        #2 operation = 1'b0;
        #2 A_in = 11'b00000000011;
        #2 operation = 1'b1;	
    end
endmodule