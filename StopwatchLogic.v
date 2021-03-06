module StopwatchLogic(
	input CLK_100Hz,
	input reset_n,
	input start_stop,
	input hold,
	output [6:0] stopwatch_unit_mins,
	output [5:0] stopwatch_unit_secs,
	output [6:0] stopwatch_unit_decs,
	output reg stopwatch_overflow
);
	wire overflow;
	wire controlled_clk;
	wire controlled_clk0;
	wire controlled_clk1;
	
	//counter part
	StopwatchCounter sc0(
		controlled_clk, 
		reset_n, 
		stopwatch_unit_mins, 
		stopwatch_unit_secs,
		stopwatch_unit_decs,
		overflow
	);
	
	//start_stop part
	wire orOut0;
	wire orOut1;
	
	wire Q_JK;
	wire Q_SR0;
	wire Q_SR1;
	wire buffer;
	NegEdgeJKTypeFF jkff0
	(
		start_stop,
		1'b1,
		1'b1,
		Q_JK
	);
	
	assign orOut0 = CLK_100Hz | !Q_JK;
	assign orOut1 = !CLK_100Hz | !Q_JK;
	
	SRTypeFF srtff0
	(
		orOut0,
		orOut1,
		Q_SR0,
		controlled_clk0
	);
	//hold part
	
	assign orOut2 = CLK_100Hz | !hold;
	assign orOut3 = !CLK_100Hz | !hold;
	
	SRTypeFF srtff1
	(
		orOut2,
		orOut3,
		Q_SR1,
		controlled_clk1
	);
	
	assign controlled_clk = (controlled_clk0 & !Q_JK) | (controlled_clk1 & hold);
	
	always @(posedge CLK_100Hz) begin
		stopwatch_overflow <= overflow;
	end
endmodule
