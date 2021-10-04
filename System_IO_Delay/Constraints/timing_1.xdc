set clk_period_ns 100

set Tdco_min 17
set Tdco_max 32

set Tdsu 20
set Tdh 0

set Tbd 0.6
set Todd 0.4
set Tofd 0.3

create_clock -period $clk_period_ns -name clk_10MHz [get_ports CLK]

set_input_delay -clock clk_10MHz -max [expr $Todd - $Tofd + $Tdco_max + $Tbd] [get_ports $input_ports];
set_input_delay -clock clk_10MHz -min [expr $Todd - $Tofd + $Tdco_min + $Tbd] [get_ports $input_ports];

set_output_delay -clock clk_10MHz -max [expr $trce_dly_max + $tsu] [get_ports $output_ports];
set_output_delay -clock clk_10MHz -min [expr $trce_dly_min - $thd] [get_ports $output_ports];
