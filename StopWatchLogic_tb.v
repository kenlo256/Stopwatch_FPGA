`timescale 1ns/100ps
module StopWatchLogic_tb;
	reg CLK_100Hz;
	reg reset_n;
	reg start_stop;
	reg hold;

	wire [6:0] stopwatch_unit_mins;
	wire [5:0] stopwatch_unit_secs;
	wire [6:0] stopwatch_unit_decs;
	wire stopwatch_overflow;
	
	initial begin
		CLK_100Hz <= 1'b1;
		reset_n <= 1'b1;
		
		hold <= 1;
		reset_n <= 1;
		start_stop <= 1;
		#100000000;
		start_stop <= 0;
		#100000000;
		start_stop <= 1;
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		start_stop <= 0;
		#100000000;
		start_stop <= 1;
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		start_stop <= 0;
		#100000000;
		start_stop <= 1;
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;		
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		hold <= 1'b0;
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		hold <= 1'b1;
		
		#100000000;
		reset_n <= 1'b0;
		#100000000;
		reset_n <= 1'b1;
	end
	
	always begin
	
		#5000000;
		CLK_100Hz <= !CLK_100Hz;
		
	end
	
	StopwatchLogic dut 
	(
		CLK_100Hz,
		reset_n,
		start_stop,
		hold,
		stopwatch_unit_mins,
		stopwatch_unit_secs,
		stopwatch_unit_decs,
		stopwatch_overflow
	);
endmodule