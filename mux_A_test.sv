`timescale 1ns / 1ps

module mux_A_test;

    logic [10:0] alu_in, ext_in, data_memory_in;
    logic [1:0] sel_A;
    logic [10:0] mux_A_out;

    mux_A Mux_A0( 
        .alu_in(alu_in), 
        .ext_in(ext_in), 
        .data_memory_in(data_memory_in), 
        .sel_A(sel_A), 
        .mux_A_out(mux_A_out)
    );

    initial
        begin
            ext_in = 11'b00001110001; 
            data_memory_in = 11'b00000000000; 
            alu_in = 11'b11110000010;
            sel_A = 2'b00;
            #1 sel_A = 2'b01;
            #1 sel_A = 2'b10;
            #1 alu_in = 11'b01010101010;
            #1 ext_in = 11'b00000000001;
            #1 sel_A = 2'b00;
            #1 sel_A = 2'b11;
            #1 sel_A = 2'b00;
            #1 data_memory_in = 11'b10001100100;
            #1 alu_in = 11'b00100000010;	
        end
endmodule 