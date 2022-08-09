create_clock -period 10.0 -name i_clk [get_ports i_clk]

set pll_input    [get_pins pll/inst/mmcm_adv_inst/CLKIN1] 
set pll_output_1 [get_pins pll/inst/mmcm_adv_inst/CLKOUT0]
set pll_output_2 [get_pins pll/inst/mmcm_adv_inst/CLKOUT1]

create_generated_clock -name clk_1 -source $pll_input -master_clock [get_clocks i_clk] $pll_output_1
create_generated_clock -name clk_2 -source $pll_input -master_clock [get_clocks i_clk] $pll_output_2