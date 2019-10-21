`timescale 1ns / 1ps
module mux_B_test;

    logic [10:0] ext_in, data_memory_in;
    logic sel_B;
    logic [10:0] mux_B_out;

    mux_B Mux_B0(
        .ext_in(ext_in), 
        .data_memory_in(data_memory_in), 
        .sel_B(sel_B), 
        .mux_B_out(mux_B_out)
    );

    initial
    begin
        ext_in = 11'b00000000000; data_memory_in = 11'b00001001001;
        sel_B = 1'b1;
        #1 data_memory_in = 11'b11101001001;
        #1 sel_B = 1'b0;
        #1 sel_B = 1'b1;
        #1 sel_B = 1'b0;
        #1 ext_in = 11'b00001100100;
        #1 sel_B = 1'b0;
        #1 sel_B = 1'b1;
        #1 ext_in = 11'b00000000000;	
    end
endmodule 