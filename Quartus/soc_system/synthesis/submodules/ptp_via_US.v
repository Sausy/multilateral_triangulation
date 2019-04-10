	module ptp_sync(
		input 	clock,
		input 	reset,
		
		// this is for the avalon interface
		input [15:0] 							avalon_slave_address,
		input 											avalon_slave_write,
		input signed 	[31:0] 	avalon_slave_writedata,
		input 											avalon_slave_read,
		output signed  [31:0] 	avalon_slave_readdata,
		output 										avalon_slave_waitrequest,
		
		//piezo interface
		output  	piezo_interface_out,
		input 		piezo_interface_in
	);
	
	endmodule
	