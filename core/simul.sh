vlib work
vlog core.v \
     core_tb.v \
     ../control/control.v \
     ../data_memory/data_memory.v \
     ../instruction_memory/instruction_memory.v \
     ../ula/ula.v \
     ../immediate_generator/immediate_generator.v \
     ../register_file/register_file.v \
     ../ula_control/ula_control.v
vsim core_tb -do wave.do -do "run 500 ns"
