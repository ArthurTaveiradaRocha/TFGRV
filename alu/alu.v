`define WIDTH_DATA 32
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

module alu
(select_alu,
data1_in,
data2_in,  
data_out,
zero);

    input  [`WIDTH_DATA-1:0] data1_in;   
    input  [`WIDTH_DATA-1:0] data2_in;
    input  [3:0]  select_alu;
    output [`WIDTH_DATA-1:0] data_out;
    output reg zero;
    reg    [`WIDTH_DATA-1:0] result;

    always @(*)
    begin
        case(select_alu)
            `ALU_ADD:
                result = data1_in + data2_in; //add
            `ALU_SUB:
                result = data1_in - data2_in; //sub
            `ALU_SLL:
                result = data1_in << data2_in[4:0]; //sll
            `ALU_SLT:
                result = {{31{1'b0}},$signed(data1_in) < $signed(data2_in)};
            `ALU_SLTU:
                result = {{31{1'b0}}, data1_in < data2_in};
            `ALU_SRL:
                result = data1_in >> data2_in[4:0]; //srl
            `ALU_SRA:
                result = $signed(data1_in) >>> data2_in[4:0]; //srl
            `ALU_XOR:
                result = data1_in ^ data2_in; //XOR
            `ALU_OR:
                result = data1_in | data2_in; //OR
            `ALU_AND:
                result = data1_in & data2_in; //AND
            `ALU_LUI:
                result = {data2_in[19:0], {12{1'b0}}};
            `ALU_AUIPC:
                result = {data2_in[19:0], {12{1'b0}}} + data1_in;
            default:
                result = 32'bx;
        endcase
        if(result == 0)
        begin
            zero = 1;
        end
        else
        begin
            zero = 0;
        end
    end

    assign data_out = result;
    
endmodule