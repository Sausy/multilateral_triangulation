
module test_programm (
	clk_clk,
	reset_reset_n,
	spislave0_ispi_in,
	spislave0_ispi_send_byte,
	spislave0_ispi_ss_n,
	spislave0_ospi_inc_wraddr,
	spislave0_ospi_out,
	spislave0_ospi_periph_slct,
	spislave0_ospi_rcv_byte,
	spislave0_ospi_rcv_cmd,
	spislave0_ospi_write_sig);	

	input		clk_clk;
	input		reset_reset_n;
	input		spislave0_ispi_in;
	input	[7:0]	spislave0_ispi_send_byte;
	input		spislave0_ispi_ss_n;
	output		spislave0_ospi_inc_wraddr;
	output		spislave0_ospi_out;
	output	[4:0]	spislave0_ospi_periph_slct;
	output	[7:0]	spislave0_ospi_rcv_byte;
	output	[7:0]	spislave0_ospi_rcv_cmd;
	output		spislave0_ospi_write_sig;
endmodule
