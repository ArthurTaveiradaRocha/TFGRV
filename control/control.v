`define OPCODE_R    7'b0110011
`define OPCODE_I    7'b0010011
`define OPCODE_LW   7'b0000011
`define OPCODE_SW   7'b0100011
`define OPCODE_BEQ  7'b1100011

module control
(opcode_i,
reg_write_o,
alu_op_o,
alu_src_o,
mem_write_o,
mem_read_o,
men_to_reg_o,
branch_o
);
    input [6:0] opcode_i;
    output reg reg_write_o;
    output reg [1:0] alu_op_o;
    output reg alu_src_o;
    output reg mem_write_o;
    output reg mem_read_o;
    output reg men_to_reg_o;
    output reg branch_o;

    always @(*) begin
        case(opcode_i)
            `OPCODE_R : begin
                reg_write_o     = 1'b1;
                alu_op_o        = 2'b10;
                alu_src_o       = 1'b0;
                mem_write_o     = 1'b0;
                mem_read_o      = 1'b0;
                men_to_reg_o    = 1'b0;
                branch_o        = 1'b0;
            end
            `OPCODE_I : begin
                reg_write_o     = 1'b1;
                alu_op_o        = 2'b11;
                alu_src_o       = 1'b1;
                mem_write_o     = 1'b0;
                mem_read_o      = 1'b0;
                men_to_reg_o    = 1'b0;
                branch_o        = 1'b0;
            end
            `OPCODE_LW : begin
                reg_write_o     = 1'b1;
                alu_op_o        = 2'b00;
                alu_src_o       = 1'b1;
                mem_write_o     = 1'b0;
                mem_read_o      = 1'b1;
                men_to_reg_o    = 1'b1;
                branch_o        = 1'b0;
            end
            `OPCODE_SW : begin
                reg_write_o     = 1'b0;
                alu_op_o        = 2'b00;
                alu_src_o       = 1'b1;
                mem_write_o     = 1'b1;
                mem_read_o      = 1'b0;
                men_to_reg_o    = 1'b1;
                branch_o        = 1'b0;
            end
            `OPCODE_BEQ : begin
                reg_write_o     = 1'b0;
                alu_op_o        = 2'b01;
                alu_src_o       = 1'b0;
                mem_write_o     = 1'b0;
                mem_read_o      = 1'b0;
                men_to_reg_o    = 1'b1;
                branch_o        = 1'b1;
            end
            default : begin
                reg_write_o     = 1'b0;
                alu_op_o        = 2'b00;
                alu_src_o       = 1'b0;
                mem_write_o     = 1'b0;
                mem_read_o      = 1'b0;
                men_to_reg_o    = 1'b0;
                branch_o        = 1'b0;
            end
        endcase
    end
    
endmodule

    
    
        