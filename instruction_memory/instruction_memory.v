module instruction_memory(addr_i, instruction_o);

input [31:0] addr_i;
output [31:0] instruction_o;

reg [31:0] mem [2:0];

initial begin
    $readmemb("mem.mem", mem);
end

assign instruction_o = mem[addr_i];

endmodule
