module instruction_memory#(
        INSTRUCTION_WIDTH = 16,
        ADDRESS_WIDTH = 11
    )
    (
        input logic [ADDRESS_WIDTH - 1:0] address_in,
        output logic [INSTRUCTION_WIDTH - 1:0] instruction_out
    );

    localparam 
        FILE_PATH = "C:/Users/uande/Documents/TCC/BIP2/"; //instruction_memory.bin path on your computer

    logic [INSTRUCTION_WIDTH - 1:0] memory [2**ADDRESS_WIDTH - 1:0];

    initial 
    begin
        $readmemb({FILE_PATH, "instruction_memory.bin"}, memory);
    end

    assign instruction_out = memory[address_in];

endmodule