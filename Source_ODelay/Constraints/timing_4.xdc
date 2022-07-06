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

# исчезновения старых данных до тактового сигнала на выходе FPGA 
set Tbre_fpga [expr $Tclk + $Tdbd_min - $Tdh - $Tcbd_max]

# появления новых данных после тактового сигнала на выходе FPGA  
set Tare_fpga [expr $Tcbd_min - $Tdbd_max - $Tdsu]

# временные ограничение для выходного сигнала o_data
set_output_delay -clock o_clk -max [expr $Tclk - $Tare_fpga] [get_ports o_data]
set_output_delay -clock o_clk -min $Tbre_fpga [get_ports o_data]


