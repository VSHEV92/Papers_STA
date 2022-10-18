# период входного тактового сигнала
create_clock -period 10.0 -name i_clk [get_ports i_clk]

# объявление переменных, которые указывают места формирования тактовых сигналов
set pll_input    [get_pins PLL/inst/mmcm_adv_inst/CLKIN1] 
set pll_output_1 [get_pins PLL/inst/mmcm_adv_inst/CLKOUT0]
set pll_output_2 [get_pins PLL/inst/mmcm_adv_inst/CLKOUT1]

# обновление имен сгенерированных с помощью PLL тактовых сигналов
create_generated_clock -name clk_1 -source $pll_input -master_clock [get_clocks i_clk] $pll_output_1
create_generated_clock -name clk_2 -source $pll_input -master_clock [get_clocks i_clk] $pll_output_2

# сдвиг защелкивающего фронта вправо для анализа по Setup
#set_multicycle_path 2 -setup -end -from [get_pins data_clk_1_reg/C] -to [get_pins data_clk_2_reg/D]

# сдвиг защелкивающего фронта влево для анализа по Hold
#set_multicycle_path 1 -hold  -end -from [get_pins data_clk_1_reg/C] -to [get_pins data_clk_2_reg/D]


# сдвиг запускающего фронта влево для анализа по Setup
set_multicycle_path 2 -setup -start -from [get_pins data_clk_1_reg/C] -to [get_pins data_clk_2_reg/D]

# сдвиг запускающего фронта вправо для анализа по Hold
set_multicycle_path 1 -hold  -start -from [get_pins data_clk_1_reg/C] -to [get_pins data_clk_2_reg/D]
