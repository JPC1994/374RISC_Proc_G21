`timescale 1ns/10ps
module SHL_32(
 input [31:0] register, shifts,
 output [31:0] zlow, zhigh);
 
 reg [5:0] i;
 reg [5:0] j;
 reg [31:0] temp;

always @* begin
	// for(i=0; i<shifts; i=i+1) begin
	for(j=0; j<31; j=j+1)
		temp[j+1] = register[j];	
		
	temp[0] = 0;
	
end

assign zlow = temp;
assign zhigh = 32'b0;

endmodule
