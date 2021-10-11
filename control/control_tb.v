`timescale 1 ns/10 ps
`define OPCODE_R        7'b0110011
`define OPCODE_I        7'b0010011
`define OPCODE_L        7'b0000011
`define OPCODE_S        7'b0100011
`define OPCODE_B        7'b1100011
`define OPCODE_LUI      7'b0110111
`define OPCODE_AUIPC    7'b0010111
`define OPCODE_JAL      7'b1101111
`define OPCODE_JALR     7'b1100111

module control_tb();

    reg [6:0] opcode_i;
    wire reg_write_o;
    wire [2:0] alu_op_o;
    wire alu_src_o;
    wire alu_data1_o;
    wire mem_write_o;
    wire mem_read_o;
    wire men_to_reg_o;
    wire [1:0] branch_jump_o;

    control UUT(
        .opcode_i(opcode_i),
        .reg_write_o(reg_write_o),
        .alu_op_o(alu_op_o),
        .alu_src_o(alu_src_o),
        .alu_data1_o(alu_data1_o),
        .mem_write_o(mem_write_o),
        .mem_read_o(mem_read_o),
        .men_to_reg_o(men_to_reg_o),
        .branch_jump_o(branch_jump_o)
    );

    always
    begin
        opcode_i = `OPCODE_R;
        #20; // high for 20 * timescale = 20 ns

        opcode_i = `OPCODE_I;
        #20; // high for 20 * timescale = 20 ns

        opcode_i = `OPCODE_L;
        #20; // high for 20 * timescale = 20 ns

        opcode_i = `OPCODE_S;
        #20; // high for 20 * timescale = 20 ns

        opcode_i = `OPCODE_B;
        #20; // high for 20 * timescale = 20 ns

        opcode_i = `OPCODE_LUI;
        #20; // high for 20 * timescale = 20 ns

        opcode_i = `OPCODE_AUIPC;
        #20; // high for 20 * timescale = 20 ns

        opcode_i = `OPCODE_JAL;
        #20; // high for 20 * timescale = 20 ns
    end

endmodule