// File Name: selectNencode.v
`timescale 1ns/10ps
module selectNencode(
	input [31:0] Connect_Encode,
	input Gra, Grb, Grc, Rout, BAout, Rin,
	output R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	output R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
	output [31:0] C_sign_extended
	);
	
	wire [3:0] Ra = Connect_Encode[26:23];
	wire [3:0] Rb = Connect_Encode[22:19];
	wire [3:0] Rc = Connect_Encode[18:15];
	wire [3:0] tmpA, tmpB, tmpC, decoderIn;
	wire d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15;
	wire tmpOut;
	
	AND_4 and1(Ra,Gra,tmpA);
	AND_4 and2(Rb,Grb,tmpB);
	AND_4 and3(Rc,Grc,tmpC);
	
	OR_4_3In or1(tmpA, tmpB, tmpC, decoderIn);
	
	Decoder4to16 decoder416(decoderIn,d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15);
	
	//generate R-n-in signals
	and (R0in, Rin, d0);
	and (R1in, Rin, d1);
	and (R2in, Rin, d2);
	and (R3in, Rin, d3);
	and (R4in, Rin, d4);
	and (R5in, Rin, d5);
	and (R6in, Rin, d6);
	and (R7in, Rin, d7);
	and (R8in, Rin, d8);
	and (R9in, Rin, d9);
	and (R10in, Rin, d10);
	and (R11in, Rin, d11);
	and (R12in, Rin, d12);
	and (R13in, Rin, d13);
	and (R14in, Rin, d14);
	and (R15in, Rin, d15);
	
	//generate R-n-out signals
	or (tmpOut, Rout, BAout);
	and (R0out, tmpOut, d0);
	and (R1out, tmpOut, d1);
	and (R2out, tmpOut, d2);
	and (R3out, tmpOut, d3);
	and (R4out, tmpOut, d4);
	and (R5out, tmpOut, d5);
	and (R6out, tmpOut, d6);
	and (R7out, tmpOut, d7);
	and (R8out, tmpOut, d8);
	and (R9out, tmpOut, d9);
	and (R10out, tmpOut, d10);
	and (R11out, tmpOut, d11);
	and (R12out, tmpOut, d12);
	and (R13out, tmpOut, d13);
	and (R14out, tmpOut, d14);
	and (R15out, tmpOut, d15);
	
	assign C_sign_extended = (Connect_Encode[9] == 1) ? {23'b11111111111111111111111, Connect_Encode[9:0]} : {23'b00000000000000000000000, Connect_Encode[9:0]};

endmodule
