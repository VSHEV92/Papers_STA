set Tdco_min 17
set Tdco_max 32

set Tdsu 20
set Tdh 0

set Tbd_max 0.6
set Tbd_min 0.5

set Todd_max 0.4
set Todd_min 0.2

set Tofd_max 0.3
set Tofd_min 0.2

create_clock -period 100 -name clk_10MHz [get_ports CLK]
create_clock -period 100 -name clk_10MHz_Dev

set_clock_latency -source -early $Tofd_min [get_clocks clk_10MHz]
set_clock_latency -source -late $Tofd_max [get_clocks clk_10MHz]

set_clock_latency -source -early $Todd_min [get_clocks clk_10MHz_Dev]
set_clock_latency -source -late $Todd_max [get_clocks clk_10MHz_Dev]

set_input_delay -clock clk_10MHz_Dev -max [expr $Tdco_max + $Tbd_max] [get_ports IDATA];
set_input_delay -clock clk_10MHz_Dev -min [expr $Tdco_min + $Tbd_min] [get_ports IDATA];

set_output_delay -clock clk_10MHz_Dev -max [expr $Tbd_max + $Tdsu] [get_ports ODATA];
set_output_delay -clock clk_10MHz_Dev -min [expr $Tbd_min - $Tdh] [get_ports ODATA];