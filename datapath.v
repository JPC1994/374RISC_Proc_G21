`timescale 1ns/10ps
module datapath(
	input clk, clr
	);

wire HIout, LOout, Zhighout, Zlowout, PCout, MDRout, MARout, In_Portout, Cout;
wire RAMin, HIin, LOin, Zhighin, Zlowin, Zin, PCin, MDRin, In_Port, Out_Port, Cin, IRin, MARin, Yin, incPC;

wire [3:0] opCode;

wire Gra, Grb, Grc, Rout, BAout, Rin, CONin, read, write;

wire [31:0] BM_R0in, BM_R1in, BM_R2in, BM_R3in, BM_R4in, BM_R5in, BM_R6in;
wire [31:0] BM_R7in, BM_R8in, BM_R9in, BM_R10in, BM_R11in;
wire [31:0] BM_R12in, BM_R13in, BM_R14in, BM_R15in;
wire [31:0] BM_HIin, BM_LOin, BM_In_Portin, BM_Out_Portin, BM_PCin;
wire [31:0] BM_Zhighin, BM_Zlowin, BM_IRin, BM_MDRin, BM_MARin, BM_Csignextended, Connect_Encode, BM_Yin;
wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in;
wire R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;


wire [31:0] zlow, zhigh;
wire [31:0] Mdatain;

wire [31:0] MARwire;

wire CONout;

wire [31:0] busMuxOut, Csignextended;
wire [4:0] S;

wire stop, reset;

// PCin CONFF logic
wire temp, PCin1;

and (temp, PCCON, CONout);
or (PCin1, PCin, temp);

// registers
// Register R0 (clr, clk, R0in, busMuxOut, BM_R0in);
registerzero R01 (clr, clk, R0in, BAout, busMuxOut, BM_R0in);

Register R1 (clr, clk, R1in, busMuxOut, BM_R1in);
Register R2 (clr, clk, R2in, busMuxOut, BM_R2in);
Register R3 (clr, clk, R3in, busMuxOut, BM_R3in);
Register R4 (clr, clk, R4in, busMuxOut, BM_R4in); 
Register R5 (clr, clk, R5in, busMuxOut, BM_R5in);
Register R6 (clr, clk, R6in, busMuxOut, BM_R6in);
Register R7 (clr, clk, R7in, busMuxOut, BM_R7in);
Register R8 (clr, clk, R8in, busMuxOut, BM_R8in);
Register R9 (clr, clk, R9in, busMuxOut, BM_R9in);
Register R10 (clr, clk, R10in, busMuxOut, BM_R10in);
Register R11 (clr, clk, R11in, busMuxOut, BM_R11in);
Register R12 (clr, clk, R12in, busMuxOut, BM_R12in);
Register R13 (clr, clk, R13in, busMuxOut, BM_R13in);
Register R14 (clr, clk, R14in, busMuxOut, BM_R14in);
Register R15 (clr, clk, R15in, busMuxOut, BM_R15in);
// Register PC(clr, clk, PCin, busMuxOut, BM_PCin);
Register HI(clr, clk, HIin, busMuxOut, BM_HIin);
Register LO(clr, clk, LOin, busMuxOut, BM_LOin);

Register Input(clr, clk, In_Port, busMuxOut, BM_In_Portin); // preload input
Register Output(clr, clk, Out_Port, busMuxOut, BM_Out_Portin);


Register z_high(clr, clk, Zhighin, zhigh, BM_Zhighin);
Register z_low(clr, clk, Zlowin, zlow, BM_Zlowin);
Register Y(clr, clk, Yin, busMuxOut, BM_Yin);
Register C(clr, clk, Cin, Csignextended, BM_Csignextended);

pcounter PC1(clr, clk, PCin1, busMuxOut, BM_PCin, incPC);

Register IR(clr, clk, IRin, busMuxOut, Connect_Encode); // IR register

Register MAR(clr, clk, MARin, busMuxOut, BM_MARin); // MAR register


// selectNencode
selectNencode SEL_ENC(Connect_Encode, Gra, Grb, Grc, Rout, BAout, Rin,
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
	Csignextended);

	
ram ram_inst (BM_MARin[8:0], clk, BM_MDRin, write, Mdatain);
	
// RAM1 rammy(BM_MARin[8:0], BM_MDRin, read, write, Mdatain);
	

// MDR
MDR MDR1(busMuxOut, Mdatain, read, clr, clk, MDRin, BM_MDRin);

// ALU
ALU ALU1(BM_Yin, busMuxOut, opCode, zlow, zhigh);

// CON_FF
CON_FF_32 CONFF1(CONout, busMuxOut, CONin, Connect_Encode[20:19], clk);
	

// busMux
BusMux BusMux1(R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, 
	R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, MARout, In_Portout, Cout,
	BM_R0in, BM_R1in, BM_R2in, BM_R3in, BM_R4in, BM_R5in, 
	BM_R6in, BM_R7in, BM_R8in, BM_R9in, BM_R10in, BM_R11in, 
	BM_R12in, BM_R13in, BM_R14in, BM_R15in, BM_HIin, BM_LOin, 
	BM_Zhighin, BM_Zlowin, BM_PCin, BM_MDRin, BM_MARin, BM_In_Portin, BM_Csignextended, 
	busMuxOut);
	
control_unit controlly(HIout, LOout, Zhighout, Zlowout, PCout, MDRout, MARout, In_Portout, Cout, RAMin,
	HIin, LOin, Zhighin, Zlowin, Zin, PCin, MDRin, In_Port, Out_Port, Cin, IRin, MARin, Yin, incPC, MDRread, PCCON, opCode, 
	Gra, Grb, Grc, Rout, BAout, Rin,
	CONin,
	read, write, Connect_Encode, clk, reset, stop, CONout);


endmodule
