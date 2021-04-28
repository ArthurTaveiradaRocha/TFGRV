`timescale 1 ns/10 ps
module ula_tb();

    reg [31:0] data1_in;
    reg [31:0] data2_in;
    reg [6:0] opcode;
    reg [2:0] funct3;
    reg [6:0] funct7;
    wire [31:0] data_out;

    ula UUT(.data1_in(data1_in), .data2_in(data2_in), .opcode(opcode), .funct3(funct3), .funct7(funct7), .data_out(data_out));

    always 
    begin
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        opcode = 7'b0110011;
        funct3 = 3'b000;
        funct7 = 7'b0000000;
        #20; // high for 20 * timescale = 20 ns
    
        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000001010101010000000000; 
        opcode = 7'b0110011;
        funct3 = 3'b000;
        funct7 = 7'b0100000;
        #20; // low for 20 * timescale = 20 ns
    
        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000000000000000000000100; 
        opcode = 7'b0110011;
        funct3 = 3'b001;
        funct7 = 7'b0000000;
        #20; // low for 20 * timescale = 20 ns
    
        data1_in = 32'b00000011100000000000000101010101;
        data2_in = 32'b00000000000000000000000000000100; 
        opcode = 7'b0110011;
        funct3 = 3'b101;
        funct7 = 7'b0000000;
        #20; // low for 20 * timescale = 20 ns
    
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        opcode = 7'b0110011;
        funct3 = 3'b100;
        funct7 = 7'b0000000;
        #20; // high for 20 * timescale = 20 ns
    
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        opcode = 7'b0110011;
        funct3 = 3'b110;
        funct7 = 7'b0000000;
        #20; // high for 20 * timescale = 20 ns
        
        data1_in = 32'b01010101010101010101010101010101;
        data2_in = 32'b10101010101010101010101010101010; 
        opcode = 7'b0110011;
        funct3 = 3'b111;
        funct7 = 7'b0000000;
        #20; // high for 20 * timescale = 20 ns
    end
    
endmodule