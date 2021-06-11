`timescale 1ns/10ps
module OR_32(
 input [31:0] A, B,
 output [31:0] zlow, zhigh);
 
 reg [5:0] i_32;
 reg [31:0] temp;
 
 always @(A or B) 
 begin 
	for(i_32=0;i_32<32;i_32 = i_32+1) begin
		if(A[i_32] == 1'b1 || B[i_32] == 1'b1) 
			temp[i_32] = 1'b1;
	   else 
			temp[i_32] = 1'b0;
	end
end

assign zlow = temp;
assign zhigh = 0;

endmodule 