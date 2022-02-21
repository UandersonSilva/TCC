`timescale 1 ns / 10 ps

module data_memory_test#(
        DATA_WIDTH = 16,
        ADDRESS_WIDTH = 11
    );

    logic [DATA_WIDTH - 1:0] data_in;
    logic [ADDRESS_WIDTH - 1:0] address_in;
    logic data_memory_wr_in;
    logic clock_in;
    logic [DATA_WIDTH - 1:0] data_out;

    clock_generator GCLOCK(clock_in);

    data_memory data_memory0(
        .data_in(data_in),
        .address_in(address_in),
        .data_memory_wr_in(data_memory_wr_in),
        .clock_in(clock_in),
        .data_out(data_out)
    );

    initial 
    begin
        data_in = 16'b0000000000000001;
        address_in = 11'b00000000000; 
        data_memory_wr_in = 1'b0;
        #1 data_memory_wr_in = 1'b1;
        #2 data_in = 16'b0000000000000101;
           address_in = 11'b01111111111;
        #2 data_in = 16'b1111111111111111;
           address_in = 11'b10000000000;
        #2 data_in = 16'b1111111111111011;
           address_in = 11'b11111111111;
        #2 data_memory_wr_in = 1'b0;
           address_in = 11'b00000000000;
        #1 address_in = 11'b01111111111;
        #1 address_in = 11'b10000000000;
        #1 address_in = 11'b11111111111;
    end

endmodule