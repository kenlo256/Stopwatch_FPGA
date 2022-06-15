module SRTypeFF(
	input S,
	input R,
	output Q,
	output InvQ
);
	nand(Q,S,InvQ);
	nand(InvQ,R,Q);
	
endmodule