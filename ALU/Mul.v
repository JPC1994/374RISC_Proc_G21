`timescale 1ns/10ps
module Mul(
	input [31:0] in1, in2,
	output[31:0] zlow, zhigh);
	integer i;
		
	reg [63:0] Prod, temp, temp_neg;
	reg carry;
		
	always @ (in1, in2) begin
		Prod = 64'd0;
		temp = 64'd0 + in2;
		temp_neg = 64'd0 - in2;
		carry = 0;
 
		for(i=0;i<32;i =i+1) begin
			if(in1[i] != carry) begin
				if(carry == 1) begin
					Prod = Prod + (temp << i);
				end 
				else begin
					Prod = Prod + (temp_neg << i);
				end
				if(in1[i] == 1) begin
					carry = 1;
				end 
				else begin
					carry = 0;
				end
			end

		end
	end
 
assign zlow = Prod[31:0];
assign zhigh = Prod[63:32];
 
endmodule 
