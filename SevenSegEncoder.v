module SevenSegEncoder(
	input [6:0] stopwatch_unit_mins,
	input [5:0] stopwatch_unit_secs,
	input [6:0] stopwatch_unit_decs,
	output [7:0] hex_10_mins,
	output [7:0] hex_1_min,
	output [7:0] hex_10_secs,
	output [7:0] hex_1_sec,
	output [7:0] hex_hundredths,
	output [7:0] hex_tenths
);
	wire [11:0] mins_BCDOut;
	wire [11:0] secs_BCDOut;
	wire [11:0] decs_BCDOut;
	
	BCDEncoder bcd0
	(
		{1'b0,stopwatch_unit_mins},
		mins_BCDOut
	);

	BCDEncoder bcd1
	(
		{2'b00,stopwatch_unit_secs},
		secs_BCDOut
	);
	
	BCDEncoder bcd2
	(
		{1'b0,stopwatch_unit_decs},
		decs_BCDOut
	);
	
	BCD2SevenSegmentDisplayEncoder b2ssde1(
		mins_BCDOut[3:0],
		hex_1_min[0],
		hex_1_min[1],
		hex_1_min[2],
		hex_1_min[3],
		hex_1_min[4],
		hex_1_min[5],
		hex_1_min[6]
	);
	
	assign hex_1_min[7] = 1'b0;
	
	BCD2SevenSegmentDisplayEncoder b2ssde2(
		mins_BCDOut[7:4],
		hex_10_mins[0],
		hex_10_mins[1],
		hex_10_mins[2],
		hex_10_mins[3],
		hex_10_mins[4],
		hex_10_mins[5],
		hex_10_mins[6]
	);
	
	assign hex_10_mins[7] = 1'b0;
	
	BCD2SevenSegmentDisplayEncoder b2ssde3(
		secs_BCDOut[3:0],
		hex_1_sec[0],
		hex_1_sec[1],
		hex_1_sec[2],
		hex_1_sec[3],
		hex_1_sec[4],
		hex_1_sec[5],
		hex_1_sec[6]
	);
	
	assign hex_1_sec[7] = 1'b0;
	
	BCD2SevenSegmentDisplayEncoder b2ssde4(
		secs_BCDOut[7:4],
		hex_10_secs[0],
		hex_10_secs[1],
		hex_10_secs[2],
		hex_10_secs[3],
		hex_10_secs[4],
		hex_10_secs[5],
		hex_10_secs[6]
	);
	
	assign hex_10_secs[7] =1'b0;
	
	BCD2SevenSegmentDisplayEncoder b2ssde5(
		decs_BCDOut[3:0],
		hex_tenths[0],
		hex_tenths[1],
		hex_tenths[2],
		hex_tenths[3],
		hex_tenths[4],
		hex_tenths[5],
		hex_tenths[6]
	);
	
	assign hex_tenths[7] = 1'b0;
	
	BCD2SevenSegmentDisplayEncoder b2ssde6(
		decs_BCDOut[7:4],
		hex_hundredths[0],
		hex_hundredths[1],
		hex_hundredths[2],
		hex_hundredths[3],
		hex_hundredths[4],
		hex_hundredths[5],
		hex_hundredths[6]
	);
	
	assign hex_hundredths[7] =1'b0;
	
	
endmodule
