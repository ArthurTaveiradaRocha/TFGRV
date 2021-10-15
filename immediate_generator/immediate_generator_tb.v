`timescale 1 ns/10 ps
`define WIDTH_DATA   32

module immediate_generator_tb();

    reg [`WIDTH_DATA-1:0] Instruction_i;
    wire [`WIDTH_DATA-1:0] ExtImmediate_o;
    
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