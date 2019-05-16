
module soc_system (
	clk_clk,
	clock_divider_0_conduit_end_out_clk,
	fpga_key_input_export,
	fpga_led_output_export,
	hps_ddr_mem_a,
	hps_ddr_mem_ba,
	hps_ddr_mem_ck,
	hps_ddr_mem_ck_n,
	hps_ddr_mem_cke,
	hps_ddr_mem_cs_n,
	hps_ddr_mem_ras_n,
	hps_ddr_mem_cas_n,
	hps_ddr_mem_we_n,
	hps_ddr_mem_reset_n,
	hps_ddr_mem_dq,
	hps_ddr_mem_dqs,
	hps_ddr_mem_dqs_n,
	hps_ddr_mem_odt,
	hps_ddr_mem_dm,
	hps_ddr_oct_rzqin,
	hps_h2f_loan_io_in,
	hps_h2f_loan_io_out,
	hps_h2f_loan_io_oe,
	hps_io_hps_io_emac1_inst_TX_CLK,
	hps_io_hps_io_emac1_inst_TXD0,
	hps_io_hps_io_emac1_inst_TXD1,
	hps_io_hps_io_emac1_inst_TXD2,
	hps_io_hps_io_emac1_inst_TXD3,
	hps_io_hps_io_emac1_inst_RXD0,
	hps_io_hps_io_emac1_inst_MDIO,
	hps_io_hps_io_emac1_inst_MDC,
	hps_io_hps_io_emac1_inst_RX_CTL,
	hps_io_hps_io_emac1_inst_TX_CTL,
	hps_io_hps_io_emac1_inst_RX_CLK,
	hps_io_hps_io_emac1_inst_RXD1,
	hps_io_hps_io_emac1_inst_RXD2,
	hps_io_hps_io_emac1_inst_RXD3,
	hps_io_hps_io_sdio_inst_CMD,
	hps_io_hps_io_sdio_inst_D0,
	hps_io_hps_io_sdio_inst_D1,
	hps_io_hps_io_sdio_inst_CLK,
	hps_io_hps_io_sdio_inst_D2,
	hps_io_hps_io_sdio_inst_D3,
	hps_io_hps_io_usb1_inst_D0,
	hps_io_hps_io_usb1_inst_D1,
	hps_io_hps_io_usb1_inst_D2,
	hps_io_hps_io_usb1_inst_D3,
	hps_io_hps_io_usb1_inst_D4,
	hps_io_hps_io_usb1_inst_D5,
	hps_io_hps_io_usb1_inst_D6,
	hps_io_hps_io_usb1_inst_D7,
	hps_io_hps_io_usb1_inst_CLK,
	hps_io_hps_io_usb1_inst_STP,
	hps_io_hps_io_usb1_inst_DIR,
	hps_io_hps_io_usb1_inst_NXT,
	hps_io_hps_io_uart0_inst_RX,
	hps_io_hps_io_uart0_inst_TX,
	hps_io_hps_io_i2c0_inst_SDA,
	hps_io_hps_io_i2c0_inst_SCL,
	hps_io_hps_io_gpio_inst_GPIO09,
	hps_io_hps_io_gpio_inst_GPIO35,
	hps_io_hps_io_gpio_inst_GPIO53,
	hps_io_hps_io_gpio_inst_GPIO61,
	hps_io_hps_io_gpio_inst_LOANIO40,
	hps_io_hps_io_gpio_inst_LOANIO51,
	hps_io_hps_io_gpio_inst_LOANIO52,
	hps_io_hps_io_gpio_inst_LOANIO54,
	hps_io_hps_io_gpio_inst_LOANIO64,
	hps_io_hps_io_gpio_inst_LOANIO65,
	id_switch0_sw,
	piezo_controller_piezo_enable_export,
	piezo_controller_piezo_enable_piezo_enable_in,
	piezo_controller_piezo_out_export,
	piezo_controller_piezo_status_export,
	ptp_piezo_interface0_piezo_interface_in,
	ptp_piezo_interface0_piezo_interface_out,
	ptp_piezo_interface0_time_data_master,
	ptp_piezo_interface0_time_data_slave,
	reset_reset_n,
	rtc_0_conduit_end_event_trigger,
	rtc_0_conduit_end_piezo_enable,
	rtc_0_conduit_end_event_trigger2);	

	input		clk_clk;
	output		clock_divider_0_conduit_end_out_clk;
	input	[1:0]	fpga_key_input_export;
	output	[7:0]	fpga_led_output_export;
	output	[14:0]	hps_ddr_mem_a;
	output	[2:0]	hps_ddr_mem_ba;
	output		hps_ddr_mem_ck;
	output		hps_ddr_mem_ck_n;
	output		hps_ddr_mem_cke;
	output		hps_ddr_mem_cs_n;
	output		hps_ddr_mem_ras_n;
	output		hps_ddr_mem_cas_n;
	output		hps_ddr_mem_we_n;
	output		hps_ddr_mem_reset_n;
	inout	[31:0]	hps_ddr_mem_dq;
	inout	[3:0]	hps_ddr_mem_dqs;
	inout	[3:0]	hps_ddr_mem_dqs_n;
	output		hps_ddr_mem_odt;
	output	[3:0]	hps_ddr_mem_dm;
	input		hps_ddr_oct_rzqin;
	output	[66:0]	hps_h2f_loan_io_in;
	input	[66:0]	hps_h2f_loan_io_out;
	input	[66:0]	hps_h2f_loan_io_oe;
	output		hps_io_hps_io_emac1_inst_TX_CLK;
	output		hps_io_hps_io_emac1_inst_TXD0;
	output		hps_io_hps_io_emac1_inst_TXD1;
	output		hps_io_hps_io_emac1_inst_TXD2;
	output		hps_io_hps_io_emac1_inst_TXD3;
	input		hps_io_hps_io_emac1_inst_RXD0;
	inout		hps_io_hps_io_emac1_inst_MDIO;
	output		hps_io_hps_io_emac1_inst_MDC;
	input		hps_io_hps_io_emac1_inst_RX_CTL;
	output		hps_io_hps_io_emac1_inst_TX_CTL;
	input		hps_io_hps_io_emac1_inst_RX_CLK;
	input		hps_io_hps_io_emac1_inst_RXD1;
	input		hps_io_hps_io_emac1_inst_RXD2;
	input		hps_io_hps_io_emac1_inst_RXD3;
	inout		hps_io_hps_io_sdio_inst_CMD;
	inout		hps_io_hps_io_sdio_inst_D0;
	inout		hps_io_hps_io_sdio_inst_D1;
	output		hps_io_hps_io_sdio_inst_CLK;
	inout		hps_io_hps_io_sdio_inst_D2;
	inout		hps_io_hps_io_sdio_inst_D3;
	inout		hps_io_hps_io_usb1_inst_D0;
	inout		hps_io_hps_io_usb1_inst_D1;
	inout		hps_io_hps_io_usb1_inst_D2;
	inout		hps_io_hps_io_usb1_inst_D3;
	inout		hps_io_hps_io_usb1_inst_D4;
	inout		hps_io_hps_io_usb1_inst_D5;
	inout		hps_io_hps_io_usb1_inst_D6;
	inout		hps_io_hps_io_usb1_inst_D7;
	input		hps_io_hps_io_usb1_inst_CLK;
	output		hps_io_hps_io_usb1_inst_STP;
	input		hps_io_hps_io_usb1_inst_DIR;
	input		hps_io_hps_io_usb1_inst_NXT;
	input		hps_io_hps_io_uart0_inst_RX;
	output		hps_io_hps_io_uart0_inst_TX;
	inout		hps_io_hps_io_i2c0_inst_SDA;
	inout		hps_io_hps_io_i2c0_inst_SCL;
	inout		hps_io_hps_io_gpio_inst_GPIO09;
	inout		hps_io_hps_io_gpio_inst_GPIO35;
	inout		hps_io_hps_io_gpio_inst_GPIO53;
	inout		hps_io_hps_io_gpio_inst_GPIO61;
	inout		hps_io_hps_io_gpio_inst_LOANIO40;
	inout		hps_io_hps_io_gpio_inst_LOANIO51;
	inout		hps_io_hps_io_gpio_inst_LOANIO52;
	inout		hps_io_hps_io_gpio_inst_LOANIO54;
	inout		hps_io_hps_io_gpio_inst_LOANIO64;
	inout		hps_io_hps_io_gpio_inst_LOANIO65;
	input	[3:0]	id_switch0_sw;
	output		piezo_controller_piezo_enable_export;
	input		piezo_controller_piezo_enable_piezo_enable_in;
	output	[60:0]	piezo_controller_piezo_out_export;
	output	[2:0]	piezo_controller_piezo_status_export;
	input		ptp_piezo_interface0_piezo_interface_in;
	output		ptp_piezo_interface0_piezo_interface_out;
	output	[31:0]	ptp_piezo_interface0_time_data_master;
	output	[31:0]	ptp_piezo_interface0_time_data_slave;
	input		reset_reset_n;
	input		rtc_0_conduit_end_event_trigger;
	output		rtc_0_conduit_end_piezo_enable;
	input		rtc_0_conduit_end_event_trigger2;
endmodule
