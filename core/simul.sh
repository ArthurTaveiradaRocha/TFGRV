vlib work
vlog core.v \
     core_tb.v \
     ../control/control.v \
     ../data_memory/data_memory.v \
     ../instruction_memory/instruction_memory.v \
     ../alu/alu.v \
     ../immediate_generator/immediate_generator.v \
     ../register_file/register_file.v \
     ../alu_control/alu_control.v \
     ../branch/branch.v \
     ../store/store.v \
     ../load/load.v
vsim core_tb -do wave.do -do "run 400 ns"
