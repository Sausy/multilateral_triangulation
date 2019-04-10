	component soc_system is
		port (
			clk_clk                                       : in    std_logic                     := 'X';             -- clk
			clock_divider_0_conduit_end_out_clk           : out   std_logic;                                        -- out_clk
			fpga_key_input_export                         : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			fpga_led_output_export                        : out   std_logic_vector(7 downto 0);                     -- export
			hps_ddr_mem_a                                 : out   std_logic_vector(14 downto 0);                    -- mem_a
			hps_ddr_mem_ba                                : out   std_logic_vector(2 downto 0);                     -- mem_ba
			hps_ddr_mem_ck                                : out   std_logic;                                        -- mem_ck
			hps_ddr_mem_ck_n                              : out   std_logic;                                        -- mem_ck_n
			hps_ddr_mem_cke                               : out   std_logic;                                        -- mem_cke
			hps_ddr_mem_cs_n                              : out   std_logic;                                        -- mem_cs_n
			hps_ddr_mem_ras_n                             : out   std_logic;                                        -- mem_ras_n
			hps_ddr_mem_cas_n                             : out   std_logic;                                        -- mem_cas_n
			hps_ddr_mem_we_n                              : out   std_logic;                                        -- mem_we_n
			hps_ddr_mem_reset_n                           : out   std_logic;                                        -- mem_reset_n
			hps_ddr_mem_dq                                : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
			hps_ddr_mem_dqs                               : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
			hps_ddr_mem_dqs_n                             : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
			hps_ddr_mem_odt                               : out   std_logic;                                        -- mem_odt
			hps_ddr_mem_dm                                : out   std_logic_vector(3 downto 0);                     -- mem_dm
			hps_ddr_oct_rzqin                             : in    std_logic                     := 'X';             -- oct_rzqin
			hps_h2f_loan_io_in                            : out   std_logic_vector(66 downto 0);                    -- in
			hps_h2f_loan_io_out                           : in    std_logic_vector(66 downto 0) := (others => 'X'); -- out
			hps_h2f_loan_io_oe                            : in    std_logic_vector(66 downto 0) := (others => 'X'); -- oe
			hps_io_hps_io_emac1_inst_TX_CLK               : out   std_logic;                                        -- hps_io_emac1_inst_TX_CLK
			hps_io_hps_io_emac1_inst_TXD0                 : out   std_logic;                                        -- hps_io_emac1_inst_TXD0
			hps_io_hps_io_emac1_inst_TXD1                 : out   std_logic;                                        -- hps_io_emac1_inst_TXD1
			hps_io_hps_io_emac1_inst_TXD2                 : out   std_logic;                                        -- hps_io_emac1_inst_TXD2
			hps_io_hps_io_emac1_inst_TXD3                 : out   std_logic;                                        -- hps_io_emac1_inst_TXD3
			hps_io_hps_io_emac1_inst_RXD0                 : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD0
			hps_io_hps_io_emac1_inst_MDIO                 : inout std_logic                     := 'X';             -- hps_io_emac1_inst_MDIO
			hps_io_hps_io_emac1_inst_MDC                  : out   std_logic;                                        -- hps_io_emac1_inst_MDC
			hps_io_hps_io_emac1_inst_RX_CTL               : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CTL
			hps_io_hps_io_emac1_inst_TX_CTL               : out   std_logic;                                        -- hps_io_emac1_inst_TX_CTL
			hps_io_hps_io_emac1_inst_RX_CLK               : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CLK
			hps_io_hps_io_emac1_inst_RXD1                 : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD1
			hps_io_hps_io_emac1_inst_RXD2                 : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD2
			hps_io_hps_io_emac1_inst_RXD3                 : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD3
			hps_io_hps_io_sdio_inst_CMD                   : inout std_logic                     := 'X';             -- hps_io_sdio_inst_CMD
			hps_io_hps_io_sdio_inst_D0                    : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D0
			hps_io_hps_io_sdio_inst_D1                    : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D1
			hps_io_hps_io_sdio_inst_CLK                   : out   std_logic;                                        -- hps_io_sdio_inst_CLK
			hps_io_hps_io_sdio_inst_D2                    : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D2
			hps_io_hps_io_sdio_inst_D3                    : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D3
			hps_io_hps_io_usb1_inst_D0                    : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D0
			hps_io_hps_io_usb1_inst_D1                    : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D1
			hps_io_hps_io_usb1_inst_D2                    : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D2
			hps_io_hps_io_usb1_inst_D3                    : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D3
			hps_io_hps_io_usb1_inst_D4                    : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D4
			hps_io_hps_io_usb1_inst_D5                    : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D5
			hps_io_hps_io_usb1_inst_D6                    : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D6
			hps_io_hps_io_usb1_inst_D7                    : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D7
			hps_io_hps_io_usb1_inst_CLK                   : in    std_logic                     := 'X';             -- hps_io_usb1_inst_CLK
			hps_io_hps_io_usb1_inst_STP                   : out   std_logic;                                        -- hps_io_usb1_inst_STP
			hps_io_hps_io_usb1_inst_DIR                   : in    std_logic                     := 'X';             -- hps_io_usb1_inst_DIR
			hps_io_hps_io_usb1_inst_NXT                   : in    std_logic                     := 'X';             -- hps_io_usb1_inst_NXT
			hps_io_hps_io_uart0_inst_RX                   : in    std_logic                     := 'X';             -- hps_io_uart0_inst_RX
			hps_io_hps_io_uart0_inst_TX                   : out   std_logic;                                        -- hps_io_uart0_inst_TX
			hps_io_hps_io_i2c0_inst_SDA                   : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SDA
			hps_io_hps_io_i2c0_inst_SCL                   : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SCL
			hps_io_hps_io_gpio_inst_GPIO09                : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO09
			hps_io_hps_io_gpio_inst_GPIO35                : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO35
			hps_io_hps_io_gpio_inst_GPIO53                : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO53
			hps_io_hps_io_gpio_inst_GPIO61                : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO61
			hps_io_hps_io_gpio_inst_LOANIO40              : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO40
			hps_io_hps_io_gpio_inst_LOANIO51              : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO51
			hps_io_hps_io_gpio_inst_LOANIO52              : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO52
			hps_io_hps_io_gpio_inst_LOANIO54              : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO54
			hps_io_hps_io_gpio_inst_LOANIO64              : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO64
			hps_io_hps_io_gpio_inst_LOANIO65              : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO65
			piezo_controller_piezo_enable_export          : out   std_logic;                                        -- export
			piezo_controller_piezo_enable_piezo_enable_in : in    std_logic                     := 'X';             -- piezo_enable_in
			piezo_controller_piezo_out_export             : out   std_logic_vector(60 downto 0);                    -- export
			piezo_controller_piezo_status_export          : out   std_logic_vector(2 downto 0);                     -- export
			ptp_piezo_interface0_piezo_interface_in       : in    std_logic                     := 'X';             -- piezo_interface_in
			ptp_piezo_interface0_piezo_interface_out      : out   std_logic;                                        -- piezo_interface_out
			reset_reset_n                                 : in    std_logic                     := 'X';             -- reset_n
			rtc_0_conduit_end_event_trigger               : in    std_logic                     := 'X';             -- event_trigger
			rtc_0_conduit_end_piezo_enable                : out   std_logic;                                        -- piezo_enable
			rtc_0_conduit_end_event_trigger2              : in    std_logic                     := 'X'              -- event_trigger2
		);
	end component soc_system;

	u0 : component soc_system
		port map (
			clk_clk                                       => CONNECTED_TO_clk_clk,                                       --                           clk.clk
			clock_divider_0_conduit_end_out_clk           => CONNECTED_TO_clock_divider_0_conduit_end_out_clk,           --   clock_divider_0_conduit_end.out_clk
			fpga_key_input_export                         => CONNECTED_TO_fpga_key_input_export,                         --                fpga_key_input.export
			fpga_led_output_export                        => CONNECTED_TO_fpga_led_output_export,                        --               fpga_led_output.export
			hps_ddr_mem_a                                 => CONNECTED_TO_hps_ddr_mem_a,                                 --                       hps_ddr.mem_a
			hps_ddr_mem_ba                                => CONNECTED_TO_hps_ddr_mem_ba,                                --                              .mem_ba
			hps_ddr_mem_ck                                => CONNECTED_TO_hps_ddr_mem_ck,                                --                              .mem_ck
			hps_ddr_mem_ck_n                              => CONNECTED_TO_hps_ddr_mem_ck_n,                              --                              .mem_ck_n
			hps_ddr_mem_cke                               => CONNECTED_TO_hps_ddr_mem_cke,                               --                              .mem_cke
			hps_ddr_mem_cs_n                              => CONNECTED_TO_hps_ddr_mem_cs_n,                              --                              .mem_cs_n
			hps_ddr_mem_ras_n                             => CONNECTED_TO_hps_ddr_mem_ras_n,                             --                              .mem_ras_n
			hps_ddr_mem_cas_n                             => CONNECTED_TO_hps_ddr_mem_cas_n,                             --                              .mem_cas_n
			hps_ddr_mem_we_n                              => CONNECTED_TO_hps_ddr_mem_we_n,                              --                              .mem_we_n
			hps_ddr_mem_reset_n                           => CONNECTED_TO_hps_ddr_mem_reset_n,                           --                              .mem_reset_n
			hps_ddr_mem_dq                                => CONNECTED_TO_hps_ddr_mem_dq,                                --                              .mem_dq
			hps_ddr_mem_dqs                               => CONNECTED_TO_hps_ddr_mem_dqs,                               --                              .mem_dqs
			hps_ddr_mem_dqs_n                             => CONNECTED_TO_hps_ddr_mem_dqs_n,                             --                              .mem_dqs_n
			hps_ddr_mem_odt                               => CONNECTED_TO_hps_ddr_mem_odt,                               --                              .mem_odt
			hps_ddr_mem_dm                                => CONNECTED_TO_hps_ddr_mem_dm,                                --                              .mem_dm
			hps_ddr_oct_rzqin                             => CONNECTED_TO_hps_ddr_oct_rzqin,                             --                              .oct_rzqin
			hps_h2f_loan_io_in                            => CONNECTED_TO_hps_h2f_loan_io_in,                            --               hps_h2f_loan_io.in
			hps_h2f_loan_io_out                           => CONNECTED_TO_hps_h2f_loan_io_out,                           --                              .out
			hps_h2f_loan_io_oe                            => CONNECTED_TO_hps_h2f_loan_io_oe,                            --                              .oe
			hps_io_hps_io_emac1_inst_TX_CLK               => CONNECTED_TO_hps_io_hps_io_emac1_inst_TX_CLK,               --                        hps_io.hps_io_emac1_inst_TX_CLK
			hps_io_hps_io_emac1_inst_TXD0                 => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD0,                 --                              .hps_io_emac1_inst_TXD0
			hps_io_hps_io_emac1_inst_TXD1                 => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD1,                 --                              .hps_io_emac1_inst_TXD1
			hps_io_hps_io_emac1_inst_TXD2                 => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD2,                 --                              .hps_io_emac1_inst_TXD2
			hps_io_hps_io_emac1_inst_TXD3                 => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD3,                 --                              .hps_io_emac1_inst_TXD3
			hps_io_hps_io_emac1_inst_RXD0                 => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD0,                 --                              .hps_io_emac1_inst_RXD0
			hps_io_hps_io_emac1_inst_MDIO                 => CONNECTED_TO_hps_io_hps_io_emac1_inst_MDIO,                 --                              .hps_io_emac1_inst_MDIO
			hps_io_hps_io_emac1_inst_MDC                  => CONNECTED_TO_hps_io_hps_io_emac1_inst_MDC,                  --                              .hps_io_emac1_inst_MDC
			hps_io_hps_io_emac1_inst_RX_CTL               => CONNECTED_TO_hps_io_hps_io_emac1_inst_RX_CTL,               --                              .hps_io_emac1_inst_RX_CTL
			hps_io_hps_io_emac1_inst_TX_CTL               => CONNECTED_TO_hps_io_hps_io_emac1_inst_TX_CTL,               --                              .hps_io_emac1_inst_TX_CTL
			hps_io_hps_io_emac1_inst_RX_CLK               => CONNECTED_TO_hps_io_hps_io_emac1_inst_RX_CLK,               --                              .hps_io_emac1_inst_RX_CLK
			hps_io_hps_io_emac1_inst_RXD1                 => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD1,                 --                              .hps_io_emac1_inst_RXD1
			hps_io_hps_io_emac1_inst_RXD2                 => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD2,                 --                              .hps_io_emac1_inst_RXD2
			hps_io_hps_io_emac1_inst_RXD3                 => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD3,                 --                              .hps_io_emac1_inst_RXD3
			hps_io_hps_io_sdio_inst_CMD                   => CONNECTED_TO_hps_io_hps_io_sdio_inst_CMD,                   --                              .hps_io_sdio_inst_CMD
			hps_io_hps_io_sdio_inst_D0                    => CONNECTED_TO_hps_io_hps_io_sdio_inst_D0,                    --                              .hps_io_sdio_inst_D0
			hps_io_hps_io_sdio_inst_D1                    => CONNECTED_TO_hps_io_hps_io_sdio_inst_D1,                    --                              .hps_io_sdio_inst_D1
			hps_io_hps_io_sdio_inst_CLK                   => CONNECTED_TO_hps_io_hps_io_sdio_inst_CLK,                   --                              .hps_io_sdio_inst_CLK
			hps_io_hps_io_sdio_inst_D2                    => CONNECTED_TO_hps_io_hps_io_sdio_inst_D2,                    --                              .hps_io_sdio_inst_D2
			hps_io_hps_io_sdio_inst_D3                    => CONNECTED_TO_hps_io_hps_io_sdio_inst_D3,                    --                              .hps_io_sdio_inst_D3
			hps_io_hps_io_usb1_inst_D0                    => CONNECTED_TO_hps_io_hps_io_usb1_inst_D0,                    --                              .hps_io_usb1_inst_D0
			hps_io_hps_io_usb1_inst_D1                    => CONNECTED_TO_hps_io_hps_io_usb1_inst_D1,                    --                              .hps_io_usb1_inst_D1
			hps_io_hps_io_usb1_inst_D2                    => CONNECTED_TO_hps_io_hps_io_usb1_inst_D2,                    --                              .hps_io_usb1_inst_D2
			hps_io_hps_io_usb1_inst_D3                    => CONNECTED_TO_hps_io_hps_io_usb1_inst_D3,                    --                              .hps_io_usb1_inst_D3
			hps_io_hps_io_usb1_inst_D4                    => CONNECTED_TO_hps_io_hps_io_usb1_inst_D4,                    --                              .hps_io_usb1_inst_D4
			hps_io_hps_io_usb1_inst_D5                    => CONNECTED_TO_hps_io_hps_io_usb1_inst_D5,                    --                              .hps_io_usb1_inst_D5
			hps_io_hps_io_usb1_inst_D6                    => CONNECTED_TO_hps_io_hps_io_usb1_inst_D6,                    --                              .hps_io_usb1_inst_D6
			hps_io_hps_io_usb1_inst_D7                    => CONNECTED_TO_hps_io_hps_io_usb1_inst_D7,                    --                              .hps_io_usb1_inst_D7
			hps_io_hps_io_usb1_inst_CLK                   => CONNECTED_TO_hps_io_hps_io_usb1_inst_CLK,                   --                              .hps_io_usb1_inst_CLK
			hps_io_hps_io_usb1_inst_STP                   => CONNECTED_TO_hps_io_hps_io_usb1_inst_STP,                   --                              .hps_io_usb1_inst_STP
			hps_io_hps_io_usb1_inst_DIR                   => CONNECTED_TO_hps_io_hps_io_usb1_inst_DIR,                   --                              .hps_io_usb1_inst_DIR
			hps_io_hps_io_usb1_inst_NXT                   => CONNECTED_TO_hps_io_hps_io_usb1_inst_NXT,                   --                              .hps_io_usb1_inst_NXT
			hps_io_hps_io_uart0_inst_RX                   => CONNECTED_TO_hps_io_hps_io_uart0_inst_RX,                   --                              .hps_io_uart0_inst_RX
			hps_io_hps_io_uart0_inst_TX                   => CONNECTED_TO_hps_io_hps_io_uart0_inst_TX,                   --                              .hps_io_uart0_inst_TX
			hps_io_hps_io_i2c0_inst_SDA                   => CONNECTED_TO_hps_io_hps_io_i2c0_inst_SDA,                   --                              .hps_io_i2c0_inst_SDA
			hps_io_hps_io_i2c0_inst_SCL                   => CONNECTED_TO_hps_io_hps_io_i2c0_inst_SCL,                   --                              .hps_io_i2c0_inst_SCL
			hps_io_hps_io_gpio_inst_GPIO09                => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO09,                --                              .hps_io_gpio_inst_GPIO09
			hps_io_hps_io_gpio_inst_GPIO35                => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO35,                --                              .hps_io_gpio_inst_GPIO35
			hps_io_hps_io_gpio_inst_GPIO53                => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO53,                --                              .hps_io_gpio_inst_GPIO53
			hps_io_hps_io_gpio_inst_GPIO61                => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO61,                --                              .hps_io_gpio_inst_GPIO61
			hps_io_hps_io_gpio_inst_LOANIO40              => CONNECTED_TO_hps_io_hps_io_gpio_inst_LOANIO40,              --                              .hps_io_gpio_inst_LOANIO40
			hps_io_hps_io_gpio_inst_LOANIO51              => CONNECTED_TO_hps_io_hps_io_gpio_inst_LOANIO51,              --                              .hps_io_gpio_inst_LOANIO51
			hps_io_hps_io_gpio_inst_LOANIO52              => CONNECTED_TO_hps_io_hps_io_gpio_inst_LOANIO52,              --                              .hps_io_gpio_inst_LOANIO52
			hps_io_hps_io_gpio_inst_LOANIO54              => CONNECTED_TO_hps_io_hps_io_gpio_inst_LOANIO54,              --                              .hps_io_gpio_inst_LOANIO54
			hps_io_hps_io_gpio_inst_LOANIO64              => CONNECTED_TO_hps_io_hps_io_gpio_inst_LOANIO64,              --                              .hps_io_gpio_inst_LOANIO64
			hps_io_hps_io_gpio_inst_LOANIO65              => CONNECTED_TO_hps_io_hps_io_gpio_inst_LOANIO65,              --                              .hps_io_gpio_inst_LOANIO65
			piezo_controller_piezo_enable_export          => CONNECTED_TO_piezo_controller_piezo_enable_export,          -- piezo_controller_piezo_enable.export
			piezo_controller_piezo_enable_piezo_enable_in => CONNECTED_TO_piezo_controller_piezo_enable_piezo_enable_in, --                              .piezo_enable_in
			piezo_controller_piezo_out_export             => CONNECTED_TO_piezo_controller_piezo_out_export,             --    piezo_controller_piezo_out.export
			piezo_controller_piezo_status_export          => CONNECTED_TO_piezo_controller_piezo_status_export,          -- piezo_controller_piezo_status.export
			ptp_piezo_interface0_piezo_interface_in       => CONNECTED_TO_ptp_piezo_interface0_piezo_interface_in,       --          ptp_piezo_interface0.piezo_interface_in
			ptp_piezo_interface0_piezo_interface_out      => CONNECTED_TO_ptp_piezo_interface0_piezo_interface_out,      --                              .piezo_interface_out
			reset_reset_n                                 => CONNECTED_TO_reset_reset_n,                                 --                         reset.reset_n
			rtc_0_conduit_end_event_trigger               => CONNECTED_TO_rtc_0_conduit_end_event_trigger,               --             rtc_0_conduit_end.event_trigger
			rtc_0_conduit_end_piezo_enable                => CONNECTED_TO_rtc_0_conduit_end_piezo_enable,                --                              .piezo_enable
			rtc_0_conduit_end_event_trigger2              => CONNECTED_TO_rtc_0_conduit_end_event_trigger2               --                              .event_trigger2
		);

