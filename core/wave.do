onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /core_tb/clock_i
add wave -noupdate -radix unsigned /core_tb/reset_i
add wave -noupdate -radix decimal /core_tb/rd_data_o
add wave -noupdate /core_tb/UUT/opcode_w
add wave -noupdate /core_tb/UUT/reg_write_w
add wave -noupdate /core_tb/UUT/alu_src_w
add wave -noupdate /core_tb/UUT/mem_write_w
add wave -noupdate /core_tb/UUT/mem_read_w
add wave -noupdate /core_tb/UUT/men_to_reg_w
add wave -noupdate /core_tb/UUT/branch_u/branch_i
add wave -noupdate /core_tb/UUT/branch_u/branch_o
add wave -noupdate -radix hexadecimal /core_tb/UUT/inst_w
add wave -noupdate /core_tb/UUT/ula_op_w
add wave -noupdate -radix hexadecimal /core_tb/UUT/data2_in_w
add wave -noupdate /core_tb/UUT/select_ula_w
add wave -noupdate -radix hexadecimal /core_tb/UUT/data_out_w
add wave -noupdate /core_tb/UUT/zero_w
add wave -noupdate /core_tb/UUT/rd_register_1_w
add wave -noupdate /core_tb/UUT/rd_register_2_w
add wave -noupdate -radix hexadecimal /core_tb/UUT/wr_register_w
add wave -noupdate -radix hexadecimal /core_tb/UUT/wr_data_w
add wave -noupdate -radix hexadecimal /core_tb/UUT/rd_data_1_w
add wave -noupdate -radix hexadecimal /core_tb/UUT/rd_data_2_w
add wave -noupdate -radix hexadecimal /core_tb/UUT/instruction_w
add wave -noupdate -radix hexadecimal /core_tb/UUT/ExtImmediate_w
add wave -noupdate -radix hexadecimal /core_tb/UUT/mux_pc_w
add wave -noupdate -radix hexadecimal /core_tb/UUT/mux_pc_b_w
add wave -noupdate -radix hexadecimal /core_tb/UUT/pc_w
add wave -noupdate -radix hexadecimal -childformat {{{/core_tb/UUT/register_u/registers[31]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[30]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[29]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[28]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[27]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[26]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[25]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[24]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[23]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[22]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[21]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[20]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[19]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[18]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[17]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[16]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[15]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[14]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[13]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[12]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[11]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[10]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[9]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[8]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[7]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[6]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[5]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[4]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[3]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[2]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[1]} -radix hexadecimal} {{/core_tb/UUT/register_u/registers[0]} -radix hexadecimal}} -expand -subitemconfig {{/core_tb/UUT/register_u/registers[31]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[30]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[29]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[28]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[27]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[26]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[25]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[24]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[23]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[22]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[21]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[20]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[19]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[18]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[17]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[16]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[15]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[14]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[13]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[12]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[11]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[10]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[9]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[8]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[7]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[6]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[5]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[4]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[3]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[2]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[1]} {-height 17 -radix hexadecimal} {/core_tb/UUT/register_u/registers[0]} {-height 17 -radix hexadecimal}} /core_tb/UUT/register_u/registers
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {51510 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {121280 ps}
