`timescale 1ns/10ps
module NOT_32(
 input [31:0] x, y,
 output [31:0] zlow, zhigh);
 
 integer i; // for loop
 reg [31:0] temp;
 
 always @* begin
	for(i=0; i<32; i= i+1) begin
	
		if(x[i] == 1)
			temp[i] = 0;
		else
			temp[i] = 1;
			
	end
 end
 
 assign zlow = temp;
 assign zhigh = 0;
 
endmodule
