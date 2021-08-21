module instruction_memory(addr_i, instruction_o);
    
    input [31:0] addr_i;
    output [31:0] instruction_o;
    
    reg [31:0] mem [255:0];
    
    initial begin
        $readmemh("../instruction_memory/instruction.rv", mem);
    end
    
    assign instruction_o = mem[addr_i >> 2];

endmodule
