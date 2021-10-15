module immediate_generator
(instruction_i, 
extImmediate_o);

    input [31:0] instruction_i;
    output reg [31:0] extImmediate_o;

    always @(*) begin
        case(instruction_i[6:0])
            7'b0000011 : extImmediate_o = {{20{instruction_i[31]}}, instruction_i[31:20]}; //I_type
            7'b0010011 : extImmediate_o = {{20{instruction_i[31]}}, instruction_i[31:20]}; //I_type_l
            7'b0100011 : extImmediate_o = {{20{instruction_i[31]}}, instruction_i[31:25], instruction_i[11:7]}; //S-type
            7'b1100011 : extImmediate_o = {{20{instruction_i[31]}}, instruction_i[31], instruction_i[7], instruction_i[30:25], instruction_i[11:8]}; //B-type
            7'b0110111 : extImmediate_o = {{12{instruction_i[31]}}, instruction_i[31:12]}; //U-type
            7'b1101111 : extImmediate_o = {{12{instruction_i[31]}}, instruction_i[19:12], instruction_i[20], instruction_i[30:21]}; //UJ-type
            7'b0010111 : extImmediate_o = {{12{instruction_i[31]}}, instruction_i[31:12]}; //U-type-auipc
            default : extImmediate_o = 32'b0;
        endcase
    end

endmodule