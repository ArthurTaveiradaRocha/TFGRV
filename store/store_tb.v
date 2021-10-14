`timescale 1 ns/10 ps
`define SW  3'b010
`define SB  3'b000
`define SH  3'b001

module store_tb();

    reg [2:0] funct3_i;
    reg mem_write_i;
    reg [1:0] addr_i;
    wire [3:0] write_en_o;

    store UUT(
        .funct3_i(funct3_i), 
        .mem_write_i(mem_write_i),  
        .addr_i(addr_i),
        .write_en_o(write_en_o));

    always 
    begin
        funct3_i = `SW; 
        mem_write_i = 0;
        addr_i = 2'b00;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `SW; 
        mem_write_i = 1;
        addr_i = 2'b00;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `SW; 
        mem_write_i = 1;
        addr_i = 2'b01;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `SW; 
        mem_write_i = 1;
        addr_i = 2'b10;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `SW; 
        mem_write_i = 1;
        addr_i = 2'b11;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `SB; 
        mem_write_i = 0;
        addr_i = 2'b00;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `SB; 
        mem_write_i = 1;
        addr_i = 2'b00;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `SB; 
        mem_write_i = 1;
        addr_i = 2'b01;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `SB; 
        mem_write_i = 1;
        addr_i = 2'b10;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `SB; 
        mem_write_i = 1;
        addr_i = 2'b11;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `SH; 
        mem_write_i = 0;
        addr_i = 2'b00;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `SH; 
        mem_write_i = 1;
        addr_i = 2'b00;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `SH; 
        mem_write_i = 1;
        addr_i = 2'b01;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `SH; 
        mem_write_i = 1;
        addr_i = 2'b10;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `SH; 
        mem_write_i = 1;
        addr_i = 2'b11;
        #20; // high for 20 * timescale = 20 ns

    end
    
endmodule