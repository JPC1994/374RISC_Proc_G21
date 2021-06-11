`timescale 1ns/10ps
module MUX32(
// inputs
input [31:0] BM_R0in, BM_R1in, BM_R2in, BM_R3in, BM_R4in, BM_R5in, BM_R6in, BM_R7in, 
input [31:0] BM_R8in, BM_R9in, BM_R10in, BM_R11in, BM_R12in, BM_R13in, BM_R14in, BM_R15in,
input [31:0] BM_HIin, BM_LOin, BM_Zhighin, BM_Zlowin, 
input [31:0] BM_PCin, BM_MDRin, BM_In_Portin, BM_C_sign_extended, BM_MARin,

input [4:0] S, // 5 bit
output [31:0] BusMuxOut);

reg [31:0] temp;
 
always @* begin
	if(S == 0) 
		temp <= BM_R0in;
	
	else if(S == 1) 
		temp <= BM_R1in;
	
	else if(S == 2) 
		temp <= BM_R2in;
	
	else if(S == 3) 
		temp <= BM_R3in;
	
	else if(S == 4) 
		temp <= BM_R4in;
	
	else if(S == 5) 
		temp <= BM_R5in;
	
	else if(S == 6) 
		temp <= BM_R6in;
	
	else if(S == 7) 
		temp <= BM_R7in;
	
	else if(S == 8)  
		temp <= BM_R8in;
	
	else if(S == 9) 
		temp <= BM_R9in;
	
	else if(S == 10) 
		temp <= BM_R10in;
	
	else if(S == 11) 
		temp <= BM_R11in;
	
	else if(S == 12) 
		temp <= BM_R12in;
	
	else if(S == 13) 
		temp <= BM_R13in;
	
	else if(S == 14) 
		temp <= BM_R14in;
	
	else if(S == 15) 
		temp <= BM_R15in;
	
	else if(S == 16) 
		temp <= BM_HIin;
	
	else if(S == 17) 
		temp <= BM_LOin;
	
	else if(S == 18) 
		temp <= BM_Zhighin;
	
	else if(S == 19) 
		temp <= BM_Zlowin;
	
	else if(S == 20) 
		temp <= BM_PCin;
	
	else if(S == 21) 
		temp <= BM_MDRin;
	
	else if(S == 22) 
		temp <= BM_In_Portin;
	
	else if(S == 23) 
		temp <= BM_C_sign_extended;
		
	else if(S == 24) 
		temp <= BM_MARin;
	
	else 
		temp <= BusMuxOut;
end

assign BusMuxOut = temp;
endmodule
