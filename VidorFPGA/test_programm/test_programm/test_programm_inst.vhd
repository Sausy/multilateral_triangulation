	component test_programm is
		port (
			clk_clk                    : in  std_logic                    := 'X';             -- clk
			reset_reset_n              : in  std_logic                    := 'X';             -- reset_n
			spislave0_ispi_in          : in  std_logic                    := 'X';             -- ispi_in
			spislave0_ispi_send_byte   : in  std_logic_vector(7 downto 0) := (others => 'X'); -- ispi_send_byte
			spislave0_ispi_ss_n        : in  std_logic                    := 'X';             -- ispi_ss_n
			spislave0_ospi_inc_wraddr  : out std_logic;                                       -- ospi_inc_wraddr
			spislave0_ospi_out         : out std_logic;                                       -- ospi_out
			spislave0_ospi_periph_slct : out std_logic_vector(4 downto 0);                    -- ospi_periph_slct
			spislave0_ospi_rcv_byte    : out std_logic_vector(7 downto 0);                    -- ospi_rcv_byte
			spislave0_ospi_rcv_cmd     : out std_logic_vector(7 downto 0);                    -- ospi_rcv_cmd
			spislave0_ospi_write_sig   : out std_logic                                        -- ospi_write_sig
		);
	end component test_programm;

	u0 : component test_programm
		port map (
			clk_clk                    => CONNECTED_TO_clk_clk,                    --       clk.clk
			reset_reset_n              => CONNECTED_TO_reset_reset_n,              --     reset.reset_n
			spislave0_ispi_in          => CONNECTED_TO_spislave0_ispi_in,          -- spislave0.ispi_in
			spislave0_ispi_send_byte   => CONNECTED_TO_spislave0_ispi_send_byte,   --          .ispi_send_byte
			spislave0_ispi_ss_n        => CONNECTED_TO_spislave0_ispi_ss_n,        --          .ispi_ss_n
			spislave0_ospi_inc_wraddr  => CONNECTED_TO_spislave0_ospi_inc_wraddr,  --          .ospi_inc_wraddr
			spislave0_ospi_out         => CONNECTED_TO_spislave0_ospi_out,         --          .ospi_out
			spislave0_ospi_periph_slct => CONNECTED_TO_spislave0_ospi_periph_slct, --          .ospi_periph_slct
			spislave0_ospi_rcv_byte    => CONNECTED_TO_spislave0_ospi_rcv_byte,    --          .ospi_rcv_byte
			spislave0_ospi_rcv_cmd     => CONNECTED_TO_spislave0_ospi_rcv_cmd,     --          .ospi_rcv_cmd
			spislave0_ospi_write_sig   => CONNECTED_TO_spislave0_ospi_write_sig    --          .ospi_write_sig
		);

