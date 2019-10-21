`timescale 1 ns/1 ps

module mux_A_test;

logic [10:0] ULA_in, EXT_in, DATA_MEMORY_in;
logic [1:0] sel_A;
logic [10:0] MA_out;

mux_A Mux_A( 
    .ULA_in(ULA_in), 
    .EXT_in(EXT_in), 
    .DATA_MEMORY_in(DATA_MEMORY_in), 
    .sel_A(sel_A), 
    .MA_out(MA_out)
);

initial
    begin
        EXT_in = 11'b00001110001; DATA_MEMORY_in = 11'b00000000000; ULA_in = 11'b11110000010;
        sel_A = 2'b00;
        #1 sel_A = 2'b01;
        #1 sel_A = 2'b10;
        #1 sel_A = 2'b00;
        #1 sel_A = 2'b11;
        #1 sel_A = 2'b00;	
    end
endmodule 