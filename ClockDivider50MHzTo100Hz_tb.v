`timescale 1ns/100ps
module ClockDivider50MHzTo100Hz_tb;
	reg CLK_50_MHz;
	reg reset_n;
	wire CLK_100Hz;
	
	initial begin
	
		CLK_50_MHz = 1'b1;
		reset_n = 1'b1;
		
	end
	
	always begin
	
		#10;
		CLK_50_MHz <= !CLK_50_MHz;

	end
	
	ClockDivider50MHzTo100Hz dut(
		CLK_50_MHz,
		reset_n,
		CLK_100Hz
	);
	
endmodule
		