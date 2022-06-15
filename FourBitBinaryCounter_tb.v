`timescale 1ns/100ps
module FourBitBinaryCounter_tb;
	
	reg clk;
	reg reset_n;
	
	wire [3:0] Q;
	
	initial begin 
		clk <= 1'b1 ;
		reset_n <= 1'b1;
		#80;
		reset_n <= 1'b0;
		#1;
		reset_n <= 1'b1;
	end
	
	always begin
	
	#10;
	clk <= !clk;
	
	end
	
	FourBitBinaryCounter dut(
		clk,
		reset_n,
		Q
	);

endmodule