`timescale 1 ns / 10 ps

module register_test#(
        parameter WIDTH = 16
    );

    logic [WIDTH - 1:0] reg_in;
    logic reg_wr, reg_reset;
    logic clock;
    logic [WIDTH - 1:0] reg_out;

    clock_generator GCLOCK(clock);

    register register0(
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
        reg_in = 16'b0000000000110010;
        #2	reg_reset=1'b0;
            reg_wr=1'b1;
        #2	reg_wr=1'b0;
        #2	reg_reset=1'b1;
        #2	reg_reset=1'b0;
        #2	reg_in = 16'b1111110110010010;
        #2	reg_wr=1'b1;
        #2	reg_wr=1'b0;
        #2	reg_in = 16'b1111111000010011;
        #2	reg_in = 16'b0000000010010000;
        #2	reg_reset=1'b1;
        #2	reg_reset=1'b0;
        #2 reg_in = 16'b1111111100000011;	
    end
endmodule 