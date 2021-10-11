`define BEQ  3'b000
`define BNE  3'b001
`define BLT  3'b100
`define BGE  3'b101
`define BLTU 3'b110
`define BGEU 3'b111

module branch_tb();

    reg  zero_r;
    reg  [2:0] funct3_r;
    reg  [1:0] branch_r;
    wire [1:0] branch_w;

    branch UUT(
        .zero_i(zero_r),
        .funct3_i(funct3_r),  
        .branch_i(branch_r),
        .branch_o(branch_w));

    always 
    begin
        branch_r = 2'b01;
        funct3_r = `BEQ;
        zero_r = 0; 
        #20; // high for 20 * timescale = 20 ns

        branch_r = 2'b01;
        funct3_r = `BEQ;
        zero_r = 1; 
        #20; // high for 20 * timescale = 20 ns

        branch_r = 2'b01;
        funct3_r = `BNE;
        zero_r = 0; 
        #20; // high for 20 * timescale = 20 ns

        branch_r = 2'b01;
        funct3_r = `BNE;
        zero_r = 1; 
        #20; // high for 20 * timescale = 20 ns

        branch_r = 2'b01;
        funct3_r = `BLT;
        zero_r = 0; 
        #20; // high for 20 * timescale = 20 ns

        branch_r = 2'b01;
        funct3_r = `BLT;
        zero_r = 1; 
        #20; // high for 20 * timescale = 20 ns

        branch_r = 2'b01;
        funct3_r = `BGE;
        zero_r = 0; 
        #20; // high for 20 * timescale = 20 ns

        branch_r = 2'b01;
        funct3_r = `BGE;
        zero_r = 1; 
        #20; // high for 20 * timescale = 20 ns

        branch_r = 2'b01;
        funct3_r = `BLTU;
        zero_r = 0; 
        #20; // high for 20 * timescale = 20 ns

        branch_r = 2'b01;
        funct3_r = `BLTU;
        zero_r = 1; 
        #20; // high for 20 * timescale = 20 ns

        branch_r = 2'b01;
        funct3_r = `BGEU;
        zero_r = 0; 
        #20; // high for 20 * timescale = 20 ns

        branch_r = 2'b01;
        funct3_r = `BGEU;
        zero_r = 1; 
        #20; // high for 20 * timescale = 20 ns

        branch_r = 2'b10;
        funct3_r = `BEQ;
        zero_r = 1; 
        #20; // high for 20 * timescale = 20 ns

        branch_r = 2'b11;
        funct3_r = `BEQ;
        zero_r = 1; 
        #20; // high for 20 * timescale = 20 ns
    end

endmodule