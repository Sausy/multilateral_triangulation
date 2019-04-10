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
	
	
	
	// the following iterface handles read requests via lightweight axi bridge
	// the upper 8 bit of the read address define which value we want to read
	// the lower 8 bit of the read address define for which motor	
	reg avalon_slave_waitFlag;
	reg [31:0] returnvalue;
	assign avalon_slave_readdata = returnvalue;
	assign avalon_slave_waitrequest = (avalon_slave_waitFlag && avalon_slave_read);
	always @(posedge clock, posedge reset) begin: AVALON_READ_INTERFACE
		if (reset == 1) begin
			avalon_slave_waitFlag <= 1;
		end else begin
			avalon_slave_waitFlag <= 1;
			if(avalon_slave_read) begin
				case(avalon_slave_address>>8)
					8'h00: returnvalue <= time_cnt[31:0];
					8'h01: returnvalue <= rtc_trigger_data[31:0];
					8'h02: returnvalue <= US_output_time[31:0];
					//8'h04: returnvalue <= waitflag_status;
					default: returnvalue <= 32'hDEADBEEF;
				endcase
				if(avalon_slave_waitFlag==1) begin // next clock cycle the returnvalue should be ready
					avalon_slave_waitFlag <= 0;
				end
			end
		end
	end
	
	
	reg [1:0] write_delay_cnt;
	always @(posedge clock, posedge reset) begin: AVALON_WRITE_INTERFACE
		if (reset == 1) begin
			waitflag_trigger <= 0;
			time_cnt <= 0;
			write_delay_cnt <= 0;
		end else begin
			// if we are writing via avalon bus and waitrequest is deasserted, write the respective register
			time_cnt <= time_cnt + 32'd1; 
			write_delay_cnt <= write_delay_cnt + 2'd1;
			if (time_cnt == 4294967295) begin
				time_cnt <= 32'd0;
			end
			if (write_delay_cnt == 1) begin
				waitflag_trigger <= 0;
				write_delay_cnt <= 0;
			end
			if(avalon_slave_write && ~avalon_slave_waitrequest) begin
				case(avalon_slave_address>>8)
					8'h00: time_cnt <= avalon_slave_writedata[31:0];
					8'h02: waitflag_trigger <= (avalon_slave_writedata!=0);
					8'h03: US_out_trigger <= (avalon_slave_writedata!=0);
				endcase
			end
		end 
	end
	

	
	endmodule
	