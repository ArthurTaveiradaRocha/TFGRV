`define N_WIDTH  32
`define N_LENGTH 32

module register_file
(clock_i, 
reset_i,
reg_write_i, 
rd_register_1_i, 
rd_register_2_i, 
wr_register_i, 
wr_data_i, 
rd_data_1_o, 
rd_data_2_o);

    input  clock_i;
    input  reset_i;
    input  reg_write_i;
    input  [4:0] rd_register_1_i;
    input  [4:0] rd_register_2_i;
    input  [4:0] wr_register_i;
    input  [`N_WIDTH-1:0] wr_data_i;
    output [`N_WIDTH-1:0] rd_data_1_o;
    output [`N_WIDTH-1:0] rd_data_2_o;

    reg [`N_WIDTH-1:0] registers [`N_LENGTH-1:0];
    integer i;

    always @(posedge clock_i)
    begin
        if(reset_i) begin
            for(i=0;i<`N_LENGTH;i=i+1) begin
                registers [i] <= 0;
            end
        end
        else
        begin
            if (reg_write_i == 1) 
            begin
                if (wr_register_i != 0)
                begin
                    registers [wr_register_i] <= wr_data_i;
                end
            end
            else
            begin
                for (i=0; i<32 ; i = i+1)
                begin
                    registers [i] <= registers [i];
                end
            end
        end
    end

    assign rd_data_1_o = rd_register_1_i == 5'b0 ? 32'b0 : registers [rd_register_1_i];
    assign rd_data_2_o = rd_register_2_i == 5'b0 ? 32'b0 : registers [rd_register_2_i];

endmodule