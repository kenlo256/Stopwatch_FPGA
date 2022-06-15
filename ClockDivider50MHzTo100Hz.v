module ClockDivider50MHzTo100Hz (
	input CLK_50_MHz,
	input reset_n,
	output reg CLK_100Hz
);
	wire [18:0] counterValue;
	wire Q;
	reg reset;
	wire toggle;
	wire toggle_a_cycle;
	
	FiveBitBinaryCounter fbbc0
	(
		CLK_50_MHz,
		reset,
		{counterValue[4],counterValue[3],counterValue[2],counterValue[1],counterValue[0]}
	);
	
	FiveBitBinaryCounter fbbc1
	(
		!counterValue[4],
		reset,
		{counterValue[9],counterValue[8],counterValue[7],counterValue[6],counterValue[5]}
	);
	
	FiveBitBinaryCounter fbbc2
	(
		!counterValue[9],
		reset,
		{counterValue[14],counterValue[13],counterValue[12],counterValue[11],counterValue[10]}
	);
	
	FourBitBinaryCounter fbbc3
	(
		!counterValue[14],
		reset,
		{counterValue[18],counterValue[17],counterValue[16],counterValue[15]}
	);

	Comparator c0
	(
		counterValue,
		19'b0111101000010001110,
		toggle
	);
	
	DTypeFF dtff0
	(
		CLK_50_MHz,
		toggle,
		reset_n,
		toggle_a_cycle
	);
	
	JKTypeFF jkff0
	(
		toggle_a_cycle,
		1'b1,
		1'b1,
		Q
	);
	
	always @(posedge CLK_50_MHz) begin
		reset <= !toggle & reset_n;
		CLK_100Hz <= Q;
	end

endmodule

		