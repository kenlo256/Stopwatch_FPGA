module NegEdgeJKTypeFF(
    input clk,
    input J,
    input K,
    output reg Q
);
	initial begin
		Q = 1'b0;
	end
	
	always @(negedge clk) begin
		case({K,J})
			
			2'b00 : Q = Q;
			2'b01 : Q = 1'b1;
			2'b10 : Q = 1'b0;
			2'b11 : Q = !Q;
			
		endcase
	end
endmodule
