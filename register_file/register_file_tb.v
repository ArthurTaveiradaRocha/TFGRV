`timescale 1 ns/10 ps
module register_file_tb();

    reg  clock_i;
    reg  reg_write_i;
    reg  [4:0] rd_register_1_i;
    reg  [4:0] rd_register_2_i;
    reg  [4:0] wr_register_i;
    reg  [31:0] wr_data_i;
    wire [31:0] rd_data_1_o;
    wire [31:0] rd_data_2_o;

    register_file UUT(
    .clock_i(clock_i), 
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