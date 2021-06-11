`timescale 1ns/10ps
module ROL(
 input [31:0] x, y, // y is number of shifts/rotations
 output [31:0] zlow, zhigh);
 
 integer i; 
 integer j;
 reg [31:0] temp;
 
 always @* begin
	
	temp[0] = x[31];
	for(j=0; j<31; j=j+1)
		temp[j+1] = x[j];	

 end
 
 assign zlow = temp;
 assign zhigh = 0;
 
endmodule
