`timescale 1 ns/10 ps
module immediate_generator_tb();

    reg [31:0] Instruction_i;
    wire [31:0] ExtImmediate_o;
    
    immediate_generator UUT(
        .Instruction_i(Instruction_i), 
        .ExtImmediate_o(ExtImmediate_o));

    always
    begin
        Instruction_i = 32'b111111111111111111111111110000011;
        #20;
    
        Instruction_i = 32'b000000000000000000000000000010011;
        #20;
    
        Instruction_i = 32'b010101010101010101010101000100011;
        #20;
    
        Instruction_i = 32'b111111111111111111111111101100111;
        #20;
    
        Instruction_i = 32'b000000000000000000000000000110111;
        #20;
    
        Instruction_i = 32'b010101010101010101010101011101111;
        #20;
    
        Instruction_i = 32'b111111111111111111111111110010111;
        #20;
    
        Instruction_i = 32'b000000000000000000000000000000000;
        #20;
    end

endmodule