module Comparator_tb;
	reg [18:0]A;
	reg [18:0]B;
	
	wire out;
	
	integer i;
	reg C;
	initial
	begin
			for(i = 0; i < 256; i = i + 1)
			begin
				C = $urandom()%2;
				A = $urandom()%524288;
				
				if(C==1'b0) begin
					B = $urandom()%524288;
				end
				else begin
					B = A;
				end
				
				#10;
				
			end
	end
			
	Comparator dut
	(
		A,
		B,
		out
	);
endmodule