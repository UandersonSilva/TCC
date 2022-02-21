`timescale 1 ns / 10 ps
module pc_adder_test#(
        parameter ADDRESS_WIDTH = 11
    );
    
    logic [ADDRESS_WIDTH - 1:0] pc_adder_in, pc_adder_out;

    pc_adder pc_adder0(
        .pc_adder_in(pc_adder_in),
        .pc_adder_out(pc_adder_out)
    );

    initial 
    begin
        pc_adder_in = 11'b00000000000;
        #1 pc_adder_in = pc_adder_out;
        #1 pc_adder_in = pc_adder_out;
        #1 pc_adder_in = pc_adder_out;
        #1 pc_adder_in = pc_adder_out;    
    end
endmodule