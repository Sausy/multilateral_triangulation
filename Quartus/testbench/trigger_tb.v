module trigger_tb ( 
	input clock,
	input reset,
	input trigger,
	input [31:0] time_cnt,
	output [31:0] time_stamp_US_out,
	output enable_IO
); 
	//IO_time_ctl
	reg [31:0] ret_val;
	reg ret_val_IO;
	reg [31:0] dealy_cnt;
	
	always @(posedge clock) begin
		if (reset) begin
			  ret_val <= 32'd0;
			  dealy_cnt <= 32'd0;
			  ret_val_IO <= 0;
		end else begin
			if(trigger == 1) begin
				if(dealy_cnt < 1)begin
					ret_val_IO <= 1;
					ret_val = time_cnt;
					dealy_cnt <= dealy_cnt + 32'd1;
				end else begin
					dealy_cnt <= dealy_cnt + 32'd1;
				end
			end else begin
				ret_val_IO <= 0;
				dealy_cnt <= 32'd0;
			end
		end
	end
	
	assign enable_IO = ret_val_IO;
	assign time_stamp_US_out = ret_val;
endmodule


module trigger_tb_();

	reg clock, reset, trigger;
	reg [31:0] time_cnt;
	wire [31:0] time_stamp_US_out;
	wire enable_IO;
	
	parameter sim_delay = 10;
	
	trigger_tb DUT(clock, reset, trigger, time_cnt, time_stamp_US_out, enable_IO);
	
	initial
	begin
		#(sim_delay) clock = 0; reset = 0; 
		#(sim_delay) clock = 1; reset = 1;
		#(sim_delay) clock = 0; reset = 0; time_cnt = 32'd0;
		#(sim_delay) clock = 1;time_cnt=32'd1;
		#(sim_delay) clock = 0;trigger = 1;
		#(sim_delay) clock = 1;time_cnt=32'd2;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;time_cnt=32'd3;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;time_cnt=32'd4;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;time_cnt=32'd5;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;time_cnt=32'd6;
		#(sim_delay) clock = 0;trigger = 0;
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