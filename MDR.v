`timescale 1ns/10ps
module MDR(
	input [31:0] BM_Out, Mdatain,
	input read, clr, clk, MDRin,
	output [31:0] Q
	);
 
		wire [31:0] wire1;
  
		MUX2 multiplexer(BM_Out, Mdatain, read, wire1);
		Register MDR(clr, clk, MDRin, wire1, Q);
		
endmodule
