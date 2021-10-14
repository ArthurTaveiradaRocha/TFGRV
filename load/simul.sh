vlib work
vlog load.v load_tb.v
vsim load_tb -do wave.do -do "run 500 ns"
