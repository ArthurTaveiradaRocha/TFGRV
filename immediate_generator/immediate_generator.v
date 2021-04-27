module immediate_generator(Instruction_i, ExtImmediate_o);

input [31:0] Instruction_i;
output reg [31:0] ExtImmediate_o;

always @(*) begin
    case(Instruction_i[6:0])
        7'b0000011 : ExtImmediate_o = {{20{Instruction_i[31]}}, Instruction_i[31:20]}; //I_type
        7'b0010011 : ExtImmediate_o = {{20{Instruction_i[31]}}, Instruction_i[31:20]}; //I_type_l
        7'b0100011 : ExtImmediate_o = {{20{Instruction_i[31]}}, Instruction_i[31:25], Instruction_i[11:7]}; //S-type
        7'b1100111 : ExtImmediate_o = {{20{Instruction_i[31]}}, Instruction_i[31], Instruction_i[7], Instruction_i[30:25], Instruction_i[11:8]}; //B-type
        7'b0110111 : ExtImmediate_o = {{12{Instruction_i[31]}}, Instruction_i[31:12]}; //U-type
        7'b1101111 : ExtImmediate_o = {{12{Instruction_i[31]}}, Instruction_i[19:12], Instruction_i[20], Instruction_i[30:21]}; //UJ-type
        7'b0010111 : ExtImmediate_o = {{12{Instruction_i[31]}}, Instruction_i[31:12]}; //U-type-auipc
        default : ExtImmediate_o = 32'b0;
    endcase
end

endmodule