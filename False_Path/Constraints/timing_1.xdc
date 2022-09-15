# период запускающего тактового сигнала
create_clock -period 10.0 -name clk_1 [get_ports clk_1]

# период защелкивающего тактового сигнала
create_clock -period 33.3 -name clk_2 [get_ports clk_2]

#create_clock -period 5.0 -name clk_2 [get_ports clk_2]
