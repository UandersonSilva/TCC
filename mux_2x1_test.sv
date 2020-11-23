`timescale 1 ns / 10 ps
module mux_2x1_test#(
        parameter DATA_WIDTH = 16
    );

    logic [DATA_WIDTH - 1:0] ext_in, data_memory_in;
    logic sel_B;
    logic [DATA_WIDTH - 1:0] mux_B_out;

    mux_2x1 mux0(
        .in_1(ext_in),
        .in_0(data_memory_in),
        .sel_2x1_in(sel_B),
        .mux_out(mux_B_out)
    );

    initial
    begin
        ext_in = 16'b0000000000000000; data_memory_in = 16'b0000000001001001;
        sel_B = 1'b1;
        #1 data_memory_in = 11'b1111111101001001;
        #1 sel_B = 1'b0;
        #1 sel_B = 1'b1;
        #1 sel_B = 1'b0;
        #1 ext_in = 16'b0000000001100100;
        #1 sel_B = 1'b0;
        #1 sel_B = 1'b1;
        #1 ext_in = 16'b0000000000000000;
    end
endmodule
