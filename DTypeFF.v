module DTypeFF(
	input clk,
	input D,
	input reset_n,
   output reg Q
);
	initial begin
		Q = 1'b1;
	end
	
	always @ (posedge clk or negedge reset_n)
	begin
		if(reset_n == 1'b0) begin
			Q <= 1'b0;
		end
		else begin
			Q <= D;
		end	
	end
	
endmodule