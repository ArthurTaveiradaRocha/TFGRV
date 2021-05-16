onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /data_memory_tb/clock_i
add wave -noupdate -radix decimal /data_memory_tb/addr_i
add wave -noupdate -radix decimal /data_memory_tb/wr_data_i
add wave -noupdate /data_memory_tb/wr_enable_i
add wave -noupdate /data_memory_tb/rd_enable_i
add wave -noupdate -radix decimal /data_memory_tb/rd_data_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {13730 ps}
