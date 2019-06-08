`define MAX_WAIT_CYCLES 50000000 //50Mhz clk -> 50M cycles for one sec
`define  INIT_WAIT_DELAY 5//5000;
`define  WAIT_DELAY 7//7000;
`define  CONV_CYCLES 2
module assign_tb(
		input 	clock,
		input 	reset,
		
		inout         bMKR_AREF,
		inout  [6:0]  bMKR_A,
		inout  [14:0] bMKR_D,
		
		input enable
);
	
wire [31:0] wSAM_PIN_OUT;

assign {bMKR_D,bMKR_A,bMKR_AREF} = wSAM_PIN_OUT;

genvar i;
generate

for (i=0;i<31;i++) begin : genloop
assign wSAM_PIN_OUT[i] =  (enable==1) ?
									 (i==15) ? 1'b1 :  1'bz : 0; //wSAM_PIN_OUT 31(start pos) - [(15bit+7bit+1bit)-1] + 6(position)
/*                          (wSAM_PIO_MSEL[i*2+1-:2] ==3) ? wSAM_OUT3[i] :0;*/
end
endgenerate
	
endmodule
	
	
//==================

module tb_();
		
		//==============================
		reg 	clock;
		reg 	reset;
		
		//pin def
		reg rAREF;
		reg [6:0] rMKR_A;
		reg [14:0] rMKR_D;
		reg enable;
		wire wAREF;
		wire [6:0] wMKR_A;
		wire [14:0] wMKR_D;
		//==============================
		
	wire [31:0] wSAM_PIN_OUT;
	assign wMKR_A = rMKR_A;
	//assign wSAM_PIN_OUT={
	
	parameter sim_delay = 5;
	
	assign_tb DUT(
				.clock 			(clock),
				.reset			(reset),
				.bMKR_AREF,		(wAREF),
				.bMKR_A,			(wMKR_A),
				.bMKR_D,			(wMKR_D),
				.enable			(enable)
	);
	
	//inout  [6:0]  bMKR_A,
	//inout  [14:0] bMKR_D,
		

	initial
	begin
		#(sim_delay) clock = 0; reset = 0; enable== 0;
		#(sim_delay) clock = 1; reset = 1;
		#(sim_delay) clock = 0; reset = 0;
		#(sim_delay) clock = 1;	
		#(sim_delay) clock = 0; 
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;
		#(sim_delay) clock = 1;
		#(sim_delay) clock = 0;enable== 1;
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


	end

endmodule	
