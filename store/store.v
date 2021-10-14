`define SW  3'b010
`define SB  3'b000
`define SH  3'b001

module store
(funct3_i,
mem_write_i,
addr_i,
write_en_o
);

    input [2:0] funct3_i;
    input mem_write_i;
    input [1:0] addr_i;
    output reg [3:0] write_en_o;

    always @(*)
    begin
        if(mem_write_i) begin
            case (funct3_i)
            `SB: begin
                case(addr_i)
                2'b00   : write_en_o = 4'b0001;
                2'b01   : write_en_o = 4'b0010;
                2'b10   : write_en_o = 4'b0011;
                2'b11   : write_en_o = 4'b0100;
                default : write_en_o = 4'b0000;
                endcase
            end
            `SH: begin
                case(addr_i)
                2'b00   : write_en_o = 4'b0101;
                2'b01   : write_en_o = 4'b0110;
                2'b10   : write_en_o = 4'b0111;
                default : write_en_o = 4'b0000;
                endcase
            end
            `SW: write_en_o = 4'b1111;
            default:
                write_en_o = 4'b0000;
            endcase
        end
        else
        begin
            write_en_o = 4'b0000;
        end
    end
endmodule


