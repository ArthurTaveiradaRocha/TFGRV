`timescale 1 ns/10 ps
`define ADD_OP      17'b01100110000000000
`define SUB_OP      17'b01100110000100000
`define SLL_OP      17'b01100110010000000
`define SLT_OP      17'b01100110100000000
`define SLTU_OP     17'b01100110110000000
`define SRL_OP      17'b01100111010000000
`define SRA_OP      17'b01100111010100000
`define XOR_OP      17'b01100111000000000
`define OR_OP       17'b01100111100000000
`define AND_OP      17'b01100111110000000
`define LUI_OP      17'b01101110000000000
`define AUIPC_OP    17'b00101110000000000

module alu_control_tb();

    reg  [16:0] inst;
    reg  [2:0]  alu_op;
    wire [3:0]  alu_select;

    alu_control UUT(
        .inst(inst), 
        .alu_op(alu_op),  
        .alu_select(alu_select));

    always 
    begin
        inst = `ADD_OP;
        alu_op = 3'b000; 
        #20; // high for 20 * timescale = 20 ns

        inst = `ADD_OP;
        alu_op = 3'b001; 
        #20; // high for 20 * timescale = 20 ns

        inst = `ADD_OP;
        alu_op = 3'b010; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SUB_OP;
        alu_op = 3'b010; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SLL_OP;
        alu_op = 3'b010; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SLT_OP;
        alu_op = 3'b010; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SLTU_OP;
        alu_op = 3'b010; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SRL_OP;
        alu_op = 3'b010; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SRA_OP;
        alu_op = 3'b010; 
        #20; // high for 20 * timescale = 20 ns

        inst = `XOR_OP;
        alu_op = 3'b010; 
        #20; // high for 20 * timescale = 20 ns

        inst = `OR_OP;
        alu_op = 3'b010; 
        #20; // high for 20 * timescale = 20 ns

        inst = `AND_OP;
        alu_op = 3'b010; 
        #20; // high for 20 * timescale = 20 ns

        inst = `ADD_OP;
        alu_op = 3'b011; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SLL_OP;
        alu_op = 3'b011; 
        #20; // high for 20 * timescale = 20 ns

        inst = `SLT_OP;
        alu_op = 3'b011; 
        #20; // high for 20 * timescale = 20 ns
        
        inst = `SLTU_OP;
        alu_op = 3'b011; 
        #20; // high for 20 * timescale = 20 ns
        
        inst = `XOR_OP;
        alu_op = 3'b011; 
        #20; // high for 20 * timescale = 20 ns
        
        inst = `SRL_OP;
        alu_op = 3'b011; 
        #20; // high for 20 * timescale = 20 ns
        
        inst = `SRA_OP;
        alu_op = 3'b011; 
        #20; // high for 20 * timescale = 20 ns
        
        inst = `OR_OP;
        alu_op = 3'b011; 
        #20; // high for 20 * timescale = 20 ns
        
        inst = `AND_OP;
        alu_op = 3'b011; 
        #20; // high for 20 * timescale = 20 ns

        inst = `LUI_OP;
        alu_op = 3'b100; 
        #20; // high for 20 * timescale = 20 ns

        inst = `AUIPC_OP;
        alu_op = 3'b101; 
        #20; // high for 20 * timescale = 20 ns

    end
endmodule

