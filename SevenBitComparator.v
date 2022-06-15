module SevenBitComparator(
	input [6:0]A,
	input [6:0]B,
	output out
);

	wire w0;
	wire w1;
	wire w2;
	wire w3;
	wire w4;
	wire w5;
	wire w6;
	
	xnor(w0, A[0],B[0]);
	xnor(w1, A[1],B[1]);
	xnor(w2, A[2],B[2]);
	xnor(w3, A[3],B[3]);
	xnor(w4, A[4],B[4]);
	xnor(w5, A[5],B[5]);
	xnor(w6, A[6],B[6]);

	and(out, w0, w1, w2, w3, w4, w5, w6);
	
endmodule