module ptp_sync ( 
	input clock,
	input reset,

	// this is for the avalon interface
	/*input [15:0] avalon_slave_address,
	input avalon_slave_write,
	input signed [31:0] avalon_slave_writedata,
	input avalon_slave_read,
	output signed [31:0] avalon_slave_readdata,
	output avalon_slave_waitrequest,*/
	
	input ext_enable,
	
	output us_interface_out,
	input us_inteface_in,
	output [31:0] travel_time_slave,
	output [31:0] travel_time_master,
	
	output slave_clk_data,
	output master_clk_data,
	input enable_mode
);
//set config parameter
parameter trigger_impluse= 2;
parameter clk_cycles = 2000; //40kHz = 25us  .... 25us/20ns = 1250  .... with buffer  = 2000

reg enable_time_sync_mode;
reg enable_master;

wire ptp_slave_clk;
wire ptp_master_clk;
wire ptp_reset;

assign ptp_slave_clk = (~ enable_master) & clock & enable_time_sync_mode;
assign ptp_master_clk = enable_master  & clock  & enable_time_sync_mode;
assign ptp_master_reset = ~enable_master ;

assign slave_clk_data =  (~ enable_master) & clock & enable_time_sync_mode;
assign master_clk_data =   enable_master& clock & enable_time_sync_mode;

wire [31:0] startsync_cnt;
wire [31:0] travel_time_cnt_master;
wire [31:0] travel_time_cnt_slave;

wire output_interface0;
wire output_interface1;

assign us_interface_out = output_interface0 | output_interface1;

assign travel_time_slave = travel_time_cnt_slave[31:0];
assign travel_time_master = travel_time_cnt_master[31:0];


//select mode
//.......

PTP_master ptpmaster0(ptp_master_clk,reset, us_inteface_in, output_interface0,startsync_cnt, travel_time_cnt_master);
PTP_slave ptpslave0(ptp_slave_clk,reset, us_inteface_in, output_interface1, travel_time_cnt_slave);

always @(posedge ext_enable, posedge reset) begin  //TODO add ptp_reset 
	if (reset == 1) begin
		enable_master 	<= 0;	
		enable_time_sync_mode 	<= 0;
	end else begin
		enable_master <= ext_enable;
		enable_time_sync_mode <=enable_mode;
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




/*
module ptp_sync ( 
	input clock,
	input reset,

	// this is for the avalon interface
	input [15:0] avalon_slave_address,
	input avalon_slave_write,
	input signed [31:0] avalon_slave_writedata,
	input avalon_slave_read,
	output signed [31:0] avalon_slave_readdata,
	output avalon_slave_waitrequest,
	
	output US_interface_out,
	input US_inteface_in
);


*/

module us_ptp_tb();

	reg clock, reset;

	wire US_interface_out;
	reg US_inteface_in;
	reg ext_enable;
	
	reg enable_mode;
	
	wire [31:0] travel_time_slave;
	wire [31:0] travel_time_master;
	
	wire slave_clk_data, master_clk_data;
	
	parameter sim_delay = 10;
	
	ptp_sync DUT(clock, reset,  ext_enable, US_interface_out, US_inteface_in, travel_time_slave,travel_time_master,slave_clk_data,master_clk_data,enable_mode);
	
	initial
	begin
		#(sim_delay) clock = 0; reset = 0; US_inteface_in=0;ext_enable =0;enable_mode=0;
		#(sim_delay) clock = 1; reset = 1;
		#(sim_delay) clock = 0; reset = 0; 
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;US_inteface_in= 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;US_inteface_in= 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;US_inteface_in= 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1; 
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;US_inteface_in= 0;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
	end

endmodule	



