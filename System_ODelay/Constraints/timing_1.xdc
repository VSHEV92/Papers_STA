# время установки для сигнала на входе SER микросхемы 74HC595 
# относительно тактового входа SRCLK 
set Tdsu 20

# время удержания для сигнала на входе SER микросхемы 74HC595 
# относительно тактового входа SRCLK 
set Tdh 0

# минимальное и максимальное время распространения данных по
# дорожкам платы
set Tbd_max 0.6
set Tbd_min 0.5

# минимальное и максимальное время распространения тактового сигнала
# от генератора до микросхемы 74HC595 
set Todd_max 0.4
set Todd_min 0.2

# минимальное и максимальное время распространения тактового сигнала # от генератора до FPGA
set Tofd_max 0.3
set Tofd_min 0.2

# ограничение на период тактового сигнала
create_clock -period 100 -name clk_10MHz [get_ports CLK]

# временное ограничение для выходного сигнала ODATA
set odelay_max [expr $Tofd_max - $Todd_min + $Tbd_max + $Tdsu]
set_output_delay -clock clk_10MHz -max $odelay_max [get_ports ODATA];

set odelay_min [expr $Tofd_min - $Todd_max + $Tbd_min - $Tdh]
set_output_delay -clock clk_10MHz -min $odelay_min [get_ports ODATA];
