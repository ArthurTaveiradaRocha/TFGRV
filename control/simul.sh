vlib work
vlog control.v control_tb.v
vsim control_tb -do wave.do -do "run 500 ns"
