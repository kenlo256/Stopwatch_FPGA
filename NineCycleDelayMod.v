module NineCycleDelayMod
(
	input CLK_100Hz,
	input reset_toggle,
	input reset_n,
	output final_reset_toggle
);
	wire [7:0] interWires;

	DTypeFF dtff0
	(
		CLK_100Hz,
		reset_toggle,
		reset_n,
		interWires[0]
	);
	
	DTypeFF dtff1
	(
		CLK_100Hz,
		interWires[0],
		reset_n,
		interWires[1]
	);
	
	DTypeFF dtff2
	(
		CLK_100Hz,
		interWires[1],
		reset_n,
		interWires[2]
	);
	
	DTypeFF dtff3
	(
		CLK_100Hz,
		interWires[2],
		reset_n,
		interWires[3]
	);
	
	DTypeFF dtff4
	(
		CLK_100Hz,
		interWires[3],
		reset_n,
		interWires[4]
	);
	
	DTypeFF dtff5
	(
		CLK_100Hz,
		interWires[4],
		reset_n,
		interWires[5]
	);
	
	DTypeFF dtff6
	(
		CLK_100Hz,
		interWires[5],
		reset_n,
		interWires[6]
	);
	
	DTypeFF dtff7
	(
		CLK_100Hz,
		interWires[6],
		reset_n,
		interWires[7]
	);
	
	DTypeFF dtff8
	(
		CLK_100Hz,
		interWires[7],
		reset_n,
		final_reset_toggle
	);
endmodule