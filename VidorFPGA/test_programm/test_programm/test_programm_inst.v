	test_programm u0 (
		.clk_clk                    (<connected-to-clk_clk>),                    //       clk.clk
		.reset_reset_n              (<connected-to-reset_reset_n>),              //     reset.reset_n
		.spislave0_ispi_in          (<connected-to-spislave0_ispi_in>),          // spislave0.ispi_in
		.spislave0_ispi_send_byte   (<connected-to-spislave0_ispi_send_byte>),   //          .ispi_send_byte
		.spislave0_ispi_ss_n        (<connected-to-spislave0_ispi_ss_n>),        //          .ispi_ss_n
		.spislave0_ospi_inc_wraddr  (<connected-to-spislave0_ospi_inc_wraddr>),  //          .ospi_inc_wraddr
		.spislave0_ospi_out         (<connected-to-spislave0_ospi_out>),         //          .ospi_out
		.spislave0_ospi_periph_slct (<connected-to-spislave0_ospi_periph_slct>), //          .ospi_periph_slct
		.spislave0_ospi_rcv_byte    (<connected-to-spislave0_ospi_rcv_byte>),    //          .ospi_rcv_byte
		.spislave0_ospi_rcv_cmd     (<connected-to-spislave0_ospi_rcv_cmd>),     //          .ospi_rcv_cmd
		.spislave0_ospi_write_sig   (<connected-to-spislave0_ospi_write_sig>)    //          .ospi_write_sig
	);

