# период тактового сигнала 
set Tclk 40

# ограничение на период тактового сигнала
create_clock -period $Tclk -name ICLK [get_ports ICLK]

# минимальное и максимальное время распространения данных по дорожкам платы
set Tdbd_max 0.15
set Tdbd_min 0.1

# минимальное и максимальное время распространения тактового сигнала 
# по дорожкам платы
set Tcbd_max 0.12
set Tcbd_min 0.07

# время удержания старых данных после тактового сигнала на выходе LAN8740A
set Tinvld 10

# время между появлением тактового сигнала и данных на выходе LAN8740A
set Tval 28

# исчезновения старых данных до тактового сигнала на выходе Device 
set Tbre_dev -$Tinvld 

# появления новых данных после тактового сигнала на выходе Device 
set Tare_dev $Tval

# исчезновения старых данных до тактового сигнала на входе FPGA 
set Tbre_fpga [expr $Tbre_dev + $Tcbd_max - $Tdbd_min]

# появления новых данных после тактового сигнала на входе FPGA  
set Tare_fpga [expr $Tare_dev + $Tdbd_max - $Tcbd_min]

# временные ограничение для входного сигнала IDATA
set_input_delay -clock ICLK -max $Tare_fpga [get_ports IDATA]
set_input_delay -clock ICLK -min -$Tbre_fpga [get_ports IDATA]
