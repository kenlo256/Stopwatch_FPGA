module StopwatchCounter(
	input CLK_100Hz,
	input reset_n,
	output [6:0] stopwatch_unit_mins,
	output [5:0] stopwatch_unit_secs,
	output [6:0] stopwatch_unit_decs,
	output reg stopwatch_overflow
);

	wire [6:0] tenmillisecCounter;
	wire [6:0] ninedecsCounter;
	
	wire ten_millisec_counter_toggle;
	wire ten_millisec_counter_inter_toggle;
	wire ten_millisec_counter_one_cycle_toggle;
	
	wire decs_counter_toggle;
	wire decs_reset_toggle;
	
	wire ninedecs_counter_toggle;
	wire ninedecs_reset_toggle;
	wire ninedecs_reset_one_cycle_toggle;
	
	wire secs_counter_toggle;
	wire secs_reset_toggle;
	wire secs_counter_inter0_toggle;
	wire secs_counter_inter1_toggle;
	wire secs_counter_final_toggle;
	
	wire set_min_counter;
	wire mins_counter_toggle;
	wire mins_reset_toggle;
	wire mins_counter_final_toggle;
	
	reg reset_millisec_counter;
	reg reset_decs_counter;
	reg reset_ninedecs_counter;
	reg reset_secs_counter;
	reg reset_mins_counter;
	
	SevenBitBinaryCounter sbbc0
	(
		CLK_100Hz,
		reset_millisec_counter,
		tenmillisecCounter
	);
	
	SevenBitComparator sbc0
	(
		tenmillisecCounter,
		7'b0001000,
		ten_millisec_counter_toggle
	);
	
	DTypeFF dtff0
	(
		CLK_100Hz,
		ten_millisec_counter_toggle,
		reset_n,
		ten_millisec_counter_inter_toggle
	);
	
	DTypeFF dtff1
	(
		CLK_100Hz,
		ten_millisec_counter_inter_toggle,
		reset_n,
		ten_millisec_counter_one_cycle_toggle
	);
	
	SevenBitBinaryCounter sbbc1
	(
		ten_millisec_counter_one_cycle_toggle,
		reset_decs_counter,
		stopwatch_unit_decs
	);
	
	SevenBitComparator sbc1
	(
		stopwatch_unit_decs,
		7'b1100011,
		decs_counter_toggle
	);
	
	NineCycleDelayMod ncdm0
	(
		CLK_100Hz,
		decs_counter_toggle,
		reset_n,
		decs_reset_toggle
	);
	
	SevenBitBinaryCounter sbbc2
	(
		ten_millisec_counter_one_cycle_toggle,
		reset_ninedecs_counter,
		ninedecsCounter
	);
	
	SevenBitComparator sbc2
	(
		ninedecsCounter,
		7'b0001001,
		ninedecs_counter_toggle
	);
	
	NineCycleDelayMod ncdm1
	(
		CLK_100Hz,
		ninedecs_counter_toggle,
		reset_n,
		ninedecs_reset_toggle
	);
	
	DTypeFF dtff2
	(
		CLK_100Hz,
		ninedecs_reset_toggle,
		reset_n,
		ninedecs_reset_one_cycle_toggle
	);
	
	SixBitBinaryCounter sbbc3
	(
		ninedecs_reset_one_cycle_toggle,
		reset_secs_counter,
		stopwatch_unit_secs
	);
	
	SixBitComparator sbc3
	(
		stopwatch_unit_secs,
		6'b111011,
		secs_counter_toggle
	);
	
	NineCycleDelayMod ncdm2
	(
		CLK_100Hz,
		secs_counter_toggle,
		reset_n,
		secs_counter_inter0_toggle
	);
	
	NineCycleDelayMod ncdm3
	(
		ten_millisec_counter_one_cycle_toggle,
		secs_counter_inter0_toggle,
		reset_n,
		secs_counter_inter1_toggle
	);
	
	NineCycleDelayMod ncdm4
	(
		CLK_100Hz,
		secs_counter_inter1_toggle,
		reset_n,
		secs_counter_final_toggle
	);
	
	DTypeFF dtff3
	(
		CLK_100Hz,
		secs_counter_final_toggle,
		reset_n,
		set_min_counter
	);
	
	SevenBitBinaryCounter sbbc4
	(
		set_min_counter,
		reset_mins_counter,
		stopwatch_unit_mins
	);
	
	SevenBitComparator sbc4
	(
		stopwatch_unit_mins,
		7'b1100011,
		mins_counter_toggle                                                                                                                                                                                                               
	);
	
	DTypeFF dtff4
	(
		secs_counter_toggle&decs_reset_toggle,
		mins_counter_toggle,
		reset_n,
		mins_counter_final_toggle
	);
	
	always @(posedge CLK_100Hz) begin
		reset_millisec_counter <= !ten_millisec_counter_toggle & reset_n;
		reset_decs_counter <= !decs_reset_toggle & reset_n;
		reset_ninedecs_counter <= !ninedecs_reset_toggle & reset_n;
		reset_secs_counter <= !secs_counter_final_toggle & reset_n;
		reset_mins_counter <= !mins_counter_final_toggle & reset_n;
		stopwatch_overflow <= decs_reset_toggle & secs_counter_final_toggle & mins_counter_final_toggle;
	end
	
endmodule
