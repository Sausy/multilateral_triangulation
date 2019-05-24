
module MKRVIDOR4000_peripherals_lite_sys (
	clk_clk,
	clk_0_clk,
	encoder_encoder_a,
	encoder_encoder_b,
	flash_spi_MOSI,
	flash_spi_SCLK,
	flash_spi_MISO,
	flash_spi_CS,
	i2c0_scl_i,
	i2c0_scl_o,
	i2c0_scl_en,
	i2c0_sda_i,
	i2c0_sda_o,
	i2c0_sda_en,
	i2c1_scl_i,
	i2c1_scl_o,
	i2c1_scl_en,
	i2c1_sda_i,
	i2c1_sda_o,
	i2c1_sda_en,
	i2c2_scl_i,
	i2c2_scl_o,
	i2c2_scl_en,
	i2c2_sda_i,
	i2c2_sda_o,
	i2c2_sda_en,
	i2c3_scl_i,
	i2c3_scl_o,
	i2c3_scl_en,
	i2c3_sda_i,
	i2c3_sda_o,
	i2c3_sda_en,
	mb_ak,
	mb_rq,
	nina_spi_MOSI,
	nina_spi_SCLK,
	nina_spi_MISO,
	nina_spi_CS,
	pex_pio_in,
	pex_pio_dir,
	pex_pio_out,
	pex_pio_msel,
	pixel_data,
	pixel_clock,
	qspi_dclk,
	qspi_ncs,
	qspi_oe,
	qspi_dataout,
	qspi_dataoe,
	qspi_datain,
	reset_reset_n,
	reset_0_reset_n,
	sam_pio_in,
	sam_pio_dir,
	sam_pio_out,
	sam_pio_msel,
	sam_pwm_pwm,
	sdram_addr,
	sdram_ba,
	sdram_cas_n,
	sdram_cke,
	sdram_cs_n,
	sdram_dq,
	sdram_dqm,
	sdram_ras_n,
	sdram_we_n,
	spi0_MOSI,
	spi0_SCLK,
	spi0_MISO,
	spi0_CS,
	spi1_MOSI,
	spi1_SCLK,
	spi1_MISO,
	spi1_CS,
	spi2_MOSI,
	spi2_SCLK,
	spi2_MISO,
	spi2_CS,
	spi3_MOSI,
	spi3_SCLK,
	spi3_MISO,
	spi3_CS,
	spi4_MOSI,
	spi4_SCLK,
	spi4_MISO,
	spi4_CS,
	wm_pio_in,
	wm_pio_dir,
	wm_pio_out,
	wm_pio_msel);	

	input		clk_clk;
	input		clk_0_clk;
	input	[10:0]	encoder_encoder_a;
	input	[10:0]	encoder_encoder_b;
	output		flash_spi_MOSI;
	output		flash_spi_SCLK;
	input		flash_spi_MISO;
	output		flash_spi_CS;
	input		i2c0_scl_i;
	output		i2c0_scl_o;
	output		i2c0_scl_en;
	input		i2c0_sda_i;
	output		i2c0_sda_o;
	output		i2c0_sda_en;
	input		i2c1_scl_i;
	output		i2c1_scl_o;
	output		i2c1_scl_en;
	input		i2c1_sda_i;
	output		i2c1_sda_o;
	output		i2c1_sda_en;
	input		i2c2_scl_i;
	output		i2c2_scl_o;
	output		i2c2_scl_en;
	input		i2c2_sda_i;
	output		i2c2_sda_o;
	output		i2c2_sda_en;
	input		i2c3_scl_i;
	output		i2c3_scl_o;
	output		i2c3_scl_en;
	input		i2c3_sda_i;
	output		i2c3_sda_o;
	output		i2c3_sda_en;
	output		mb_ak;
	input		mb_rq;
	output		nina_spi_MOSI;
	output		nina_spi_SCLK;
	input		nina_spi_MISO;
	output		nina_spi_CS;
	input	[31:0]	pex_pio_in;
	output	[31:0]	pex_pio_dir;
	output	[31:0]	pex_pio_out;
	output	[63:0]	pex_pio_msel;
	output	[4:0]	pixel_data;
	output		pixel_clock;
	output		qspi_dclk;
	output		qspi_ncs;
	output		qspi_oe;
	output	[3:0]	qspi_dataout;
	output	[3:0]	qspi_dataoe;
	input	[3:0]	qspi_datain;
	input		reset_reset_n;
	input		reset_0_reset_n;
	input	[31:0]	sam_pio_in;
	output	[31:0]	sam_pio_dir;
	output	[31:0]	sam_pio_out;
	output	[63:0]	sam_pio_msel;
	output	[23:0]	sam_pwm_pwm;
	output	[11:0]	sdram_addr;
	output	[1:0]	sdram_ba;
	output		sdram_cas_n;
	output		sdram_cke;
	output		sdram_cs_n;
	inout	[15:0]	sdram_dq;
	output	[1:0]	sdram_dqm;
	output		sdram_ras_n;
	output		sdram_we_n;
	output		spi0_MOSI;
	output		spi0_SCLK;
	input		spi0_MISO;
	output		spi0_CS;
	output		spi1_MOSI;
	output		spi1_SCLK;
	input		spi1_MISO;
	output		spi1_CS;
	output		spi2_MOSI;
	output		spi2_SCLK;
	input		spi2_MISO;
	output		spi2_CS;
	output		spi3_MOSI;
	output		spi3_SCLK;
	input		spi3_MISO;
	output		spi3_CS;
	output		spi4_MOSI;
	output		spi4_SCLK;
	input		spi4_MISO;
	output		spi4_CS;
	input	[31:0]	wm_pio_in;
	output	[31:0]	wm_pio_dir;
	output	[31:0]	wm_pio_out;
	output	[63:0]	wm_pio_msel;
endmodule
