vlib work
vlog ula_control.v ula_control_tb.v
vsim ula_control_tb -do wave.do -do "run 500 ns"
