module data_memory#(
        DATA_WIDTH = 16,
        ADDRESS_WIDTH = 11
    )
    (
        input logic [DATA_WIDTH - 1:0] data_in,
        input logic [ADDRESS_WIDTH - 1:0] address_in,
        input logic data_memory_wr_in,
        input logic clock_in,
        output logic [DATA_WIDTH - 1:0] data_out
    );

    logic [DATA_WIDTH - 1:0] memory [2**ADDRESS_WIDTH - 1:0];

    always_ff @(posedge clock_in) 
    begin
        if(data_memory_wr_in)
            memory[address_in] <= data_in;
    end

    assign data_out = memory[address_in];

endmodule