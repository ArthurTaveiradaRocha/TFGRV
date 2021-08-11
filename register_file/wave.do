onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /register_file_tb/clock_i
add wave -noupdate -radix decimal /register_file_tb/reg_write_i
add wave -noupdate -radix decimal /register_file_tb/rd_register_1_i
add wave -noupdate -radix decimal /register_file_tb/rd_register_2_i
add wave -noupdate -radix decimal /register_file_tb/wr_register_i
add wave -noupdate -radix decimal /register_file_tb/wr_data_i
add wave -noupdate -radix decimal /register_file_tb/rd_data_1_o
add wave -noupdate -radix decimal /register_file_tb/rd_data_2_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {299340 ps} 0}
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
WaveRestoreZoom {0 ps} {354510 ps}
