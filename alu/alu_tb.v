`timescale 1 ns/10 ps
`define WIDTH_DATA 32
`define ALU_ADD    4'b0001
`define ALU_SUB    4'b0010
`define ALU_SLL    4'b0011
`define ALU_SLT    4'b0100
`define ALU_SLTU   4'b0101
`define ALU_SRL    4'b0110
`define ALU_SRA    4'b0111
`define ALU_XOR    4'b1000
`define ALU_OR     4'b1001
`define ALU_AND    4'b1010
`define ALU_LUI    4'b1011
`define ALU_AUIPC  4'b1100

module alu_tb();

    reg  [`WIDTH_DATA-1:0] data1_in;
    reg  [`WIDTH_DATA-1:0] data2_in;
    reg  [3:0] select_alu;
    wire [`WIDTH_DATA-1:0] data_out;
    wire zero;

    alu UUT(
        .data1_in(data1_in), 
        .data2_in(data2_in), 
        .select_alu(select_alu),  
        .data_out(data_out),
        .zero(zero));

    always 
    begin
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        select_alu = `ALU_ADD;
        #20; // high for 20 * timescale = 20 ns
    
        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000001010101010000000000;
        select_alu = `ALU_SUB;
        #20; // low for 20 * timescale = 20 ns
    
        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000000000000000000000100; 
        select_alu = `ALU_SLL;
        #20; // low for 20 * timescale = 20 ns

        data1_in = 32'b00000000000000000000000000000100;
        data2_in = 32'b00000011100000000000000101010101;
        select_alu = `ALU_SLT;
        #20; // low for 20 * timescale = 20 ns

        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000000000000000000000100;
        select_alu = `ALU_SLTU;
        #20; // low for 20 * timescale = 20 ns
    
        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000000000000000000000100; 
        select_alu = `ALU_SRL;
        #20; // low for 20 * timescale = 20 ns

        data1_in = 32'b10000011100000000000000101010101;
        data2_in = 32'b00000000000000000000000000000100; 
        select_alu = `ALU_SRA;
        #20; // low for 20 * timescale = 20 ns
    
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        select_alu = `ALU_XOR;
        #20; // high for 20 * timescale = 20 ns
    
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        select_alu = `ALU_OR;
        #20; // high for 20 * timescale = 20 ns
        
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        select_alu = `ALU_AND;
        #20; // high for 20 * timescale = 20 ns

        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        select_alu = `ALU_LUI;
        #20; // high for 20 * timescale = 20 ns

        data1_in = 32'b00000000000000000000000001000000;
        data2_in = 32'b00000000000000000000000001000000; 
        select_alu = `ALU_AUIPC;
        #20; // high for 20 * timescale = 20 ns
    end
    
endmodule