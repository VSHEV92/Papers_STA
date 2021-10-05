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

set_input_delay -clock clk_10MHz -max [expr $Todd_max - $Tofd_min + $Tdco_max + $Tbd_max] [get_ports IDATA];
set_input_delay -clock clk_10MHz -min [expr $Todd_min - $Tofd_max + $Tdco_min + $Tbd_min] [get_ports IDATA];

set_output_delay -clock clk_10MHz -max [expr $Tofd_max - $Todd_min + $Tbd_max + $Tdsu] [get_ports ODATA];
set_output_delay -clock clk_10MHz -min [expr $Tofd_min - $Todd_max + $Tbd_min - $Tdh] [get_ports ODATA];
