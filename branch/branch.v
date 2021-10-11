`define BEQ  3'b000
`define BNE  3'b001
`define BLT  3'b100
`define BGE  3'b101
`define BLTU 3'b110
`define BGEU 3'b111

module branch
(zero_i,
funct3_i,
branch_i,
branch_o
);

    input  zero_i;
    input  [2:0] funct3_i;
    input  [1:0] branch_i;
    reg    [1:0] branch_r;
    output [1:0] branch_o;

    always @(zero_i or funct3_i or branch_i)
    begin
        case (branch_i)
        2'b01:begin
            case(funct3_i)
                `BEQ:
                    if(zero_i)
                    begin
                        branch_r = 2'b01;
                    end
                    else
                    begin
                        branch_r = 2'b00;
                    end
                `BNE:
                    if(~zero_i)
                    begin
                        branch_r = 2'b01;
                    end
                    else
                    begin
                        branch_r = 2'b00;
                    end 
                `BLT:
                    if(~zero_i)
                    begin
                        branch_r = 2'b01;
                    end
                    else
                    begin
                        branch_r = 2'b00;
                    end 
                `BGE:
                    if(zero_i)
                    begin
                        branch_r = 2'b01;
                    end
                    else
                    begin
                        branch_r = 2'b00;
                    end 
                `BLTU:
                    if(~zero_i)
                    begin
                        branch_r = 2'b01;
                    end
                    else
                    begin
                        branch_r = 2'b00;
                    end 
                `BGEU:
                    if(zero_i)
                    begin
                        branch_r = 2'b01;
                    end
                    else
                    begin
                        branch_r = 2'b00;
                    end 
                default: 
                    branch_r = 2'b00;
            endcase
        end
        2'b10:
            branch_r = 2'b11;
        2'b11:
            branch_r = 2'b10;
        default:
            branch_r = 2'b00;
        endcase
    end

    assign branch_o = branch_r;

endmodule


