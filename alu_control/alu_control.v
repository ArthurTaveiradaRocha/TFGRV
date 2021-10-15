`define ALU_ADD    4'b0001
`define ALU_SUB    4'b0010
`define ALU_SLL    4'b0011
`define ALU_SLT    4'b0100
`define ALU_SLTU   4'b0101
`define ALU_SRL    4'b0110
`define ALU_SRA    4'b0111
`define ALU_XOR    4'b1000
`define ALU_OR     4'b1001
`define ALU_AND    4'b1010
`define ALU_LUI    4'b1011
`define ALU_AUIPC  4'b1100

module alu_control
(inst,
alu_op,
alu_select);

input  [9:0] inst;
input  [2:0]  alu_op;
reg    [3:0]  select;
output [3:0]  alu_select;

    always @(inst or alu_op)
    begin
        case(alu_op)
            3'b000:
                select = `ALU_ADD;
            3'b001: begin
                case(inst [2:0])
                    3'b100:
                        select = `ALU_SLT;
                    3'b101:    
                        select = `ALU_SLT;
                    3'b110:
                        select = `ALU_SLTU;
                    3'b111:
                        select = `ALU_SLTU;
                    default:
                        select = `ALU_SUB;
                endcase
            end
            3'b010: begin
                case(inst [2:0])
                    3'b000: begin
                        case(inst [9:3])
                            7'b0100000:
                                select = `ALU_SUB;
                            7'b0000000:
                                select = `ALU_ADD;
                            default:
                                select = `ALU_ADD;
                        endcase
                    end
                    3'b001:
                        select = `ALU_SLL;
                    3'b010:
                        select = `ALU_SLT;
                    3'b011:
                        select = `ALU_SLTU;
                    3'b100:
                        select = `ALU_XOR;
                    3'b101: begin
                        case(inst [9:3])
                            7'b0000000:
                                select = `ALU_SRL;
                            7'b0100000:
                                select = `ALU_SRA;
                            default:
                                select = 4'b0;
                        endcase
                    end
                    3'b110:
                        select = `ALU_OR;
                    3'b111:
                        select = `ALU_AND;
                    default:
                        select = 4'b0;
                endcase
            end
            3'b011: begin
                case(inst [2:0])
                    3'b000:
                        select = `ALU_ADD;
                    3'b001:
                        select = `ALU_SLL;
                    3'b010:
                        select = `ALU_SLT;
                    3'b011:
                        select = `ALU_SLTU;
                    3'b100:
                        select = `ALU_XOR;
                    3'b101: begin
                        case(inst [9:3])
                            7'b0000000:
                                select = `ALU_SRL;
                            7'b0100000:
                                select = `ALU_SRA;
                            default:
                                select = 4'b0;
                        endcase
                    end
                    3'b110:
                        select = `ALU_OR;
                    3'b111:
                        select = `ALU_AND;
                    default:
                        select = 4'b0;
                endcase
            end
            3'b100:
                select = `ALU_LUI;
            3'b101:
                select = `ALU_AUIPC;
            default:
                select = 4'b0;
        endcase
    end

    assign alu_select = select;

endmodule




