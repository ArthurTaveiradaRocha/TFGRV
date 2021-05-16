`define ADD_OP 17'b01100110000000000
`define SUB_OP 17'b01100110000100000
`define SLL_OP 17'b01100110010000000
`define SRL_OP 17'b01100111010000000
`define XOR_OP 17'b01100111000000000
`define OR_OP  17'b01100111100000000
`define AND_OP 17'b01100111110000000

module ula
(opcode,
data1_in,
data2_in, 
funct3, 
funct7, 
data_out);

    input [31:0] data1_in;   
    input [31:0] data2_in;
    input [6:0] opcode;
    input [2:0] funct3;
    input [6:0] funct7;
    output [31:0] data_out;
    reg [31:0] result;
    reg [17:0] code;

    always @(data1_in or data2_in or opcode or funct3 or funct7)
    begin
        code = {opcode, funct3, funct7};
        case(code)
            `ADD_OP:
                result = data1_in + data2_in; //add
            `SUB_OP:
                result = data1_in - data2_in; //sub
            `SLL_OP:
                result = data1_in << data2_in; //sll
            `SRL_OP:
                result = data1_in >> data2_in; //srl
            `XOR_OP:
                result = data1_in ^ data2_in; //XOR
            `OR_OP:
                result = data1_in | data2_in; //OR
            `AND_OP:
                result = data1_in & data2_in; //AND
            default:
                result = 0;
      endcase
    end

    assign data_out = result;
    
endmodule