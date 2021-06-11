`timescale 1ns/10ps
module Add(in1, in2, SUM);
	input [31:0] in1, in2;
	output [31:0] SUM;
	reg [31:0] SUM;
	reg [32:0] carry;
	integer i;
	always@(in1 or in2)
		begin
			carry = 32'd0;
			for(i = 0; i < 32; i = i + 1)
			begin
				SUM[i] = in1[i]^in2[i]^carry[i];
				carry[i+1] =(in1[i]&in2[i])|(carry[i]&(in1[i]|in2[i]));
			end
		end
endmodule
