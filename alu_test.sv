`timescale 1 ns / 1 ps

module alu_test;

    logic [10:0] A_in, B_in;
    logic  operation;
    logic [10:0] alu_out;

    ula U(
        .A_in(A_in), 
        .B_in(B_in), 
        .operation(operation), 
        .alu_out(alu_out)
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