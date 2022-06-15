module BCD2SevenSegmentDisplayEncoder(
	input [0:3]BCD,
	output a,
	output b,
	output c,
	output d,
	output e,
	output f,
	output g
);
	assign a = ~((~BCD[1]&~BCD[2]&~BCD[3])|BCD[0]|(BCD[1]&BCD[3])|(~BCD[0]&~BCD[1]&BCD[2])|BCD[2]);
	assign b = ~((~BCD[2]&~BCD[3])|~BCD[1]|(BCD[2]&BCD[3]));
	assign c = ~(~BCD[2]|(BCD[2]&BCD[3])|BCD[1]|(BCD[0]&~BCD[1]));
	assign d = ~((~BCD[1]&~BCD[2]&~BCD[3])|(BCD[1]&!BCD[2]&BCD[3])|(~BCD[0]&~BCD[1]&BCD[2])|(BCD[2]&~BCD[3])|BCD[0]);
	assign e = ~((~BCD[1]&~BCD[2]&~BCD[3])|(BCD[2]&~BCD[3]));
	assign f = ~(BCD[0]|(~BCD[2]&~BCD[3])|(~BCD[0]&BCD[1]&~BCD[2])|(~BCD[0]&BCD[1]&~BCD[3]));
	assign g = ~(BCD[0]|(BCD[2]&~BCD[3])|(BCD[1]&~BCD[2])|(~BCD[0]&~BCD[1]&BCD[2]));
endmodule