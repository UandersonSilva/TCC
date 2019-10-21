`timescale 1 ns/1 ps
module mux_B_test;

logic [10:0] EXT_in, DATA_MEMORY_in;
logic sel_B;
logic [10:0] MB_out;

mux_B Mux_B(
    .EXT_in(EXT_in), 
    .DATA_MEMORY_in(DATA_MEMORY_in), 
    .sel_B(sel_B), 
    .MB_out(MB_out)
);

initial
    begin
        EXT_in = 11'b00000000000; DATA_MEMORY_in = 11'b00001001001;
        sel_B = 1'b1;
        #1 sel_B = 1'b0;
        #1 sel_B = 1'b1;
        #1 sel_B = 1'b0;
        #1 sel_B = 1'b0;
        #1 sel_B = 1'b1;	
    end
endmodule 