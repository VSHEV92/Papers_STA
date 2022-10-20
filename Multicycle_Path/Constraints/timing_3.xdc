# период тактового сигнала 
set Tclk 20

# время установки и удержания для микросхемы LAN8740A
set Tdsu 4.0
set Tdh 1.5

# минимальное и максимальное время распространения данных по дорожкам платы
set Tdbd_max 0.15
set Tdbd_min 0.1

# минимальное и максимальное время распространения тактового сигнала по дорожкам платы
set Tcbd_max 0.12
set Tcbd_min 0.07

# ограничение на период входного тактового сигнала
create_clock -period $Tclk -name i_clk [get_ports i_clk]

# ограничение на период выходного тактового сигнала
create_generated_clock -name o_clk -source [get_ports i_clk] -divide_by 1 [get_ports o_clk]

# временные ограничение для выходного сигнала o_data
set_output_delay -clock o_clk -max [expr $Tclk + $Tdbd_max + $Tdsu - $Tcbd_min] [get_ports o_data]
set_output_delay -clock o_clk -min [expr $Tclk + $Tdbd_min - $Tdh  - $Tcbd_max] [get_ports o_data]

# временные ограничение для выходного сигнала o_data
set_output_delay -clock o_clk -max [expr $Tdbd_max + $Tdsu - $Tcbd_min] [get_ports o_data]
set_output_delay -clock o_clk -min [expr $Tdbd_min - $Tdh  - $Tcbd_max] [get_ports o_data]

# добавление multicycle path
set_multicycle_path 0 -setup -end -to [get_ports o_data]
