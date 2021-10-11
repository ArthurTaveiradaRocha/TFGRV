`define OPCODE_R        7'b0110011
`define OPCODE_I        7'b0010011
`define OPCODE_L        7'b0000011
`define OPCODE_S        7'b0100011
`define OPCODE_B        7'b1100011
`define OPCODE_LUI      7'b0110111
`define OPCODE_AUIPC    7'b0010111
`define OPCODE_JAL      7'b1101111
`define OPCODE_JALR     7'b1100111

module control
(opcode_i,
reg_write_o,
alu_op_o,
alu_src_o,
alu_data1_o,
mem_write_o,
mem_read_o,
men_to_reg_o,
branch_jump_o
);
    input [6:0] opcode_i;
    output reg reg_write_o;
    output reg [2:0] alu_op_o;
    output reg alu_src_o;
    output reg alu_data1_o;
    output reg mem_write_o;
    output reg mem_read_o;
    output reg men_to_reg_o;
    output reg [1:0] branch_jump_o;

    always @(*) begin
        case(opcode_i)
            `OPCODE_R : begin
                reg_write_o     = 1'b1; 
                alu_op_o        = 3'b010; 
                alu_src_o       = 1'b0; 
                alu_data1_o     = 1'b0; 
                mem_write_o     = 1'b0; 
                mem_read_o      = 1'b0; 
                men_to_reg_o    = 1'b0;
                branch_jump_o   = 2'b00; 
            end
            `OPCODE_I : begin
                reg_write_o     = 1'b1;
                alu_op_o        = 3'b011;
                alu_src_o       = 1'b1;
                alu_data1_o     = 1'b0;
                mem_write_o     = 1'b0;
                mem_read_o      = 1'b0;
                men_to_reg_o    = 1'b0;
                branch_jump_o   = 2'b00;
            end
            `OPCODE_L : begin
                reg_write_o     = 1'b1;
                alu_op_o        = 3'b000;
                alu_src_o       = 1'b1;
                alu_data1_o     = 1'b0;
                mem_write_o     = 1'b0;
                mem_read_o      = 1'b1;
                men_to_reg_o    = 1'b1;
                branch_jump_o   = 2'b00;
            end
            `OPCODE_S : begin
                reg_write_o     = 1'b0;
                alu_op_o        = 3'b000;
                alu_src_o       = 1'b1;
                alu_data1_o     = 1'b0;
                mem_write_o     = 1'b1;
                mem_read_o      = 1'b0;
                men_to_reg_o    = 1'b1;
                branch_jump_o   = 2'b00;
            end
            `OPCODE_B : begin
                reg_write_o     = 1'b0;
                alu_op_o        = 3'b001;
                alu_src_o       = 1'b0;
                alu_data1_o     = 1'b0;
                mem_write_o     = 1'b0;
                mem_read_o      = 1'b0;
                men_to_reg_o    = 1'b1;
                branch_jump_o   = 2'b01;
            end
            `OPCODE_LUI : begin
                reg_write_o     = 1'b1;
                alu_op_o        = 3'b100;
                alu_src_o       = 1'b1;
                alu_data1_o     = 1'b0;
                mem_write_o     = 1'b0;
                mem_read_o      = 1'b0;
                men_to_reg_o    = 1'b0;
                branch_jump_o   = 2'b00;
            end
            `OPCODE_AUIPC : begin
                reg_write_o     = 1'b1;
                alu_op_o        = 3'b101;
                alu_src_o       = 1'b1;
                alu_data1_o     = 1'b1;
                mem_write_o     = 1'b0;
                mem_read_o      = 1'b0;
                men_to_reg_o    = 1'b0;
                branch_jump_o   = 2'b00;
            end
            `OPCODE_JAL : begin
                reg_write_o     = 1'b1; //o_RegWrite = 1'b1;
                alu_op_o        = 3'b000; //o_ALUOp    = 3'b000;
                alu_src_o       = 1'b0; //o_ALUSrc2  = 1'b0;
                alu_data1_o     = 1'b0; //o_ALUSrc1  = 1'b0;
                mem_write_o     = 1'b0; //o_MemWrite = 1'b0;
                mem_read_o      = 1'b0; //o_MemRead  = 1'b0;
                men_to_reg_o    = 1'b0; //o_RegSrc   = 2'b10;
                branch_jump_o   = 2'b10;  //o_Ctrl_Jump= 2'b10;
            end
            `OPCODE_JALR : begin
                reg_write_o     = 1'b1; //o_RegWrite = 1'b1;
                alu_op_o        = 3'b011; //o_ALUOp    = 3'b011;
                alu_src_o       = 1'b1; //o_ALUSrc2  = 1'b1;
                alu_data1_o     = 1'b0; //o_ALUSrc1  = 1'b0;
                mem_write_o     = 1'b0; //o_MemWrite = 1'b0;
                mem_read_o      = 1'b0; //o_MemRead  = 1'b0;
                men_to_reg_o    = 1'b0; //o_RegSrc   = 2'b10;
                branch_jump_o   = 2'b11;  //o_Ctrl_Jump= 2'b11;
            end
            default : begin
                reg_write_o     = 1'b0;
                alu_op_o        = 3'b000;
                alu_src_o       = 1'b0;
                alu_data1_o     = 1'b0;
                mem_write_o     = 1'b0;
                mem_read_o      = 1'b0;
                men_to_reg_o    = 1'b0;
                branch_jump_o   = 2'b00;
            end
        endcase
    end
    
endmodule