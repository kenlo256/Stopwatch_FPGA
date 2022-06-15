module FiveBitBinaryCounter(
	input clk,
	input reset_n,
	output [4:0]Q
);
	wire [4:0]InvQ;
	assign InvQ = ~Q;
	
	DTypeFF dtff0(
		clk,
		InvQ[0],
		reset_n,
		Q[0]
	);
	
	DTypeFF dtff1(
		InvQ[0],
		InvQ[1],
		reset_n,
		Q[1]
	);
	 
	DTypeFF dtff2(
		InvQ[1],
		InvQ[2],
		reset_n,
		Q[2]
	);
	
	DTypeFF dtff3(
		InvQ[2],
		InvQ[3],
		reset_n,
		Q[3]
	);
		
	DTypeFF dtff4(
		InvQ[3],
		InvQ[4],
		reset_n,
		Q[4]
	);

endmodule
		