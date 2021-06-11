/* `timescale 1ns/10ps
module Register #(parameter VAL = 0)(
input clr, clk, regIn,
input [31:0] busMuxOut,
output reg [31:0] busMuxIn
);

initial busMuxIn = VAL;

// reg [31:0] busMuxIn;

	always @(posedge clk)
		if (clr)
			busMuxIn <= 32'b0;
		else if (regIn)
			busMuxIn <= busMuxOut;
			
	// assign busMuxIn = data;
	
endmodule */

`timescale 1ns/10ps
module Register #(parameter VAL = 0)(
input clr, clk, regIn,
input [31:0] D,
output [31:0] Q);

// initial reg data = VAL;

reg [31:0] data;
initial data = VAL;

	always @(posedge clk) begin
		if (clr)
			data <= 32'b0;
		else if (regIn)
			data <= D;
	end
			
	assign Q = data;

	
endmodule

/* `timescale 1ns/10ps
module Register (
input clr, clk, regIn,
input [31:0] busMuxOut,
output [31:0] busMuxIn
);

reg [31:0] data;

	always @(posedge clk)
		if (clr)
			data <= 32'b0;
		else if (regIn)
			data <= busMuxOut;
			
	assign busMuxIn = data;
	
endmodule */
