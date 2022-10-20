# период входного тактового сигнала
create_clock -period 2.5 -name clk [get_ports clk]

# получение триггеров счетчика по имени ячеек netlist
set counter_flops [get_cells q_reg[*]]

# получение триггеров счетчика по имени переменной и типу
set counter_flops [get_cells q* -filter {PRIMITIVE_TYPE =~ FLOP_LATCH.flop.*}]

# получение триггеров счетчика по сигналу counter_ce
set ce_net [get_nets counter_ce]
set flops_ce_pins [get_pins -of_objects $ce_net -filter {NAME =~ "*CE"}]
set counter_flops [get_cells -of_objects $flops_ce_pins]

# добавление multicycle path
set_multicycle_path 2 -setup -end -from $counter_flops -to $counter_flops
set_multicycle_path 1 -hold  -end -from $counter_flops -to $counter_flops
