`define ULA_ADD  4'b0001
`define ULA_SUB  4'b0010
`define ULA_SLL  4'b0011 
`define ULA_SLT  4'b0100
`define ULA_SLTU 4'b0101
`define ULA_SRL  4'b0110
`define ULA_SRA  4'b0111
`define ULA_XOR  4'b1000
`define ULA_OR   4'b1001
`define ULA_AND  4'b1010

module ula_control
(inst,
ula_op,
ula_select);

input  [16:0] inst;
input  [1:0]  ula_op;
reg    [3:0]  select;
output [3:0]  ula_select;

    always @(inst or ula_op)
    begin
        case(ula_op)
            2'b00:
                select = `ULA_ADD;
            2'b01:
                select = `ULA_SUB;
            2'b10:
                case(inst [9:7])
                    3'b000:
                        case(inst [6:0])
                            7'b0100000:
                                select = `ULA_SUB;
                            7'b0000000:
                                select = `ULA_ADD;
                            default:
                                select = `ULA_ADD;
                        endcase
                    3'b001:
                        select = `ULA_SLL;
                    3'b010:
                        select = `ULA_SLT;
                    3'b011:
                        select = `ULA_SLTU;
                    3'b100:
                        select = `ULA_XOR;
                    3'b101:
                        case(inst [6:0])
                            7'b0000000:
                                select = `ULA_SRL;
                            7'b0100000:
                                select = `ULA_SRA;
                            default:
                                select = 4'b0;
                        endcase
                    3'b110:
                        select = `ULA_OR;
                    3'b111:
                        select = `ULA_AND;
                    default:
                        select = 4'b0;
                endcase
            default:
                select = 4'b0;
        endcase
    end

    assign ula_select = select;

endmodule



