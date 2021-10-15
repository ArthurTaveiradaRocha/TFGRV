`define WIDTH_DATA   32
`define WIDTH_MEMORY 8

module data_memory
(clock_i,
addr_i,
wr_data_i,
wr_enable_i,
rd_enable_i,
rd_data_o);

    input   clock_i;
    input   [`WIDTH_DATA-1:0] addr_i;
    input   [`WIDTH_DATA-1:0] wr_data_i;
    input   [3:0] wr_enable_i;
    input   [1:0] rd_enable_i;
    output reg [`WIDTH_DATA-1:0] rd_data_o;

    reg [`WIDTH_MEMORY-1:0] memory [1024:0];

    always @(posedge clock_i)
    begin
        if (|wr_enable_i)
        begin
            case(wr_enable_i)
                //byte
                4'b0001: memory[addr_i<<2]   <= wr_data_i;
                4'b0010: memory[(addr_i<<2)+1] <= wr_data_i;
                4'b0011: memory[(addr_i<<2)+2] <= wr_data_i;
                4'b0100: memory[(addr_i<<2)+3] <= wr_data_i;
                //half word
                4'b0101: {memory[(addr_i<<2)+1], memory[addr_i<<2]} <= wr_data_i; 
                4'b0110: {memory[(addr_i<<2)+2], memory[(addr_i<<2)+1]} <= wr_data_i;
                4'b0111: {memory[(addr_i<<2)+3], memory[(addr_i<<2)+2]} <= wr_data_i;
                //word
                default: begin 
                    memory[(addr_i<<2)]   <= wr_data_i[7:0];
                    memory[(addr_i<<2)+1] <= wr_data_i[15:8];
                    memory[(addr_i<<2)+2] <= wr_data_i[23:16];
                    memory[(addr_i<<2)+3] <= wr_data_i[31:24];
                end
            endcase
        end
    end

    always @(*)
    begin
        case(rd_enable_i)
            2'b01   : rd_data_o = {{24{memory[addr_i<<2][7]}}, memory[addr_i<<2]};
            2'b10   : rd_data_o = {{16{memory[(addr_i<<2)+1][7]}}, memory[(addr_i<<2)+1], memory[addr_i<<2]};
            2'b11   : rd_data_o = {memory[(addr_i<<2)+3], memory[(addr_i<<2)+2], memory[(addr_i<<2)+1], memory[addr_i<<2]};
            default : rd_data_o = 32'b0;
        endcase
    end
endmodule
