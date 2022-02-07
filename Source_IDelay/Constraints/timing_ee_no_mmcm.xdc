# период тактового сигнала 
set Tclk 20

# время удержания данных после тактового сигнала на входе FPGA 
set Tbre_fpga 4

# время между появлением тактового сигнала и данных на входе FPGA  
set Tare_fpga 0.5

# ограничение на период тактового сигнала
create_clock -period $Tclk -name ICLK [get_ports ICLK]

# временные ограничение для входного сигнала IDATA
set_input_delay -clock ICLK -max [expr $Tclk + $Tare_fpga] [get_ports IDATA];
set_input_delay -clock ICLK -min [expr $Tclk - $Tbre_fpga] [get_ports IDATA];

