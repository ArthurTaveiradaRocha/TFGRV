`timescale 1 ns/10 ps
`define LW  3'b010
`define LB  3'b000
`define LH  3'b001

module load_tb();

    reg [2:0] funct3_i;
    reg mem_read_i;
    wire [1:0] read_en_o;

    load UUT(
        .funct3_i(funct3_i), 
        .mem_read_i(mem_read_i),  
        .read_en_o(read_en_o));

    always 
    begin
        funct3_i = `LW; 
        mem_read_i = 0;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `LW; 
        mem_read_i = 1;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `LB; 
        mem_read_i = 0;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `LB; 
        mem_read_i = 1;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `LH; 
        mem_read_i = 0;
        #20; // high for 20 * timescale = 20 ns

        funct3_i = `LH; 
        mem_read_i = 1;
        #20; // high for 20 * timescale = 20 ns
    end
    
endmodule