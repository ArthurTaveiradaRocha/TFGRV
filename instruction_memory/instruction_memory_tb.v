`timescale 1 ns/10 ps
`define WIDTH_DATA   32

module instruction_memory_tb();

    reg [`WIDTH_DATA-1:0] addr_i;
    wire [`WIDTH_DATA-1:0] instruction_o;
    
    instruction_memory UUT(
        .addr_i(addr_i), 
        .instruction_o(instruction_o));
    
    always
    begin
        addr_i = 0;
        #20;
    
        addr_i = 4;
        #20;
    
        addr_i = 8;
        #20;
    end

endmodule