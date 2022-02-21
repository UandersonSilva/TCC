`timescale 1 ns / 10 ps

module instruction_memory_test#(
        INSTRUCTION_WIDTH = 16,
        ADDRESS_WIDTH = 11
    );

    logic [ADDRESS_WIDTH - 1:0] address_in;
    logic [INSTRUCTION_WIDTH - 1:0] instruction_out;

    instruction_memory instruction_memory0(
        .address_in(address_in),
        .instruction_out(instruction_out)
    );

    initial 
    begin
        address_in = 11'b00000000000;
        #1 address_in = 11'b00000000100;
        #1 address_in = 11'b00000000011;
        #1 address_in = 11'b00000001001;
    end

endmodule