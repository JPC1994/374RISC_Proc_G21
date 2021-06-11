`timescale 1ns/10ps
module tb_ROR;

reg [31:0] x, y;
wire [31:0] Zlow, Zhigh;

ROR ror1(x, y, Zlow, Zhigh);

reg [2:0] present_state = 2'b00;
reg clock;

initial begin
	y = 32'b00000000000000000000000000000111;
	
	clock = 0;
	forever #10 clock = ~clock;
end

always @ (present_state) begin
	case(present_state)
		0 : begin
			x = 32'b01010101010101010101010101010101;
		end
		1 : begin
			x = 32'b00000000000000000000000000000011;
		end
		2 : begin
			x = 32'b10101010101010101010101010101010;
		end
		default : begin
			x = 32'b00000000000000000000000000000001;
		end
	endcase
end

always @ (posedge clock) begin
	present_state = present_state + 1;
	if (present_state == 3) begin
		present_state = 0;
	end
end
endmodule
