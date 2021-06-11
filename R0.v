module R0(
	input clr, clk, R0in, busMuxOut);
	
wire BM_R0in;

Register register0(clr, clk, R0in, busMuxOut, BM_R0in);

/** assign **/

endmodule

