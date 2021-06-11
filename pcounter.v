`timescale 1ns/10ps
module pcounter #(parameter VAL = 0)(
input clr, clk, regIn,
input [31:0] D,
output [31:0] Q,
input incPC);

// initial reg data = VAL;

reg [31:0] data;
initial data = VAL;

	always @(posedge clk) begin
		if (clr)
			data <= 32'b0;
		else if (regIn)
			data <= D;
		else if (incPC == 1)
			data = data + 1;
	end
			
	assign Q = data;
	
endmodule
