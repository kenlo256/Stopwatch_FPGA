`timescale 1 ns/100 ps

module SevenSegEncoder_tb;

	reg [6:0] stopwatch_unit_mins;
	reg [5:0] stopwatch_unit_secs;
	reg [6:0] stopwatch_unit_decs;
	wire [7:0] hex_10_mins;
	wire [7:0] hex_1_min;
	wire [7:0] hex_10_secs;
	wire [7:0] hex_1_sec;
	wire [7:0] hex_hundredths;
	wire [7:0] hex_tenths;
	
	SevenSegEncoder dut(
		stopwatch_unit_mins,
		stopwatch_unit_secs,
		stopwatch_unit_decs,
		hex_10_mins,
		hex_1_min,
		hex_10_secs,
		hex_1_sec,
		hex_hundredths,
		hex_tenths
	);
	

	integer i;
	
	initial begin
	$display("stopwatch_unit_mins stopwatch_unit_secs stopwatch_unit_decs hex_10_mins hex_1_min hex_10_secs hex_1_sec hex_hundredths hex_tenths");
	for( i = 0; i < 10; i = i + 1)
		begin
		
			stopwatch_unit_mins = $urandom_range(99);
			stopwatch_unit_secs = $urandom_range(59);
			stopwatch_unit_decs = $urandom_range(99);
			$display("%d %d %d %b %b %b %b %b %b",stopwatch_unit_mins,stopwatch_unit_secs,stopwatch_unit_decs,hex_10_mins,hex_1_min,hex_10_secs,hex_1_sec,hex_hundredths,hex_tenths);
			#10;
			
		end
	end
	
endmodule
		