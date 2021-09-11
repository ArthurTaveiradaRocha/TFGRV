onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /control_tb/opcode_i
add wave -noupdate /control_tb/reg_write_o
add wave -noupdate /control_tb/alu_op_o
add wave -noupdate /control_tb/alu_src_o
add wave -noupdate /control_tb/alu_data1_o
add wave -noupdate /control_tb/mem_write_o
add wave -noupdate /control_tb/mem_read_o
add wave -noupdate /control_tb/men_to_reg_o
add wave -noupdate /control_tb/branch_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {30 ps} 0}
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
WaveRestoreZoom {0 ps} {110 ps}
