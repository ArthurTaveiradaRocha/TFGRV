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

module ula
(select_ula,
data1_in,
data2_in,  
data_out,
zero);

    input  [31:0] data1_in;   
    input  [31:0] data2_in;
    input  [3:0]  select_ula;
    output [31:0] data_out;
    output zero;
    reg    [31:0] result;

    always @(data1_in or data2_in or select_ula)
    begin
        case(select_ula)
            `ULA_ADD:
                result = data1_in + data2_in; //add
            `ULA_SUB:
                result = data1_in - data2_in; //sub
            `ULA_SLL:
                result = data1_in << data2_in; //sll
            `ULA_SLT:
                result = {{31{1'b0}},$signed(data1_in) < $signed(data2_in)};
            `ULA_SLTU:
                result = {{31{1'b0}}, data1_in < data2_in};
            `ULA_SRL:
                result = data1_in >> data2_in; //srl
            `ULA_SRA:
                result = data1_in >>> data2_in; //srl
            `ULA_XOR:
                result = data1_in ^ data2_in; //XOR
            `ULA_OR:
                result = data1_in | data2_in; //OR
            `ULA_AND:
                result = data1_in & data2_in; //AND
            default:
                result = 0;
      endcase
    end

    assign data_out = result;
    assign zero     = result == 0;
    
endmodule