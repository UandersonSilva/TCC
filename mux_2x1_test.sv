`timescale 1 ns / 10 ps
module mux_2x1_test#(
        parameter DATA_WIDTH = 11
    );

    logic [DATA_WIDTH - 1:0] ext_in, data_memory_in;
    logic sel_B;
    logic [DATA_WIDTH - 1:0] mux_B_out;

    mux_2x1 mux_0(
        .in_1(ext_in),
        .in_0(data_memory_in),
        .select_2x1(sel_B),
        .mux_out(mux_B_out)
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
