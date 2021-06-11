module registerzero(
	input clr, clk, R0in, BAout,
	input [31:0] busMuxOut,
	output[31:0] BM_R0in);
	
	wire[31:0] BM_R0in_temp;

	Register register0(clr, clk, R0in, busMuxOut, BM_R0in_temp);

	assign BM_R0in = ((BM_R0in_temp) & (~BAout));

endmodule

