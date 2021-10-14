onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /store_tb/funct3_i
add wave -noupdate -radix binary /store_tb/mem_write_i
add wave -noupdate -radix binary /store_tb/addr_i
add wave -noupdate -radix binary /store_tb/write_en_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {198850 ps} 0}
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
WaveRestoreZoom {0 ps} {525 ns}
