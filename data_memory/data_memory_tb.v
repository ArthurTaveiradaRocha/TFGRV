`timescale 1 ns/10 ps
`define WIDTH_DATA   32

module data_memory_tb();

    reg  clock_i;
    reg  [`WIDTH_DATA-1:0] addr_i;
    reg  [`WIDTH_DATA-1:0] wr_data_i;
    reg  [4:0] wr_enable_i;
    reg  [1:0] rd_enable_i;
    wire [`WIDTH_DATA-1:0] rd_data_o;

    data_memory UUT(
    .clock_i(clock_i), 
    .addr_i(addr_i), 
    .wr_data_i(wr_data_i),
    .wr_enable_i(wr_enable_i), 
    .rd_enable_i(rd_enable_i), 
    .rd_data_o(rd_data_o));

    always #5 clock_i <= ~clock_i; 

    always 
    begin
        clock_i = 0;

        addr_i      = 0;
        wr_data_i   = 32'b00000000000000001111111111111111;//b01010101010101010101010101010101;
        wr_enable_i = 4'b0001;
        rd_enable_i = 0;
        #20;

        addr_i      = 4;
        wr_data_i   = 32'b00000000000000001111111111111111;//b01010101010101010101010101010101;
        wr_enable_i = 4'b0010;
        rd_enable_i = 0;
        #20;

        addr_i      = 8;
        wr_data_i   = 32'b00000000000000001111111111111111;//b01010101010101010101010101010101;
        wr_enable_i = 4'b0011;
        rd_enable_i = 0;
        #20;

        addr_i      = 12;
        wr_data_i   = 32'b00000000000000001111111111111111;//b01010101010101010101010101010101;
        wr_enable_i = 4'b0100;
        rd_enable_i = 0;
        #20;

        addr_i      = 16;
        wr_data_i   = 32'b00000000000000001111111111111111;//b01010101010101010101010101010101;
        wr_enable_i = 4'b0101;
        rd_enable_i = 0;
        #20;

        addr_i      = 20;
        wr_data_i   = 32'b00000000000000001111111111111111;//b01010101010101010101010101010101;
        wr_enable_i = 4'b0110;
        rd_enable_i = 0;
        #20;

        addr_i      = 24;
        wr_data_i   = 32'b00000000000000001111111111111111;//b01010101010101010101010101010101;
        wr_enable_i = 4'b0111;
        rd_enable_i = 0;
        #20;

        addr_i      = 28;
        wr_data_i   = 32'b01010101010101010101010111010101;//b01010101010101010101010101010101;
        wr_enable_i = 4'b1111;
        rd_enable_i = 0;
        #20;

        addr_i      = 28;
        wr_data_i   = 32'b01010101010101010101010101010101;
        wr_enable_i = 0;
        rd_enable_i = 2'b01;
        #20;

        addr_i      = 28;
        wr_data_i   = 32'b10101010101010101010101010101010;
        wr_enable_i = 0;
        rd_enable_i = 2'b10;
        #20;

        addr_i      = 28;
        wr_data_i   = 32'b10101010101010101010101010101010;
        wr_enable_i = 0;
        rd_enable_i = 2'b11;
        #20;
    end

endmodule
