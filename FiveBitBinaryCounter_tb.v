`timescale 1ns/100ps
module FiveBitBinaryCounter_tb;
	
	reg clk;
	reg reset_n;
	
	wire [3:0] Q;
	
	initial begin 
	
	clk <= 1'b1;
	reset_n <= 1'b1;
	
	end
	
	always begin
		#10;
		clk <= !clk;
	end
	
	FiveBitBinaryCounter dut(
		clk,
		reset_n,
		Q
	);

endmodule