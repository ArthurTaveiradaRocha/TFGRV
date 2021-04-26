`timescale 1 ns/10 ps
module immediate_generator_tb();

reg [31:0] addr_i;
wire [31:0] instruction_o;

instruction_memory UUT(.addr_i(addr_i), .instruction_o(instruction_o));

always
begin
    addr_i = 0;
    #20;

    addr_i = 1;
    #20;

    addr_i = 2;
    #20;
end

endmodule