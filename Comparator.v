module Comparator(
	input [18:0]A,
	input [18:0]B,
	output out
);

	wire w0;
	wire w1;
	wire w2;
	wire w3;
	wire w4;
	wire w5;
	wire w6;
	wire w7;
	wire w8;
	wire w9;
	wire w10;
	wire w11;
	wire w12;
	wire w13;
	wire w14;
	wire w15;
	wire w16;
	wire w17;
	wire w18;
	
	xnor(w0, A[0],B[0]);
	xnor(w1, A[1],B[1]);
	xnor(w2, A[2],B[2]);
	xnor(w3, A[3],B[3]);
	xnor(w4, A[4],B[4]);
	xnor(w5, A[5],B[5]);
	xnor(w6, A[6],B[6]);
	xnor(w7, A[7],B[7]);
	xnor(w8, A[8],B[8]);
	xnor(w9, A[9],B[9]);
	xnor(w10, A[10],B[10]);
	xnor(w11, A[11],B[11]);
	xnor(w12, A[12],B[12]);
	xnor(w13, A[13],B[13]);
	xnor(w14, A[14],B[14]);
	xnor(w15, A[15],B[15]);
	xnor(w16, A[16],B[16]);
	xnor(w17, A[17],B[17]);
	xnor(w18, A[18],B[18]);

	and(out, w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18);	
endmodule