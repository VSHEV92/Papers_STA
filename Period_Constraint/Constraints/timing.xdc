create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]
#create_clock -period 10.000 -name clk2 -waveform {0.000 5.000} [get_ports clk2]

set_system_jitter 0.150

set_input_jitter [get_clocks clk] 0.100
#set_input_jitter [get_clocks clk2] 0.100
