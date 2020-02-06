`timescale 1 ns / 10 ps

module instruction_register_test#(
        parameter INSTRUCTION_REGISTER = 16
    );

    logic [INSTRUCTION_REGISTER - 1:0] ir_in;
    logic ir_wr, ir_reset;
    logic clock;
    logic [INSTRUCTION_REGISTER - 1:0] ir_out;

    clock_generator GCLOCK(clock);

    instruction_register register0(
        .ir_in(ir_in), 
        .ir_wr(ir_wr), 
        .ir_reset(ir_reset), 
        .clock(clock), 
        .ir_out(ir_out)
    );

    initial
    begin 
        ir_wr=1'b0; 
        ir_reset=1'b1;
        ir_in = 16'b0010110010110010;
        #2	ir_reset=1'b0;
            ir_wr=1'b1;
        #2	ir_wr=1'b0;
        #2	ir_reset=1'b1;
        #2	ir_reset=1'b0;
        #2	ir_in = 16'b1111010010010010;
        #2	ir_wr=1'b1;
        #2	ir_wr=1'b0;
        #2	ir_in = 16'b0000011000010011;
        #2	ir_in = 16'b0001000100001111;
        #2	ir_reset=1'b1;
        #2	ir_reset=1'b0;
        #2 ir_in = 16'b1010110000001100;	
    end
endmodule 