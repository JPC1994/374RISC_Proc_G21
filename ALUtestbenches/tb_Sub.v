`timescale 1ns/10ps
module tb_Sub;
	reg [31:0] in1, in2;
	wire [31:0] SUM;
initial
	begin
		in1 <= 32'd0;
		in2 <= 32'd0;
		#300   	in1 <= 32'b00000001;
					in2 <= 32'b00001111;
	end
Sub sub_32(in1, in2, SUM);
endmodule
