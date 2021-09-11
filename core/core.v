module core
(clock,
reset,
rd_data
);

    input clock;
    input reset;
    //data_memory
    output [31:0] rd_data;
    //control
    wire [6:0] opcode;
    wire reg_write;
    wire alu_src;
    wire alu_data1;
    wire mem_write;
    wire mem_read;
    wire men_to_reg;
    wire branch_i;
    //ula_control
    wire [9:0] inst;
    wire [2:0] ula_op;
    //ula
    wire [31:0] data1_in;
    wire [31:0] data2_in;
    wire [3:0] select_ula;
    wire [31:0] data_out;
    wire zero;
    //register_file
    wire [4:0] rd_register_1;
    wire [4:0] rd_register_2;
    wire [4:0] wr_register;
    wire [31:0] wr_data;
    wire [31:0] rd_data_1;
    wire [31:0] rd_data_2;
    //instruction_memory
    wire [31:0] instruction;
    //immediate_generator
    wire [31:0] ExtImmediate;
    wire [31:0] mux_pc;
    wire [31:0] mux_pc_b;
    reg [31:0] pc;
    //branch
    wire branch_o;

    control control_uut(
        .opcode_i(opcode), //conectado
        .reg_write_o(reg_write), //conectado
        .alu_op_o(ula_op), //conectado
        .alu_src_o(alu_src), //conectado
        .alu_data1_o(alu_data1), //conectado
        .mem_write_o(mem_write), //conectado
        .mem_read_o(mem_read), //conectado
        .men_to_reg_o(men_to_reg), //conectado
        .branch_o(branch_i)); //conectado

    ula_control ula_control_UUT(
        .inst(inst), //conectado
        .ula_op(ula_op), //conectado  
        .ula_select(select_ula)); //conectado 

    ula ula_UUT(
        .data1_in(data1_in), //conectado
        .data2_in(data2_in), //conectado
        .select_ula(select_ula),  //conectado
        .data_out(data_out), //conectado
        .zero(zero)); //conectado

    register_file register_UUT(
        .clock_i(clock), //conectado
        .reset_i(reset),
        .reg_write_i(reg_write), //conectado
        .rd_register_1_i(rd_register_1), //conectado
        .rd_register_2_i(rd_register_2), //conectado
        .wr_register_i(wr_register), //conectado
        .wr_data_i(wr_data), //conectado
        .rd_data_1_o(rd_data_1), //conectado
        .rd_data_2_o(rd_data_2)); //conectado

    instruction_memory instruction_UUT(
        .addr_i(pc), //conectado
        .instruction_o(instruction)); //conectado

    immediate_generator immediate_UUT(
        .Instruction_i(instruction), //conectado
        .ExtImmediate_o(ExtImmediate)); //conectado

    data_memory data_UUT(
        .clock_i(clock), //conectado
        .addr_i(data_out), //conectado
        .wr_data_i(rd_data_2), //conectado
        .wr_enable_i(mem_write), //conectado
        .rd_enable_i(mem_read), //conectado
        .rd_data_o(rd_data)); //conectado    

    branch branch_UUT(
        .zero_i(zero), //conectado 
        .funct3_i(inst[2:0]), //conectado 
        .branch_i(branch_i),
        .branch_o(branch_o));

    always @(posedge clock) begin
        if (reset == 1) begin
            pc <= 0;
        end
        else begin
            pc <= mux_pc;
        end
    end

    assign opcode[6:0]         = instruction[6:0]; //feito
    assign rd_register_1[4:0]  = instruction[19:15]; //feito
    assign rd_register_2[4:0]  = instruction[24:20]; //feito
    assign wr_register[4:0]    = instruction[11:7]; //feito
    assign inst[2:0]           = instruction[14:12];
    assign inst[9:3]           = instruction[31:25];
    assign mux_pc_b            = pc + (ExtImmediate<<1); //feito
    assign data2_in            = (alu_src) ? ExtImmediate : rd_data_2;
    assign wr_data             = (men_to_reg) ? rd_data : data_out; 
    assign mux_pc              = branch_o ? mux_pc_b : (pc + 4); //feito
    assign data1_in            = alu_data1 ? pc : rd_data_1 ;

endmodule
    