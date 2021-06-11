module MAR(
	input [32:0] buxMuxOut,
	input MARin, clk, clr);
	
	wire [31:0] wire1;
	
	Register MAR(clr, clk, MARin, wire1, out1);

endmodule
