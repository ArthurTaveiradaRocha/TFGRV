module register_file
(clock_i, 
reg_write_i, 
rd_register_1_i, 
rd_register_2_i, 
wr_register_i, 
wr_data_i, 
rd_data_1_o, 
rd_data_2_o);

    input  clock_i;
    input  reg_write_i;
    input  [4:0] rd_register_1_i;
    input  [4:0] rd_register_2_i;
    input  [4:0] wr_register_i;
    input  [31:0] wr_data_i;
    output [31:0] rd_data_1_o;
    output [31:0] rd_data_2_o;

    reg [31:0] registers [31:0];
    integer i;

    always @(posedge clock_i)
    begin
        if (reg_write_i == 1) 
        begin
            if (wr_register_i != 0)
            begin
                registers [wr_register_i] <= wr_data_i;
            end
            registers [0] <= 0;
        end
        else
        begin
            for (i=0; i<32 ; i = i+1)
            begin
                registers [i] <= registers [i];
            end
        end
    end

    assign rd_data_1_o = registers [rd_register_1_i];
    assign rd_data_2_o = registers [rd_register_2_i];

endmodule