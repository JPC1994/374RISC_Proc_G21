`timescale 1ns/10ps
module ENC32to5(
input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, 
	R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, MARout, In_Portout, Cout,
	
output reg [4:0] signal);
 
always @* begin
	if(R0out == 1'b1) 
		signal <= 5'd0;
		
	else if(R1out == 1'b1)  
		signal <= 5'd1;
	
	else if(R2out == 1'b1)  
		signal <= 5'd2;
	
	else if(R3out == 1'b1)  
		signal <= 5'd3;
	
	else if(R4out == 1'b1)  
		signal <= 5'd4;
	
	else if(R5out == 1'b1)  
		signal <= 5'd5;
	
	else if(R6out == 1'b1)  
		signal <= 5'd6;
	
	else if(R7out == 1'b1)  
		signal <= 5'd7;
	
	else if(R8out == 1'b1)  
		signal <= 5'd8;
	
	else if(R9out == 1'b1)  
		signal <= 5'd9;
	
	else if(R10out == 1'b1)  
		signal <= 5'd10;
	
	else if(R11out == 1'b1)  
		signal <= 5'd11;
	
	else if(R12out == 1'b1)  
		signal <= 5'd12;
	
	else if(R13out == 1'b1)  
		signal <= 5'd13;
	
	else if(R14out == 1'b1)  
		signal <= 5'd14;
	
	else if(R15out == 1'b1)  
		signal <= 5'd15;
	
	else if(HIout == 1'b1)  
		signal <= 5'd16;
	
	else if(LOout == 1'b1)  
		signal <= 5'd17;
	
	else if(Zhighout == 1'b1)  
		signal <= 5'd18;
	
	else if(Zlowout == 1'b1)  
		signal <= 5'd19;
	
	else if(PCout == 1'b1)  
		signal <= 5'd20;
	
	else if(MDRout == 1'b1)  
		signal <= 5'd21;
		
	else if(MDRout == 1'b1)  
		signal <= 5'd22;
	
	else if(In_Portout == 1'b1)  
		signal <= 5'd23;
	
	else if(Cout == 1'b1)  
		signal <= 5'd24;
end

endmodule
