`timescale 1 ns / 10 ps

module register_test_2#(
        parameter WIDTH = 11
    );

    logic [WIDTH - 1:0] reg_in;
    logic reg_wr, reg_reset;
    logic clock;
    logic [WIDTH - 1:0] reg_out;

    clock_generator GCLOCK(clock);

    register #(.WIDTH(WIDTH)) register0(
        .reg_in(reg_in), 
        .reg_wr(reg_wr), 
        .reg_reset(reg_reset), 
        .clock(clock), 
        .reg_out(reg_out)
    );

    initial
    begin 
        reg_wr=1'b0; 
        reg_reset=1'b1;
        reg_in = 11'b01100110011;
        #2	reg_reset=1'b0;
            reg_wr=1'b1;
        #2	reg_wr=1'b0;
        #2	reg_reset=1'b1;
        #2	reg_reset=1'b0;
        #2	reg_in = 11'b11110111001;
        #2	reg_wr=1'b1;
        #2	reg_wr=1'b0;
        #2	reg_in = 11'b00000111111;
        #2	reg_in = 11'b00100101101;
        #2	reg_reset=1'b1;
        #2	reg_reset=1'b0;
        #2  reg_in = 11'b11100000011;	
    end
endmodule 