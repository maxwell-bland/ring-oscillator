set_property BITSTREAM.CONFIG.BPI_SYNC_MODE Type1 [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN div-1 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]
set_property CONFIG_MODE BPI16 [current_design]
set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]

set_property IOSTANDARD LVDS [get_ports sysclk_p]
set_property PACKAGE_PIN E19 [get_ports sysclk_p]
set_property PACKAGE_PIN E18 [get_ports sysclk_n]
set_property IOSTANDARD LVDS [get_ports sysclk_n]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets I]

#set_property PACKAGE_PIN AU36 [get_ports usb_rx]
#set_property IOSTANDARD LVCMOS18 [get_ports usb_rx]

#set_property PACKAGE_PIN AR34 [get_ports usb_cts]
#set_property IOSTANDARD LVCMOS18 [get_ports usb_cts]
#set_property PACKAGE_PIN AT32 [get_ports usb_rts]
#set_property IOSTANDARD LVCMOS18 [get_ports usb_rts]

#set_property PACKAGE_PIN AU33 [get_ports usb_tx]
#set_property IOSTANDARD LVCMOS18 [get_ports usb_tx]

#set_property PACKAGE_PIN AV39 [get_ports gpio_sw_c]
#set_property IOSTANDARD LVCMOS18 [get_ports gpio_sw_c]
#set_property PACKAGE_PIN E18 [get_ports SYSCLK_N]
#set_property IOSTANDARD LVDS [get_ports SYSCLK_N]
#set_property PACKAGE_PIN AY32 [get_ports ULPI_clk]
#set_property IOSTANDARD LVCMOS18 [get_ports ULPI_clk]

#set_property PACKAGE_PIN BB33 [get_ports ULPI_dir]
#set_property IOSTANDARD LVCMOS18 [get_ports ULPI_dir]

#set_property PACKAGE_PIN BA35 [get_ports ULPI_next]
#set_property IOSTANDARD LVCMOS18 [get_ports ULPI_next]

#set_property PACKAGE_PIN BB36 [get_ports ULPI_rst]
#set_property IOSTANDARD LVCMOS18 [get_ports ULPI_rst]

#set_property PACKAGE_PIN BB32 [get_ports ULPI_stop]
#set_property IOSTANDARD LVCMOS18 [get_ports ULPI_stop]

#set_property PACKAGE_PIN AV36 [get_ports {ulpi_data_io[0]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {ulpi_data_io[0]}]

#set_property PACKAGE_PIN AW36 [get_ports {ulpi_data_io[1]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {ulpi_data_io[1]}]

#set_property PACKAGE_PIN BA34 [get_ports {ulpi_data_io[2]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {ulpi_data_io[2]}]

#set_property PACKAGE_PIN BB34 [get_ports {ulpi_data_io[3]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {ulpi_data_io[3]}]

#set_property PACKAGE_PIN BA36 [get_ports {ulpi_data_io[4]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {ulpi_data_io[4]}]

#set_property PACKAGE_PIN AT34 [get_ports {ulpi_data_io[5]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {ulpi_data_io[5]}]

#set_property PACKAGE_PIN AY35 [get_ports {ulpi_data_io[6]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {ulpi_data_io[6]}]

#set_property PACKAGE_PIN AW35 [get_ports {ulpi_data_io[7]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {ulpi_data_io[7]}]

#set_property PACKAGE_PIN AY42 [get_ports {iic_mux_reset_b[0]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {iic_mux_reset_b[0]}]

#set_property PACKAGE_PIN AT36 [get_ports {iic_mux_reset_b[1]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {iic_mux_reset_b[1]}]

#set_property PACKAGE_PIN AN38 [get_ports Vaux0_v_p]
#set_property IOSTANDARD LVCMOS18 [get_ports Vaux0_v_p]

#set_property PACKAGE_PIN AP38 [get_ports Vaux0_v_n]
#set_property IOSTANDARD LVCMOS18 [get_ports Vaux0_v_n]

#set_property PACKAGE_PIN AM41 [get_ports Vaux8_v_p]
#set_property IOSTANDARD LVCMOS18 [get_ports Vaux8_v_p]

#set_property PACKAGE_PIN AM42 [get_ports Vaux8_v_n]
#set_property IOSTANDARD LVCMOS18 [get_ports Vaux8_v_n]

#set_property PACKAGE_PIN BA37 [get_ports SM_FAN_PWM]
#set_property IOSTANDARD LVCMOS18 [get_ports SM_FAN_PWM]

#set_property PACKAGE_PIN AD8 [get_ports SI5324_IN_clk_p]

#set_property PACKAGE_PIN AK34 [get_ports USER_CLOCK_IN_clk_p]
#set_property IOSTANDARD LVDS [get_ports USER_CLOCK_IN_clk_p]

#set_property PACKAGE_PIN AW32 [get_ports SI5324_OUT_clk_p]
#set_property IOSTANDARD LVDS [get_ports SI5324_OUT_clk_p]

#set_property PACKAGE_PIN AN31 [get_ports SMA_OUT_clk_p]
#set_property IOSTANDARD LVDS [get_ports SMA_OUT_clk_p]

#set_property PACKAGE_PIN G19 [get_ports DDR3_CLK1_P]
#set_property IOSTANDARD SSTL15 [get_ports DDR3_CLK1_P]

#set_property PACKAGE_PIN F19 [get_ports DDR3_CLK1_N]
#set_property IOSTANDARD SSTL15 [get_ports DDR3_CLK1_N]

#set_property PACKAGE_PIN J18 [get_ports DDR3_CKE1]
#set_property IOSTANDARD SSTL15 [get_ports DDR3_CKE1]

#set_property PACKAGE_PIN J20 [get_ports DDR3_S1_B]
#set_property IOSTANDARD SSTL15 [get_ports DDR3_S1_B]

#set_property PACKAGE_PIN H18 [get_ports DDR3_ODT1]
#set_property IOSTANDARD SSTL15 [get_ports DDR3_ODT1]

#set_property PACKAGE_PIN F17 [get_ports DDR3_A14]
#set_property IOSTANDARD SSTL15 [get_ports DDR3_A14]

#set_property PACKAGE_PIN E17 [get_ports DDR3_A15]
#set_property IOSTANDARD SSTL15 [get_ports DDR3_A15]









create_clock -period 5.000 -name sysclk_p -waveform {0.000 2.500} [get_ports sysclk_p]
