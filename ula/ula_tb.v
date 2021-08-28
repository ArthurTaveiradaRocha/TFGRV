`timescale 1 ns/10 ps
`define ULA_ADD  4'b0001
`define ULA_SUB  4'b0010
`define ULA_SLL  4'b0011
`define ULA_SLT  4'b0100
`define ULA_SLTU 4'b0101
`define ULA_SRL  4'b0110
`define ULA_SRA  4'b0111
`define ULA_XOR  4'b1000
`define ULA_OR   4'b1001
`define ULA_AND  4'b1010
`define ULA_LUI  4'b1011

module ula_tb();

    reg  [31:0] data1_in;
    reg  [31:0] data2_in;
    reg  [3:0] select_ula;
    wire [31:0] data_out;
    wire zero;

    ula UUT(
        .data1_in(data1_in), 
        .data2_in(data2_in), 
        .select_ula(select_ula),  
        .data_out(data_out),
        .zero(zero));

    always 
    begin
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        select_ula = `ULA_ADD;
        #20; // high for 20 * timescale = 20 ns
    
        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000001010101010000000000;
        select_ula = `ULA_SUB;
        #20; // low for 20 * timescale = 20 ns
    
        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000000000000000000000100; 
        select_ula = `ULA_SLL;
        #20; // low for 20 * timescale = 20 ns

        data1_in = 32'b00000000000000000000000000000100;
        data2_in = 32'b00000011100000000000000101010101;
        select_ula = `ULA_SLT;
        #20; // low for 20 * timescale = 20 ns

        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000000000000000000000100;
        select_ula = `ULA_SLTU;
        #20; // low for 20 * timescale = 20 ns
    
        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000000000000000000000100; 
        select_ula = `ULA_SRL;
        #20; // low for 20 * timescale = 20 ns

        data1_in = 32'b10000011100000000000000101010101;
        data2_in = 32'b00000000000000000000000000000100; 
        select_ula = `ULA_SRA;
        #20; // low for 20 * timescale = 20 ns
    
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        select_ula = `ULA_XOR;
        #20; // high for 20 * timescale = 20 ns
    
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        select_ula = `ULA_OR;
        #20; // high for 20 * timescale = 20 ns
        
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        select_ula = `ULA_AND;
        #20; // high for 20 * timescale = 20 ns

        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        select_ula = `ULA_LUI;
        #20; // high for 20 * timescale = 20 ns
    end
    
endmodule