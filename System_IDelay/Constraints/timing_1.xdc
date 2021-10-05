# задержка распространения между приходом тактового сигнала и появлением данных на выходе QH' микросхемы 74HC595 
set Tdco_min 17
set Tdco_max 32

# время установки и удержания для микросхемы 74HC595
set Tdsu 20
set Tdh 0

# минимальное и максимальное время распространения данных по дорожкам платы
set Tbd_max 0.6
set Tbd_min 0.5

# минимальное и максимальное время распространения тактового сигнала от генератора до микросхемы 74HC595 
set Todd_max 0.4
set Todd_min 0.2

# минимальное и максимальное время распространения тактового сигнала от генератора FPGA
set Tofd_max 0.3
set Tofd_min 0.2

# ограничение на период тактового сигнала
create_clock -period 100 -name clk_10MHz [get_ports CLK]

# временные ограничение для входного сигнала IDATA
set_input_delay -clock clk_10MHz -max [expr $Todd_max - $Tofd_min + $Tdco_max + $Tbd_max] [get_ports IDATA];
set_input_delay -clock clk_10MHz -min [expr $Todd_min - $Tofd_max + $Tdco_min + $Tbd_min] [get_ports IDATA];
