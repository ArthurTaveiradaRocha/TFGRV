`timescale 1 ns/10 ps
`define WIDTH_DATA   32

module register_file_tb();

    reg  clock_i;
    reg  reset_i;
    reg  reg_write_i;
    reg  [4:0] rd_register_1_i;
    reg  [4:0] rd_register_2_i;
    reg  [4:0] wr_register_i;
    reg  [`WIDTH_DATA-1:0] wr_data_i;
    wire [`WIDTH_DATA-1:0] rd_data_1_o;
    wire [`WIDTH_DATA-1:0] rd_data_2_o;

    register_file UUT(
    .clock_i(clock_i), 
    .reset_i(reset_i),
    .reg_write_i(reg_write_i), 
    .rd_register_1_i(rd_register_1_i),
    .rd_register_2_i(rd_register_2_i), 
    .wr_register_i(wr_register_i), 
    .wr_data_i(wr_data_i), 
    .rd_data_1_o(rd_data_1_o),
    .rd_data_2_o(rd_data_2_o));

    always #5 clock_i <= ~clock_i; 
    
    always 
    begin
        clock_i = 0;
        reset_i = 1;

        #14;

        reset_i = 0;
        
        reg_write_i     = 1;
        rd_register_1_i = 5'b00001;
        rd_register_2_i = 5'b00010;
        wr_register_i   = 5'b00001;
        wr_data_i       = 32'b01010101010101010101010101010101;
        #20; 

        reg_write_i     = 1;
        rd_register_1_i = 5'b00010;
        rd_register_2_i = 5'b00001;
        wr_register_i   = 5'b00010;
        wr_data_i       = 32'b10101010101010101010101010101010;
        #20; 

        reg_write_i     = 0;
        rd_register_1_i = 5'b00001;
        rd_register_2_i = 5'b00010;
        wr_register_i   = 5'b00001;
        wr_data_i       = 32'b10101010101010101010101010101010;
        #20;

        reg_write_i     = 0;
        rd_register_1_i = 5'b00001;
        rd_register_2_i = 5'b00010;
        wr_register_i   = 5'b00001;
        wr_data_i       = 32'b01010101010101010101010101010101;
        #20; 
    end
    
endmodule