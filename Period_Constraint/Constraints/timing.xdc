create_clock -period 10.000 -name clk_100MHz [get_ports clk_pin]

#set_system_jitter 0.150
#set_input_jitter [get_clocks clk_pin] 0.100
