`timescale 1ns / 1ps

module clock_generator(output logic clock_out);

    initial
    begin
        clock_out = 0; 
    end 
        
    always  
        #1 clock_out = !clock_out; 

endmodule