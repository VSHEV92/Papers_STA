create_clock -period 10.000 -name clk_1 [get_ports clk_1]
create_clock -period 33.300 -name clk_2 [get_ports clk_2]

# объявление false path через начало и конец пути
#set_false_path -from [get_pins cdc_data_reg/C] -to [get_pins o_data_reg/D]

# объявление false path через запускающий и защелкивающий триггеры
#set_false_path -from [get_cells cdc_data_reg] -to [get_cells o_data_reg]

# объявление false path через имена тактовых доменов
#set_false_path -from [get_clocks clk_1] -to [get_clocks clk_2]

# объявление тактовых доменов асинхронными
#set_clock_groups -name cdc_async -group [get_clocks clk_1] -group [get_clocks clk_2] -asynchronous

# объявление синхронизирующих триггеров
#set_property ASYNC_REG true [get_cells {sync_data_reg o_data_reg}]