`timescale 1 ns / 1 ps

module acc_test;

    logic [10:0] acc_in;
    logic acc_wr, acc_reset;
    logic clock;
    logic [10:0] acc_out;

    clock_generator GCLOCK(clock);

    acc ACC(
        .acc_in(acc_in), 
        .acc_wr(acc_wr), 
        .acc_reset(acc_reset), 
        .clock(clock), 
        .acc_out(acc_out)
    );

    initial
        begin
            acc_in = 11'b00000110010; 
            acc_wr=1'b0; 
            acc_reset=1'b1;
            #2	acc_reset=1'b0;
                acc_wr=1'b1;
            #2	acc_wr=1'b0;
            #2	acc_reset=1'b1;
            #2	acc_reset=1'b0;
            #2	acc_in = 11'b10110010010;
            #2	acc_wr=1'b1;
            #2	acc_wr=1'b0;
            #2	acc_reset=1'b1;
            #2	acc_reset=1'b0;
            #2 acc_in = 11'b11100000011;	
        end
endmodule 