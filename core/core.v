module core
(clock_i,
reset_i,
rd_data_o
);

    input clock_i;
    input reset_i;
    output [31:0] rd_data_o;
    //control
    wire [6:0] opcode_w;
    wire reg_write_w;
    wire alu_src_w;
    wire alu_data1_w;
    wire mem_write_w;
    wire mem_read_w;
    wire men_to_reg_w;
    wire [1:0] branch_wi;
    //ula_control
    wire [9:0] inst_w;
    wire [2:0] funct_3_w;
    wire [6:0] funct_7_w;
    wire [2:0] alu_op_w;
    //ula
    wire [31:0] data1_in_w;
    wire [31:0] data2_in_w;
    wire [3:0] select_alu_w;
    wire [31:0] data_out_w;
    wire zero_w;
    //register_file
    wire [4:0] rd_register_1_w;
    wire [4:0] rd_register_2_w;
    wire [4:0] wr_register_w;
    wire [31:0] wr_data_w;
    wire [31:0] rd_data_1_w;
    wire [31:0] rd_data_2_w;
    //instruction_memory
    wire [31:0] instruction_w;
    //immediate_generator
    wire [31:0] extImmediate_w;
    wire [31:0] mux_pc_w;
    wire [31:0] mux_pc_b_w;
    reg  [31:0] pc_w;
    //branch
    wire [1:0] branch_wo;
    wire [3:0] write_en_w;
    wire [1:0] read_en_w;
    reg  [31:0] next_pc_r;
    reg  [31:0] jalr_sum_r;

    control control_u(
        .opcode_i(opcode_w),
        .reg_write_o(reg_write_w),
        .alu_op_o(alu_op_w),
        .alu_src_o(alu_src_w),
        .alu_data1_o(alu_data1_w),
        .mem_write_o(mem_write_w),
        .mem_read_o(mem_read_w),
        .men_to_reg_o(men_to_reg_w),
        .branch_jump_o(branch_wi));

    ula_control ula_control_u(
        .inst(inst_w), //{funct7, funct3}
        .ula_op(alu_op_w),
        .ula_select(select_alu_w));

    ula ula_u(
        .data1_in(data1_in_w),
        .data2_in(data2_in_w),
        .select_ula(select_alu_w),
        .data_out(data_out_w),
        .zero(zero_w));

    register_file register_u(
        .clock_i(clock_i),
        .reset_i(reset_i),
        .reg_write_i(reg_write_w),
        .rd_register_1_i(rd_register_1_w),
        .rd_register_2_i(rd_register_2_w),
        .wr_register_i(wr_register_w),
        .wr_data_i(wr_data_w),
        .rd_data_1_o(rd_data_1_w),
        .rd_data_2_o(rd_data_2_w));

    instruction_memory instruction_u(
        .addr_i(pc_w),
        .instruction_o(instruction_w));

    immediate_generator immediate_u(
        .instruction_i(instruction_w),
        .extImmediate_o(extImmediate_w));

    data_memory data_u(
        .clock_i(clock_i),
        .addr_i(data_out_w),
        .wr_data_i(rd_data_2_w),
        .wr_enable_i(write_en_w),
        .rd_enable_i(read_en_w),
        .rd_data_o(rd_data_o));    

    branch branch_u(
        .zero_i(zero_w),
        .funct3_i(funct_3_w), 
        .branch_i(branch_wi),
        .branch_o(branch_wo));

    store store_u(
        .funct3_i(funct_3_w),
        .mem_write_i(mem_write_w),
        .addr_i(data_out_w[1:0]), 
        .write_en_o(write_en_w)); 

    load load_u(
        .funct3_i(funct_3_w),
        .mem_read_i(mem_read_w),
        .read_en_o(read_en_w));

    always @(posedge clock_i) begin
        if (reset_i == 1) begin
            pc_w <= 0;
        end
        else begin
            pc_w <= mux_pc_w;
        end
    end

    assign next_pc_r             = pc_w + 4;
    assign opcode_w[6:0]         = instruction_w[6:0];
    assign rd_register_1_w[4:0]  = instruction_w[19:15];
    assign rd_register_2_w[4:0]  = instruction_w[24:20];
    assign wr_register_w[4:0]    = instruction_w[11:7];
    assign funct_3_w             = instruction_w[14:12];
    assign funct_7_w             = instruction_w[31:25];
    assign inst_w                = {funct_7_w, funct_3_w};
    assign mux_pc_b_w            = pc_w + (extImmediate_w<<1);
    assign data2_in_w            = (alu_src_w) ? extImmediate_w : rd_data_2_w;
    assign wr_data_w             = branch_wo[1] ? next_pc_r : (men_to_reg_w ? rd_data_o : data_out_w); 
    assign mux_pc_w              = branch_wo[1] ? (branch_wo[0] ? mux_pc_b_w : jalr_sum_r) : (branch_wo[0] ? mux_pc_b_w : next_pc_r);
    assign data1_in_w            = alu_data1_w ? pc_w : rd_data_1_w ;
    assign jalr_sum_r            = data_out_w;

endmodule
    