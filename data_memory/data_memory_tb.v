`timescale 1 ns/10 ps
module data_memory_tb();

    reg  clock_i;
    reg  [31:0] addr_i;
    reg  [31:0] wr_data_i;
    reg  wr_enable_i;
    reg  rd_enable_i;
    wire [31:0] rd_data_o;

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
        wr_data_i   = 32'b01010101010101010101010101010101;
        wr_enable_i = 1;
        rd_enable_i = 0;
        #20;

        addr_i      = 4;
        wr_data_i   = 32'b10101010101010101010101010101010;
        wr_enable_i = 1;
        rd_enable_i = 0;
        #20;

        addr_i      = 0;
        wr_data_i   = 32'b01010101010101010101010101010101;
        wr_enable_i = 0;
        rd_enable_i = 1;
        #20;

        addr_i      = 4;
        wr_data_i   = 32'b10101010101010101010101010101010;
        wr_enable_i = 0;
        rd_enable_i = 1;
        #20;
    end

endmodule
