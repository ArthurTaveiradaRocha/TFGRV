`define LW  3'b010
`define LB  3'b000
`define LH  3'b001

module load
(funct3_i,
mem_read_i,
read_en_o
);

    input [2:0] funct3_i;
    input mem_read_i;
    output reg [1:0] read_en_o;

    always @(*)
    begin
        if(mem_read_i) begin
            case (funct3_i)
            `LB     : read_en_o = 2'b01;
            `LH     : read_en_o = 2'b10;
            `LW     : read_en_o = 2'b11;
            default : read_en_o = 2'b00;
            endcase
        end
        else
        begin
            read_en_o = 2'b00;
        end
    end
endmodule


