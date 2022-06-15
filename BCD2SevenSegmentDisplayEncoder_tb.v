`timescale 1 ns/100 ps

module BCD2SevenSegmentDisplayEncoder_tb;

	reg[3:0] BCD;
	
	wire a;
	wire b;
	wire c;
	wire d;
	wire e;
	wire f;
	wire g;
	
	BCD2SevenSegmentDisplayEncoder dut(
		BCD,
		a,
		b,
		c,
		d,
		e,
		f,
		g
	);
	
	integer i;
	
	initial begin
		$display("BCD a b c d e f g");
		for( i = 0; i < 11; i = i + 1)
		begin
		
			BCD = i;
			$display("%i %i %i %i %i %i %i %i",i,a,b,c,d,e,f,g);
			#10;
			
		end
		$stop;
	end
	
endmodule
		