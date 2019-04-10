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
	
	
reg enable_time_sync_mode;
reg enable_master;

wire ptp_slave_clk;
wire ptp_master_clk;

assign ptp_slave_clk 			= 	(~ enable_master) & clock & enable_time_sync_mode;
assign ptp_master_clk 		= 	enable_master  & clock  & enable_time_sync_mode;
assign ptp_master_reset 	= 	~enable_master ;

wire [31:0] startsync_cnt;
wire [31:0] travel_time_cnt_master;
wire [31:0] travel_time_cnt_slave;

wire output_interface0;
wire output_interface1;

assign us_interface_out 		= 	output_interface0 | output_interface1;

assign travel_time_slave 	= 	travel_time_cnt_slave[31:0];
assign travel_time_master = 	travel_time_cnt_master[31:0];


PTP_master ptpmaster0(ptp_master_clk,reset, us_inteface_in, output_interface0,startsync_cnt, travel_time_cnt_master);
PTP_slave ptpslave0(ptp_slave_clk,reset, us_inteface_in, output_interface1, travel_time_cnt_slave);
	
	
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
					8'h00: returnvalue 	<= travel_time_cnt_master[31:0];
					8'h01: returnvalue 	<= travel_time_cnt_slave[31:0];
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
			enable_master <= 0;
			enable_time_sync_mode <= 0;
		end else begin
			// if we are writing via avalon bus and waitrequest is deasserted, write the respective register
			if(avalon_slave_write && ~avalon_slave_waitrequest) begin
				case(avalon_slave_address>>8)
					8'h00: enable_master 						<= (avalon_slave_writedata!=0);
					8'h01: enable_time_sync_mode <= (avalon_slave_writedata!=0);
				endcase
			end
		end 
	end
	
endmodule
	


//time when started sync will always be 0
module PTP_slave(
	input clock,
	input reset,
	
	input input_interface,
	output output_interface,

	output [31:0] travel_time_cnt
);
	
	reg output_interface_reg;
	reg [31:0] travel_time_cnt_reg;
	assign output_interface = output_interface_reg;
	assign travel_time_cnt = travel_time_cnt_reg[31:0];
	
	reg [31:0] delay_cnt;
	
	reg waitflag_input;
	reg waitflag_output;
	reg startsync_flag;
	
	always @(posedge clock, posedge reset) begin : start_sync //TODO add ptp_reset 
		if (reset == 1) begin
			delay_cnt 								<= 32'd0;
			output_interface_reg 	<= 0;
			waitflag_input 					<= 0;
			waitflag_output 				<= 1;
			startsync_flag 					<= 0;
		end else begin
			output_interface_reg 	<= 0;
			delay_cnt 								<= delay_cnt + 32'd1;
			if(waitflag_output == 0) begin
					waitflag_output <= 1;
					waitflag_input 	<= 0;
					if(delay_cnt <= 20) begin
						output_interface_reg <= 1;
					end
					if(delay_cnt <= 50) begin
						waitflag_output <= 0;
						waitflag_input 	<= 1;
					end
			end else if (waitflag_input == 0) begin
					if(input_interface == 1) begin
							output_interface_reg 	<= 1;
							waitflag_output 				<= 0;
							waitflag_input 					<= 1;
							startsync_flag 					<= 1;
							if(startsync_flag == 0) begin
								delay_cnt 							<= 32'd0;
							end else begin
								startsync_flag 				<= 0;
								travel_time_cnt_reg <= delay_cnt[31:0];
								delay_cnt 							<= 32'd0;
							end
					end
			end
			
			if (delay_cnt == 4294967295) begin
				delay_cnt <= 32'd0;
			end	
		end
	end
	
endmodule 


module PTP_master(
	input clock,
	input reset,
	
	input input_interface,
	output output_interface,
	
	output [31:0] startsync_cnt,
	output [31:0] travel_time_cnt
);
	reg output_interface_reg;
	reg [31:0] travel_time_cnt_reg;
	assign output_interface = output_interface_reg;
	assign travel_time_cnt = travel_time_cnt_reg[31:0];

	reg [31:0] delay_cnt;
	
	reg waitflag_input;
	reg waitflag_output;
	
	always @(posedge clock, posedge reset) begin : start_sync //TODO add ptp_reset 
		if (reset == 1) begin
			delay_cnt 								<= 32'd0;
			output_interface_reg 	<= 0;
			waitflag_input 					<= 1;
			waitflag_output 				<= 0;
		end else begin
			output_interface_reg 	<= 0;
			delay_cnt <= delay_cnt + 32'd1;
			if(waitflag_output == 0) begin
				waitflag_output 		<= 1;
				waitflag_input 			<= 0;
				if(delay_cnt <= 2000) begin
					output_interface_reg <= 1;
				end
				if(delay_cnt <= 50) begin
					waitflag_output <= 0;
					waitflag_input 	<= 1;
				end
			end else if (waitflag_input == 0) begin
				if(input_interface == 1) begin
					output_interface_reg 	<= 1;
					waitflag_output 				<= 0;
					waitflag_input 					<= 1;
					travel_time_cnt_reg 	<= delay_cnt[31:0]; 
					delay_cnt 								<= 32'd0;
				end
			end
			
			if (delay_cnt == 4294967295) begin
				delay_cnt <= 32'd0;
			end	
		end
	end
endmodule 


	