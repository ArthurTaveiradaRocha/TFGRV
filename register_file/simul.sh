vlib work
vlog register_file.v register_file_tb.v
vsim register_file_tb -do wave.do -do "run 500 ns"
