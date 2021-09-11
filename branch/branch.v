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
    input  branch_i;
    reg    branch_r;
    output branch_o;

    always @(zero_i or funct3_i or branch_i)
    begin
        if (branch_i)
        begin
            case(funct3_i)
                `BEQ:
                    if(zero_i)
                    begin
                        branch_r = 1;
                    end
                    else
                    begin
                        branch_r = 0;
                    end
                `BNE:
                    if(~zero_i)
                    begin
                        branch_r = 1;
                    end
                    else
                    begin
                        branch_r = 0;
                    end 
                `BLT:
                    if(~zero_i)
                    begin
                        branch_r = 1;
                    end
                    else
                    begin
                        branch_r = 0;
                    end 
                `BGE:
                    if(zero_i)
                    begin
                        branch_r = 1;
                    end
                    else
                    begin
                        branch_r = 0;
                    end 
                `BLTU:
                    if(~zero_i)
                    begin
                        branch_r = 1;
                    end
                    else
                    begin
                        branch_r = 0;
                    end 
                `BGEU:
                    if(zero_i)
                    begin
                        branch_r = 1;
                    end
                    else
                    begin
                        branch_r = 0;
                    end 
                default: 
                    branch_r = 0;
            endcase
        end
        else 
        begin
            branch_r = 0;
        end
    end

    assign branch_o = branch_r;

endmodule


