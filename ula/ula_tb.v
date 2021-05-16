`timescale 1 ns/10 ps
`define ADD_OP  17'b01100110000000000
`define SUB_OP  17'b01100110000100000
`define SLL_OP  17'b01100110010000000
`define SLT_OP  17'b01100110100000000
`define SLTU_OP 17'b01100110110000000
`define SRL_OP  17'b01100111010000000
`define SRA_OP  17'b01100111010100000
`define XOR_OP  17'b01100111000000000
`define OR_OP   17'b01100111100000000
`define AND_OP  17'b01100111110000000

module ula_tb();

    reg [31:0] data1_in;
    reg [31:0] data2_in;
    reg [6:0] opcode;
    reg [2:0] funct3;
    reg [6:0] funct7;
    wire [31:0] data_out;

    ula UUT(
        .data1_in(data1_in), 
        .data2_in(data2_in), 
        .opcode(opcode), 
        .funct3(funct3), 
        .funct7(funct7), 
        .data_out(data_out));

    always 
    begin
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        {opcode, funct3, funct7} = `ADD_OP;
        #20; // high for 20 * timescale = 20 ns
    
        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000001010101010000000000; 
        {opcode, funct3, funct7} = `SUB_OP;
        #20; // low for 20 * timescale = 20 ns
    
        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000000000000000000000100; 
        {opcode, funct3, funct7} = `SLL_OP;
        #20; // low for 20 * timescale = 20 ns

        data1_in = 32'b00000000000000000000000000000100;
        data2_in = 32'b00000011100000000000000101010101;
        {opcode, funct3, funct7} = `SLT_OP;
        #20; // low for 20 * timescale = 20 ns

        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000000000000000000000100;
        {opcode, funct3, funct7} = `SLTU_OP;
        #20; // low for 20 * timescale = 20 ns
    
        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000000000000000000000100; 
        {opcode, funct3, funct7} = `SRL_OP;
        #20; // low for 20 * timescale = 20 ns

        data1_in = 32'b10000011100000000000000101010101;
        data2_in = 32'b00000000000000000000000000000100; 
        {opcode, funct3, funct7} = `SRA_OP;
        #20; // low for 20 * timescale = 20 ns
    
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        {opcode, funct3, funct7} = `XOR_OP;
        #20; // high for 20 * timescale = 20 ns
    
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        {opcode, funct3, funct7} = `OR_OP;
        #20; // high for 20 * timescale = 20 ns
        
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        {opcode, funct3, funct7} = `AND_OP;
        #20; // high for 20 * timescale = 20 ns
    end
    
endmodule