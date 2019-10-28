`timescale 1 ns / 10 ps

module register_test#(
        parameter DATA_WIDTH = 11
    );

    logic [DATA_WIDTH - 1:0] reg_in;
    logic reg_wr, reg_reset;
    logic clock;
    logic [DATA_WIDTH - 1:0] reg_out;

    clock_generator GCLOCK(clock);

    register acc0(
        .reg_in(reg_in), 
        .reg_wr(reg_wr), 
        .reg_reset(reg_reset), 
        .clock(clock), 
        .reg_out(reg_out)
    );

    initial
    begin
        reg_in = 11'b00000110010; 
        reg_wr=1'b0; 
        reg_reset=1'b1;
        #2	reg_reset=1'b0;
            reg_wr=1'b1;
        #2	reg_wr=1'b0;
        #2	reg_reset=1'b1;
        #2	reg_reset=1'b0;
        #2	reg_in = 11'b10110010010;
        #2	reg_wr=1'b1;
        #2	reg_wr=1'b0;
        #2	reg_reset=1'b1;
        #2	reg_reset=1'b0;
        #2 reg_in = 11'b11100000011;	
    end
endmodule 