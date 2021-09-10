`timescale 1 ns/10 ps
`define ADD_OP  10'b0000000000
`define SUB_OP  10'b0100000000
`define SLL_OP  10'b0000000001
`define SLT_OP  10'b0000000010
`define SLTU_OP 10'b0000000011
`define SRL_OP  10'b0000000101
`define SRA_OP  10'b0100000101
`define XOR_OP  10'b0000000100
`define OR_OP   10'b0000000110
`define AND_OP  10'b0000000111

module ula_control_tb();

    reg  [9:0] inst;
    reg  [1:0]  ula_op;
    wire [3:0]  ula_select;

    ula_control UUT(
        .inst(inst), 
        .ula_op(ula_op),  
        .ula_select(ula_select));

    always 
    begin
        inst = `ADD_OP;
        ula_op = 2'b00; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SUB_OP;
        ula_op = 2'b01; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SLT_OP;
        ula_op = 2'b01; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SLTU_OP;
        ula_op = 2'b01; 
        #20; // high for 20 * timescale = 20 ns

        inst = `ADD_OP;
        ula_op = 2'b10; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SUB_OP;
        ula_op = 2'b10; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SLL_OP;
        ula_op = 2'b10; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SLT_OP;
        ula_op = 2'b10; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SLTU_OP;
        ula_op = 2'b10; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SRL_OP;
        ula_op = 2'b10; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SRA_OP;
        ula_op = 2'b10; 
        #20; // high for 20 * timescale = 20 ns

        inst = `XOR_OP;
        ula_op = 2'b10; 
        #20; // high for 20 * timescale = 20 ns

        inst = `OR_OP;
        ula_op = 2'b10; 
        #20; // high for 20 * timescale = 20 ns

        inst = `AND_OP;
        ula_op = 2'b10; 
        #20; // high for 20 * timescale = 20 ns

    end

endmodule

