`timescale 1 ns / 10 ps
module mux_2x1_test#(
        parameter DATA_WIDTH = 16
    );

    logic [DATA_WIDTH - 1:0] data_0, data_1;
    logic sel_2x1;
    logic [DATA_WIDTH - 1:0] mux_2x1_out;

    mux_2x1 mux0(
        .in_1(data_1),
        .in_0(data_0),
        .sel_2x1_in(sel_2x1),
        .mux_2x1_out(mux_2x1_out)
    );

    initial
    begin
        data_0 = 16'b0000000000000000; data_1 = 16'b0000000001001001;
        sel_2x1 = 1'b1;
        #1 data_1 = 11'b1111111101001001;
        #1 sel_2x1 = 1'b0;
        #1 sel_2x1 = 1'b1;
        #1 sel_2x1 = 1'b0;
        #1 data_0 = 16'b0000000001100100;
        #1 sel_2x1 = 1'b0;
        #1 sel_2x1 = 1'b1;
        #1 data_0 = 16'b0000000000000000;
    end
endmodule