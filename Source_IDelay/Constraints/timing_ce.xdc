# период тактового сигнала 
set Tclk 5

# время удержания данных после тактового сигнала на выходе ADS4249 
set Tare_dev 1.7

# время между появлением данных и тактовым сигналом на выходе ADS4249  
set Tbre_dev 1

# минимальное и максимальное время распространения данных по дорожкам платы
set Tdbd_max 0.15
set Tdbd_min 0.1

# минимальное и максимальное время распространения тактового сигнала по дорожкам платы
set Tcbd_max 0.12
set Tcbd_min 0.07

# время удержания данных после тактового сигнала на входе FPGA 
set Tare_fpga [expr $Tare_dev + $Tdbd_min - $Tcbd_max]

# время между появлением данных и тактовым сигналом на входе FPGA  
set Tbre_fpga [expr $Tbre_dev + $Tcbd_min - $Tdbd_max]

# ограничение на период тактового сигнала
create_clock -period $Tclk -name ICLK [get_ports ICLK]

# временные ограничение для входного сигнала IDATA
set_input_delay -clock ICLK -max [expr $Tclk - $Tbre_fpga] [get_ports IDATA];
set_input_delay -clock ICLK -min $Tare_fpga [get_ports IDATA];

