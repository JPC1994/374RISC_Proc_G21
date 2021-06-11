 `timescale 1ns/10ps
module tb_Add;
	reg [31:0] in1, in2;
	wire [31:0] SUM;
initial
	begin
		in1 <= 32'd0;
		in2 <= 32'd0;
		#300   	in1 <= 32'b00001;
					in2 <= 32'b01111;
	end
Add rc_adder(in1, in2, SUM);
endmodule
