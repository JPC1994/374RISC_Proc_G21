module tb_SHR;

	reg [31:0] in1, shifts;
	wire [31:0] z_low, z_high;

	SHR_32 shr(in1, shifts, z_low, z_high);

	reg [2:0] present_state = 2'b00;
	reg clk;

	initial begin
		shifts = 32'b00000000000000000000000000000111;
		
		clk = 0;
		forever #10 clk = ~clk;
	end

	always @ (present_state) begin
		case(present_state)
			default : begin
				in1 = 32'b11111111111111111111111111111111;
			end
			0 : begin
				in1 = 32'b00000000000000010101010101010101;
			end
			1 : begin
				in1 = 32'b00000000000000001111111111111111;
			end
			2 : begin
				in1 = 32'b10101010101000000000000000000000;
			end
		endcase
	end

	always @ (posedge clk) begin
		present_state = present_state + 1;
		if (present_state == 3) begin
			present_state = 0;
		end
	end
endmodule
