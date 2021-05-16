module data_memory
(clock_i,
addr_i,
wr_data_i,
wr_enable_i,
rd_enable_i,
rd_data_o);

    input   clock_i;
    input   [31:0] addr_i;
    input   [31:0] wr_data_i;
    input   wr_enable_i;
    input   rd_enable_i;
    output  [31:0] rd_data_o;

    reg [31:0] memory [31:0];

    always @(posedge clock_i)
    begin
        if (wr_enable_i)
        begin
            memory[addr_i>>2] <= wr_data_i;
        end
    end

    assign rd_data_o = rd_enable_i ? memory[addr_i>>2] : 32'b0;

endmodule
