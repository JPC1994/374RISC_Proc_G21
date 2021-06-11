module IR(
	input clr, clk, IRin, 
	input [31:0] BusMuxOut,
	input Gra, Grb, Grc, Rin, Rout, BAout,
	output [31:0] C_sign_extended,
	output R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
	output R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out);

wire [31:0] connector;

Register IR(clr, clk, IRin, BusMuxOut, connector);

// call select encode

endmodule
