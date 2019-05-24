	component MKRVIDOR4000_peripherals_lite_sys is
		port (
			clk_clk           : in    std_logic                     := 'X';             -- clk
			clk_0_clk         : in    std_logic                     := 'X';             -- clk
			encoder_encoder_a : in    std_logic_vector(10 downto 0) := (others => 'X'); -- encoder_a
			encoder_encoder_b : in    std_logic_vector(10 downto 0) := (others => 'X'); -- encoder_b
			flash_spi_MOSI    : out   std_logic;                                        -- MOSI
			flash_spi_SCLK    : out   std_logic;                                        -- SCLK
			flash_spi_MISO    : in    std_logic                     := 'X';             -- MISO
			flash_spi_CS      : out   std_logic;                                        -- CS
			i2c0_scl_i        : in    std_logic                     := 'X';             -- scl_i
			i2c0_scl_o        : out   std_logic;                                        -- scl_o
			i2c0_scl_en       : out   std_logic;                                        -- scl_en
			i2c0_sda_i        : in    std_logic                     := 'X';             -- sda_i
			i2c0_sda_o        : out   std_logic;                                        -- sda_o
			i2c0_sda_en       : out   std_logic;                                        -- sda_en
			i2c1_scl_i        : in    std_logic                     := 'X';             -- scl_i
			i2c1_scl_o        : out   std_logic;                                        -- scl_o
			i2c1_scl_en       : out   std_logic;                                        -- scl_en
			i2c1_sda_i        : in    std_logic                     := 'X';             -- sda_i
			i2c1_sda_o        : out   std_logic;                                        -- sda_o
			i2c1_sda_en       : out   std_logic;                                        -- sda_en
			i2c2_scl_i        : in    std_logic                     := 'X';             -- scl_i
			i2c2_scl_o        : out   std_logic;                                        -- scl_o
			i2c2_scl_en       : out   std_logic;                                        -- scl_en
			i2c2_sda_i        : in    std_logic                     := 'X';             -- sda_i
			i2c2_sda_o        : out   std_logic;                                        -- sda_o
			i2c2_sda_en       : out   std_logic;                                        -- sda_en
			i2c3_scl_i        : in    std_logic                     := 'X';             -- scl_i
			i2c3_scl_o        : out   std_logic;                                        -- scl_o
			i2c3_scl_en       : out   std_logic;                                        -- scl_en
			i2c3_sda_i        : in    std_logic                     := 'X';             -- sda_i
			i2c3_sda_o        : out   std_logic;                                        -- sda_o
			i2c3_sda_en       : out   std_logic;                                        -- sda_en
			mb_ak             : out   std_logic;                                        -- ak
			mb_rq             : in    std_logic                     := 'X';             -- rq
			nina_spi_MOSI     : out   std_logic;                                        -- MOSI
			nina_spi_SCLK     : out   std_logic;                                        -- SCLK
			nina_spi_MISO     : in    std_logic                     := 'X';             -- MISO
			nina_spi_CS       : out   std_logic;                                        -- CS
			pex_pio_in        : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in
			pex_pio_dir       : out   std_logic_vector(31 downto 0);                    -- dir
			pex_pio_out       : out   std_logic_vector(31 downto 0);                    -- out
			pex_pio_msel      : out   std_logic_vector(63 downto 0);                    -- msel
			pixel_data        : out   std_logic_vector(4 downto 0);                     -- data
			pixel_clock       : out   std_logic;                                        -- clock
			qspi_dclk         : out   std_logic;                                        -- dclk
			qspi_ncs          : out   std_logic;                                        -- ncs
			qspi_oe           : out   std_logic;                                        -- oe
			qspi_dataout      : out   std_logic_vector(3 downto 0);                     -- dataout
			qspi_dataoe       : out   std_logic_vector(3 downto 0);                     -- dataoe
			qspi_datain       : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- datain
			reset_reset_n     : in    std_logic                     := 'X';             -- reset_n
			reset_0_reset_n   : in    std_logic                     := 'X';             -- reset_n
			sam_pio_in        : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in
			sam_pio_dir       : out   std_logic_vector(31 downto 0);                    -- dir
			sam_pio_out       : out   std_logic_vector(31 downto 0);                    -- out
			sam_pio_msel      : out   std_logic_vector(63 downto 0);                    -- msel
			sam_pwm_pwm       : out   std_logic_vector(23 downto 0);                    -- pwm
			sdram_addr        : out   std_logic_vector(11 downto 0);                    -- addr
			sdram_ba          : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_cas_n       : out   std_logic;                                        -- cas_n
			sdram_cke         : out   std_logic;                                        -- cke
			sdram_cs_n        : out   std_logic;                                        -- cs_n
			sdram_dq          : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_dqm         : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_ras_n       : out   std_logic;                                        -- ras_n
			sdram_we_n        : out   std_logic;                                        -- we_n
			spi0_MOSI         : out   std_logic;                                        -- MOSI
			spi0_SCLK         : out   std_logic;                                        -- SCLK
			spi0_MISO         : in    std_logic                     := 'X';             -- MISO
			spi0_CS           : out   std_logic;                                        -- CS
			spi1_MOSI         : out   std_logic;                                        -- MOSI
			spi1_SCLK         : out   std_logic;                                        -- SCLK
			spi1_MISO         : in    std_logic                     := 'X';             -- MISO
			spi1_CS           : out   std_logic;                                        -- CS
			spi2_MOSI         : out   std_logic;                                        -- MOSI
			spi2_SCLK         : out   std_logic;                                        -- SCLK
			spi2_MISO         : in    std_logic                     := 'X';             -- MISO
			spi2_CS           : out   std_logic;                                        -- CS
			spi3_MOSI         : out   std_logic;                                        -- MOSI
			spi3_SCLK         : out   std_logic;                                        -- SCLK
			spi3_MISO         : in    std_logic                     := 'X';             -- MISO
			spi3_CS           : out   std_logic;                                        -- CS
			spi4_MOSI         : out   std_logic;                                        -- MOSI
			spi4_SCLK         : out   std_logic;                                        -- SCLK
			spi4_MISO         : in    std_logic                     := 'X';             -- MISO
			spi4_CS           : out   std_logic;                                        -- CS
			wm_pio_in         : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in
			wm_pio_dir        : out   std_logic_vector(31 downto 0);                    -- dir
			wm_pio_out        : out   std_logic_vector(31 downto 0);                    -- out
			wm_pio_msel       : out   std_logic_vector(63 downto 0)                     -- msel
		);
	end component MKRVIDOR4000_peripherals_lite_sys;

	u0 : component MKRVIDOR4000_peripherals_lite_sys
		port map (
			clk_clk           => CONNECTED_TO_clk_clk,           --       clk.clk
			clk_0_clk         => CONNECTED_TO_clk_0_clk,         --     clk_0.clk
			encoder_encoder_a => CONNECTED_TO_encoder_encoder_a, --   encoder.encoder_a
			encoder_encoder_b => CONNECTED_TO_encoder_encoder_b, --          .encoder_b
			flash_spi_MOSI    => CONNECTED_TO_flash_spi_MOSI,    -- flash_spi.MOSI
			flash_spi_SCLK    => CONNECTED_TO_flash_spi_SCLK,    --          .SCLK
			flash_spi_MISO    => CONNECTED_TO_flash_spi_MISO,    --          .MISO
			flash_spi_CS      => CONNECTED_TO_flash_spi_CS,      --          .CS
			i2c0_scl_i        => CONNECTED_TO_i2c0_scl_i,        --      i2c0.scl_i
			i2c0_scl_o        => CONNECTED_TO_i2c0_scl_o,        --          .scl_o
			i2c0_scl_en       => CONNECTED_TO_i2c0_scl_en,       --          .scl_en
			i2c0_sda_i        => CONNECTED_TO_i2c0_sda_i,        --          .sda_i
			i2c0_sda_o        => CONNECTED_TO_i2c0_sda_o,        --          .sda_o
			i2c0_sda_en       => CONNECTED_TO_i2c0_sda_en,       --          .sda_en
			i2c1_scl_i        => CONNECTED_TO_i2c1_scl_i,        --      i2c1.scl_i
			i2c1_scl_o        => CONNECTED_TO_i2c1_scl_o,        --          .scl_o
			i2c1_scl_en       => CONNECTED_TO_i2c1_scl_en,       --          .scl_en
			i2c1_sda_i        => CONNECTED_TO_i2c1_sda_i,        --          .sda_i
			i2c1_sda_o        => CONNECTED_TO_i2c1_sda_o,        --          .sda_o
			i2c1_sda_en       => CONNECTED_TO_i2c1_sda_en,       --          .sda_en
			i2c2_scl_i        => CONNECTED_TO_i2c2_scl_i,        --      i2c2.scl_i
			i2c2_scl_o        => CONNECTED_TO_i2c2_scl_o,        --          .scl_o
			i2c2_scl_en       => CONNECTED_TO_i2c2_scl_en,       --          .scl_en
			i2c2_sda_i        => CONNECTED_TO_i2c2_sda_i,        --          .sda_i
			i2c2_sda_o        => CONNECTED_TO_i2c2_sda_o,        --          .sda_o
			i2c2_sda_en       => CONNECTED_TO_i2c2_sda_en,       --          .sda_en
			i2c3_scl_i        => CONNECTED_TO_i2c3_scl_i,        --      i2c3.scl_i
			i2c3_scl_o        => CONNECTED_TO_i2c3_scl_o,        --          .scl_o
			i2c3_scl_en       => CONNECTED_TO_i2c3_scl_en,       --          .scl_en
			i2c3_sda_i        => CONNECTED_TO_i2c3_sda_i,        --          .sda_i
			i2c3_sda_o        => CONNECTED_TO_i2c3_sda_o,        --          .sda_o
			i2c3_sda_en       => CONNECTED_TO_i2c3_sda_en,       --          .sda_en
			mb_ak             => CONNECTED_TO_mb_ak,             --        mb.ak
			mb_rq             => CONNECTED_TO_mb_rq,             --          .rq
			nina_spi_MOSI     => CONNECTED_TO_nina_spi_MOSI,     --  nina_spi.MOSI
			nina_spi_SCLK     => CONNECTED_TO_nina_spi_SCLK,     --          .SCLK
			nina_spi_MISO     => CONNECTED_TO_nina_spi_MISO,     --          .MISO
			nina_spi_CS       => CONNECTED_TO_nina_spi_CS,       --          .CS
			pex_pio_in        => CONNECTED_TO_pex_pio_in,        --   pex_pio.in
			pex_pio_dir       => CONNECTED_TO_pex_pio_dir,       --          .dir
			pex_pio_out       => CONNECTED_TO_pex_pio_out,       --          .out
			pex_pio_msel      => CONNECTED_TO_pex_pio_msel,      --          .msel
			pixel_data        => CONNECTED_TO_pixel_data,        --     pixel.data
			pixel_clock       => CONNECTED_TO_pixel_clock,       --          .clock
			qspi_dclk         => CONNECTED_TO_qspi_dclk,         --      qspi.dclk
			qspi_ncs          => CONNECTED_TO_qspi_ncs,          --          .ncs
			qspi_oe           => CONNECTED_TO_qspi_oe,           --          .oe
			qspi_dataout      => CONNECTED_TO_qspi_dataout,      --          .dataout
			qspi_dataoe       => CONNECTED_TO_qspi_dataoe,       --          .dataoe
			qspi_datain       => CONNECTED_TO_qspi_datain,       --          .datain
			reset_reset_n     => CONNECTED_TO_reset_reset_n,     --     reset.reset_n
			reset_0_reset_n   => CONNECTED_TO_reset_0_reset_n,   --   reset_0.reset_n
			sam_pio_in        => CONNECTED_TO_sam_pio_in,        --   sam_pio.in
			sam_pio_dir       => CONNECTED_TO_sam_pio_dir,       --          .dir
			sam_pio_out       => CONNECTED_TO_sam_pio_out,       --          .out
			sam_pio_msel      => CONNECTED_TO_sam_pio_msel,      --          .msel
			sam_pwm_pwm       => CONNECTED_TO_sam_pwm_pwm,       --   sam_pwm.pwm
			sdram_addr        => CONNECTED_TO_sdram_addr,        --     sdram.addr
			sdram_ba          => CONNECTED_TO_sdram_ba,          --          .ba
			sdram_cas_n       => CONNECTED_TO_sdram_cas_n,       --          .cas_n
			sdram_cke         => CONNECTED_TO_sdram_cke,         --          .cke
			sdram_cs_n        => CONNECTED_TO_sdram_cs_n,        --          .cs_n
			sdram_dq          => CONNECTED_TO_sdram_dq,          --          .dq
			sdram_dqm         => CONNECTED_TO_sdram_dqm,         --          .dqm
			sdram_ras_n       => CONNECTED_TO_sdram_ras_n,       --          .ras_n
			sdram_we_n        => CONNECTED_TO_sdram_we_n,        --          .we_n
			spi0_MOSI         => CONNECTED_TO_spi0_MOSI,         --      spi0.MOSI
			spi0_SCLK         => CONNECTED_TO_spi0_SCLK,         --          .SCLK
			spi0_MISO         => CONNECTED_TO_spi0_MISO,         --          .MISO
			spi0_CS           => CONNECTED_TO_spi0_CS,           --          .CS
			spi1_MOSI         => CONNECTED_TO_spi1_MOSI,         --      spi1.MOSI
			spi1_SCLK         => CONNECTED_TO_spi1_SCLK,         --          .SCLK
			spi1_MISO         => CONNECTED_TO_spi1_MISO,         --          .MISO
			spi1_CS           => CONNECTED_TO_spi1_CS,           --          .CS
			spi2_MOSI         => CONNECTED_TO_spi2_MOSI,         --      spi2.MOSI
			spi2_SCLK         => CONNECTED_TO_spi2_SCLK,         --          .SCLK
			spi2_MISO         => CONNECTED_TO_spi2_MISO,         --          .MISO
			spi2_CS           => CONNECTED_TO_spi2_CS,           --          .CS
			spi3_MOSI         => CONNECTED_TO_spi3_MOSI,         --      spi3.MOSI
			spi3_SCLK         => CONNECTED_TO_spi3_SCLK,         --          .SCLK
			spi3_MISO         => CONNECTED_TO_spi3_MISO,         --          .MISO
			spi3_CS           => CONNECTED_TO_spi3_CS,           --          .CS
			spi4_MOSI         => CONNECTED_TO_spi4_MOSI,         --      spi4.MOSI
			spi4_SCLK         => CONNECTED_TO_spi4_SCLK,         --          .SCLK
			spi4_MISO         => CONNECTED_TO_spi4_MISO,         --          .MISO
			spi4_CS           => CONNECTED_TO_spi4_CS,           --          .CS
			wm_pio_in         => CONNECTED_TO_wm_pio_in,         --    wm_pio.in
			wm_pio_dir        => CONNECTED_TO_wm_pio_dir,        --          .dir
			wm_pio_out        => CONNECTED_TO_wm_pio_out,        --          .out
			wm_pio_msel       => CONNECTED_TO_wm_pio_msel        --          .msel
		);

