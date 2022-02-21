`timescale 1 ns / 10 ps

module mux_3x1_test#(
        parameter DATA_WIDTH = 16
    );

    logic [DATA_WIDTH - 1:0] data_10, data_01, data_00;
    logic [1:0] sel_A;
    logic [DATA_WIDTH - 1:0] mux_A_out;

    mux_3x1 mux0(
        .in_10(data_10),
        .in_01(data_01),
        .in_00(data_00),
        .sel_3x1_in(sel_A), 
        .mux_3x1_out(mux_A_out)
    );

    initial
    begin
        data_01 = 15'b0000000001110001;
        data_00 = 15'b0000000000000000;
        data_10 = 16'b1111111110000010;
        sel_A = 2'b00;
        #1 sel_A = 2'b01;
        #1 sel_A = 2'b10;
        #1 sel_A = 2'b11;
        #1 data_10 = 16'b0000001010101010;
        #1 data_01 = 16'b0000000000000001;
        #1 sel_A = 2'b00;
        #1 sel_A = 2'b11;
        #1 sel_A = 2'b00;
        #1 data_00 = 16'b1111110001100100;
        #1 data_10 = 16'b0000000100000010;
    end
endmodule
