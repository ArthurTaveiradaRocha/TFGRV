`define WIDTH_DATA   32

module instruction_memory
(addr_i, 
instruction_o);
    
    input [`WIDTH_DATA-1:0] addr_i;
    output [`WIDTH_DATA-1:0] instruction_o;
    
    reg [`WIDTH_DATA-1:0] mem [255:0];
    
    initial begin
        $readmemh("../instruction_memory/instruction.rv", mem);
    end
    
    assign instruction_o = mem[addr_i >> 2];

endmodule
