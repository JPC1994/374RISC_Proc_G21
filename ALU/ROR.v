`timescale 1ns/10ps
module ROR(
 input [31:0] x, y, // y is number of shifts/rotations
 output [31:0] zlow, zhigh);
 
 integer i; 
 integer j;
 reg [31:0] temp;
 
 always @* begin

	temp[31] = x[0];
	for(j=31; j>0; j=j-1)
		temp[j-1] = x[j];		
		
 end
 
 assign zlow = temp;
 assign zhigh = 0;
 
endmodule
