`timescale 1 ns/10 ps
`define OPCODE_R    7'b0110011
`define OPCODE_LW   7'b0000011
`define OPCODE_SW   7'b0100011
`define OPCODE_BEQ  7'b1100011

module control_tb();

    reg [6:0] opcode_i;
    wire reg_write_o;
    wire [1:0] alu_op_o;
    wire alu_src_o;
    wire mem_write_o;
    wire mem_read_o;
    wire men_to_reg_o;
    wire branch_o;

    control UUT(
        .opcode_i(opcode_i),
        .reg_write_o(reg_write_o),
        .alu_op_o(alu_op_o),
        .alu_src_o(alu_src_o),
        .mem_write_o(mem_write_o),
        .mem_read_o(mem_read_o),
        .men_to_reg_o(men_to_reg_o),
        .branch_o(branch_o)
    );

    always
    begin
        opcode_i = `OPCODE_R;
        #20; // high for 20 * timescale = 20 ns

        opcode_i = `OPCODE_LW;
        #20; // high for 20 * timescale = 20 ns

        opcode_i = `OPCODE_SW;
        #20; // high for 20 * timescale = 20 ns

        opcode_i = `OPCODE_BEQ;
        #20; // high for 20 * timescale = 20 ns
    end

endmodule