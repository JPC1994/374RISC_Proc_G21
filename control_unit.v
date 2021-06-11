`timescale 1ns/10ps
module control_unit(
	output reg HIout, LOout, Zhighout, Zlowout, PCout, MDRout, MARout, In_Portout, Cout, RAMin,
	
	output reg HIin, LOin, Zhighin, Zlowin, Zin, PCin, MDRin, In_Port, Out_Port, Cin, IRin, MARin, Yin, incPC, MDRread, PCCON,
	
	output reg [3:0] opCode, 
	
	output reg Gra, Grb, Grc, Rout, BAout, Rin,
	
	output reg CONin,
	
	output reg read, write,
	
	input [31:0] IR,
	
	input clk, reset, stop, CONFF);

	parameter 	Reset_state = 8'b00000000, fetch0 = 8'b00000001, fetch1 = 8'b00000010, fetch2 = 8'b00000011, fetch3 = 8'b00000100,
				add3 = 8'b00000101, add4 = 8'b00000110, add5 = 4'b00000111,
				sub3 = 8'b00001000, sub4 = 8'b00001001, sub5 = 8'b00001011,
				and3 = 8'b00001100, and4 = 8'b00001101, and5 = 8'b00001110,
				or3 = 8'b00001111, or4 = 8'b00010001, or5 = 8'b00010010,
				shr3 = 8'b00010011, shr4 = 8'b00010100, shr5 = 8'b00010101,
				shl3 = 8'b00010110, shl4 = 8'b00010111, shl5 = 8'b00011000,
				ror3 = 8'b00011001, ror4 = 8'b00011010, ror5 = 8'b00011011,
				rol3 = 8'b00011100, rol4 = 8'b00011101, rol5 = 8'b00011110,
				mul3 = 8'b00011111, mul4 = 8'b00100000, mul5 = 8'b00100001, mul6 = 8'b00100010,
				div3 = 8'b00100011, div4 = 8'b00100100, div5 = 8'b00100101, div6 = 8'b00100110,
				neg3 = 8'b00100111, neg4 = 8'b00101000, neg5 = 8'b10000000,
				not3 = 8'b00101001, not4 = 8'b00101010, not5 = 8'b10000001,
				ld3 = 8'b00101011, ld4 = 8'b00101100, ld5 = 8'b00101101, ld6 = 8'b00101110,  ld7 = 8'b00101111,
				ldi3 = 8'b00110000, ldi4 = 8'b00110001, ldi5 = 8'b00110010,
				str3 = 8'b00110011, str4 = 8'b00110100, str5 = 8'b00110101, str6 = 8'b00110110,  str7 = 8'b00110111,
				addi3 = 8'b00111000, addi4 = 8'b00111001, addi5 = 8'b00111010,
				andi3 = 8'b00111011, andi4 = 8'b00111100, andi5 = 8'b00111101,
				ori3 = 8'b00111110, ori4 = 8'b00111111, ori5 = 8'b01000000,
				jr3 = 8'b01000001, 
				jal3 = 8'b01000010, jal4 = 8'b11000010,
				mfhi3 = 8'b01000011, 
				mflo3 = 8'b01000100,
				nop3 = 8'b01000101, //, nop4 = 4'b0101, nop5 = 4'b0110,
				halt3 = 8'b01000110, //, halt4 = 4'b0101, halt5 = 4'b0110;
				br3 = 8'b01000111, br4 = 8'b01001000, br5 = 8'b01001001, br6 = 8'b01001010;
				
	reg	[7:0] Present_state = Reset_state;
	
	
always @(posedge clk) begin
		case (Present_state)
			Reset_state		:		#40 Present_state = fetch0;
			fetch0			:		#40 Present_state = fetch1;
			fetch1			:		#40 Present_state = fetch2;
			fetch2			:		#40 Present_state = fetch3;
			fetch3			: 		begin
											case (IR[31:27])
												5'b00011		:		#40 Present_state = add3;

												5'b00100		:		#40 Present_state = sub3;

												5'b00101		:		#40 Present_state = shr3;

												5'b00110		:		#40 Present_state = shl3;

												5'b00111		:		#40 Present_state = ror3;

												5'b01000		:		#40 Present_state = rol3;

												5'b01001		:		#40 Present_state = and3;

												5'b01010		:		#40 Present_state = or3;

												5'b01110		:		#40 Present_state = mul3;

												5'b01111		:		#40 Present_state = div3;

												5'b10000		:		#40 Present_state = neg3;

												5'b10001		:		#40 Present_state = not3;

												5'b00000		:		#40 Present_state = ld3;

												5'b00001		:		#40 Present_state = ldi3;

												5'b00010		:		#40 Present_state = str3;

												5'b01011		:		#40 Present_state = addi3;

												5'b01100		:		#40 Present_state = andi3;

												5'b01101		:		#40 Present_state = ori3;

												5'b10011		:		#40 Present_state = jr3;

												5'b10100		:		#40 Present_state = jal3;

												5'b10111		:		#40 Present_state = mfhi3;

												5'b11000		:		#40 Present_state = mflo3;
												
												5'b11001		:		#40 Present_state = nop3;
												
												5'b11010		:		#40 Present_state = halt3;
												
												5'b10010 	:		#40 Present_state = br3;
											endcase
										end
			add3			:		#40 Present_state = add4;
			add4			:		#40 Present_state = add5;
			add5 			:     #40 Present_state = Reset_state;
			
			sub3			:		#40 Present_state = sub4;
			sub4			:		#40 Present_state = sub5;
			sub5 			:     #40 Present_state = Reset_state;
			
			shr3			:		#40 Present_state = shr4;
			shr4			:		#40 Present_state = shr5;
			shr5 			:     #40 Present_state = Reset_state;
			
			shl3			:		#40 Present_state = shl4;
			shl4			:		#40 Present_state = shl5;
			shl5 			:     #40 Present_state = Reset_state;
			
			ror3			:		#40 Present_state = ror4;
			ror4			:		#40 Present_state = ror5;
			ror5 			:     #40 Present_state = Reset_state;
			
			rol3			:		#40 Present_state = rol4;
			rol4			:		#40 Present_state = rol5;
			rol5 			:     #40 Present_state = Reset_state;
			
			and3			:		#40 Present_state = and4;
			and4			:		#40 Present_state = and5;
			and5 			:     #40 Present_state = Reset_state;
			
			or3			:		#40 Present_state = or4;
			or4			:		#40 Present_state = or5;
			or5 			:     #40 Present_state = Reset_state;
			
			mul3			:		#40 Present_state = mul4;
			mul4			:		#40 Present_state = mul5;
			mul5			: 		#40 Present_state = mul6;
			mul6 			:     #40 Present_state = Reset_state;
			
			div3			:		#40 Present_state = div4;
			div4			:		#40 Present_state = div5;
			div5			: 		#40 Present_state = div6;
			div6 			:     #40 Present_state = Reset_state;
			
			neg3			:		#40 Present_state = neg4;
			neg4			:		#40 Present_state = neg5;
			neg5 			:     #40 Present_state = Reset_state;
			
			not3			:		#40 Present_state = not4;
			not4			:		#40 Present_state = not5;
			not5			:     #40 Present_state = Reset_state;
			
			ld3			:		#40 Present_state = ld4;
			ld4			:		#40 Present_state = ld5;
			ld5			:		#40 Present_state = ld6;
			ld6			:		#40 Present_state = ld7;
			ld7 			:     #40 Present_state = Reset_state;
			
			ldi3			:		#40 Present_state = ldi4;
			ldi4			:		#40 Present_state = ldi5;
			ldi5 			:     #40 Present_state = Reset_state;
			
			str3			:		#40 Present_state = str4;
			str4			:		#40 Present_state = str5;
			str5			:		#40 Present_state = str6;
			str6			:		#40 Present_state = str7;
			str7 			:     #40 Present_state = Reset_state;
			
			addi3			:		#40 Present_state = addi4;
			addi4			:		#40 Present_state = addi5;
			addi5 		:     #40 Present_state = Reset_state;
			
			andi3			:		#40 Present_state = andi4;
			andi4			:		#40 Present_state = andi5;
			andi5			:     #40 Present_state = Reset_state;
			
			jr3			:     #40 Present_state = Reset_state;
			
			jal3			:		#40 Present_state = jal4;
			jal4			:     #40 Present_state = Reset_state;
			
			mfhi3			:     #40 Present_state = Reset_state;
			mflo3			:     #40 Present_state = Reset_state;
			
			ori3			:		#40 Present_state = ori4;
			ori4			:		#40 Present_state = ori5;
			ori5 			:     #40 Present_state = Reset_state;
			
			
			nop3			:		#40 Present_state = Reset_state;
			/* nop4			:		#40 Present_state = nop5;
			nop5 			:     #40 Present_state = Reset_state; */
			
			
			halt3			:		Present_state = halt3;
			
			
			br3			:		#40 Present_state = br4;
			br4			:		#40 Present_state = br5;
			br5			:		#40 Present_state = br6;
			br6 			:     #40 Present_state = Reset_state;
			
			endcase
		end
		
always @(Present_state) begin
		case (Present_state)
			Reset_state: begin
								HIout <= 0; LOout <= 0; Zhighout <= 0; Zlowout <= 0; MARout <= 0; RAMin <= 0; In_Port <= 0; Out_Port <= 0;	
								PCout <= 0; MDRout <= 0; In_Portout <= 0; Cout <= 0; Cin <= 0;
								PCin <= 0; Yin <= 0; Zin <= 0; Zhighin <= 0; 
								MARin <= 0; HIin <= 0; LOin <= 0; IRin <= 0; incPC <= 0;
								MDRin <= 0; MDRread <= 0; Gra <= 0; Grb <= 0; Grc <= 0; Rout <= 0; BAout <= 0; Rin <= 0; read <= 0; 
			end
		
			fetch0: begin
								PCout <= 1; MARin <= 1; incPC <= 1; Zlowin <= 1; 
								#25 Zlowin <= 0; incPC <= 0; MARin <= 0; PCout <= 0; 
			end
			
			fetch1: begin
								Zlowout <= 1;  PCin <= 0; read <= 1; MDRin <= 1;
								#25 Zlowout <= 0; PCin <= 0; read <= 0; MDRin <= 0;
			end 
						
			fetch2: begin
								MDRout <= 1; IRin <= 1;
								#25 MDRout <= 0; IRin <= 0;
			end
			
			fetch3: begin
			
			end
			
			// ldi
			
			ldi3: begin
								Grb <= 1; Yin <= 1; BAout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; BAout <= 0; Cin <= 0;
			end
			ldi4: begin
								Cout <= 1; Zin <= 1; opCode <= 4'b0001; Zlowin <= 1; // add
								#25 Cout<= 0; Zin <= 0; Zlowin <= 0; 
			end
			ldi5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0; 
			end
			
			// ld

			ld3: begin
								Grb <= 1; BAout <= 1; Yin <= 1; Cin <= 1;
								#25 Grb <= 0; BAout <= 0; Yin <= 0; Cin <= 0;
			end
			ld4: begin
								Cout <= 1; Zlowin <= 1; opCode <= 4'b0001; // add
								#25 Cout<= 0; Zlowin <= 0;
			end
			ld5: begin
								Zlowout <= 1; MARin <= 1; 
								#25 Zlowout<= 0; MARin <= 0; 
			end
			ld6: begin
								MDRin <= 1; read <= 1;
								#25 MDRin <= 0; read <= 0;
			end
			ld7: begin
								MDRout <= 1; Gra <= 1; Rin <= 1;
								#25 MDRout <= 0; Gra <= 0; Rin <= 0;
			end
			
			// str
			str3: begin
								Grb <= 1; BAout <= 1; Yin <= 1; Cin <= 1;
								#25 Grb <= 0; BAout <= 0; Yin <= 0; Cin <= 0;
			end
			str4: begin
								Cout <= 1; Zlowin <= 1; opCode <= 4'b0001; MARin <= 1; // add
								#25 Cout<= 0; Zlowin <= 0; MARin <= 0; 
			end
			str5: begin
								Zlowout <= 1; 
								#25 Zlowout<= 0; 
			end
			str6: begin
								MDRin <= 1; Gra <= 1; Rout <= 1;
								#25 MDRin <= 0; Gra <= 0; Rout <= 0;
			end
			str7: begin
								write <= 1;
								#25 write <= 0;
			end
			
			
			// add
			
			add3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			
			add4: begin
								Grc <= 1; Rout <= 1; opCode <= 4'b0001; Zlowin <= 1; // add
								#25 Grc <= 0; Rout <= 0; Zlowin <= 0; 
			end
			
			add5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 0; Rin <= 0; 		
			end
			
			// sub
			
			sub3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			
			sub4: begin
								Grc <= 1; Rout <= 1; Zin <= 1; opCode <= 4'b0010; Zlowin <= 1; // or
								#25 Grc <= 0; Rout <= 0; Zin <= 0; Zlowin <= 0; 
			end
			
			sub5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0; 	
			end
			
			// shr
			
			shr3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			
			shr4: begin
								Grc <= 1; Rout <= 1; Cout <= 1; Zin <= 1; opCode <= 4'b0011; Zlowin <= 1; // shr
								#25 Grc <= 1; Rout <= 0; Cout<= 0; Zin <= 0; Zlowin <= 0;
			end
			
			shr5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0;
			end
			
			// shl
			
			shl3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			
			shl4: begin
								Grc <= 1; Rout <= 1; Cout <= 1; Zin <= 1; opCode <= 4'b0100; Zlowin <= 1; // shl
								#25 Grc <= 1; Rout <= 0; Cout<= 0; Zin <= 0; Zlowin <= 0;
			end
			
			shl5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0;
			end
			
			// ror
			
			ror3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			
			ror4: begin
								Grc <= 1; Rout <= 1; Cout <= 1; Zin <= 1; opCode <= 4'b0101; Zlowin <= 1; // ror
								#25 Grc <= 1; Rout <= 0; Cout<= 0; Zin <= 0; Zlowin <= 0;
			end
			
			ror5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0;
			end
			
			// rol
			
			rol3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			
			rol4: begin
								Grc <= 1; Rout <= 1; Cout <= 1; Zin <= 1; opCode <= 4'b0110; Zlowin <= 1; // rol
								#25 Grc <= 1; Rout <= 0; Cout<= 0; Zin <= 0; Zlowin <= 0;
			end
			
			rol5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0;
			end
			
			// and
			
			and3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			
			and4: begin
								Grc <= 1; Rout <= 1; Cout <= 1; Zin <= 1; opCode <= 4'b0111; Zlowin <= 1; // and
								#25 Grc <= 1; Rout <= 0; Cout<= 0; Zin <= 0; Zlowin <= 0;
			end
			
			and5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0;
			end
			
			// or
			
			or3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			
			or4: begin
								Grc <= 1; Rout <= 1; Cout <= 1; Zin <= 1; opCode <= 4'b1000; Zlowin <= 1; // or
								#25 Grc <= 1; Rout <= 0; Cout<= 0; Zin <= 0; Zlowin <= 0;
			end
			
			or5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0;
			end
			
			// addi
			
			addi3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			
			addi4: begin
								Cout <= 1; Zin <= 1; opCode <= 4'b0001; Zlowin <= 1; // add
								#25 Cout<= 0; Zin <= 0; Zlowin <= 0; 
			end
			
			addi5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 0; Rin <= 0; 		
			end		
		
			// andi
			
			andi3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			
			andi4: begin
								Cout <= 1; Zin <= 1; opCode <= 4'b0111; Zlowin <= 1; // and
								#25 Cout<= 0; Zin <= 0; Zlowin <= 0; 
			end
			
			andi5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 0; Rin <= 0;
			end
			
			// ori
			
			ori3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			
			ori4: begin
								Cout <= 1; Zin <= 1; opCode <= 4'b1000; Zlowin <= 1; // or
								#25 Cout<= 0; Zin <= 0; Zlowin <= 0; 
			end
			
			ori5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0;
			end
			
			// mul
			
			mul3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			
			mul4: begin
								Gra <= 1; Rout <= 1; Zin <= 1; opCode <= 4'b1001; Zlowin <= 1; // mul
								#25 Gra <= 0; Rout <= 0; Zin <= 0; Zlowin <= 0; 
			end
			
			mul5: begin
								Zlowout <= 1; LOin <= 1;
								#25 Zlowout <= 0; LOin <= 0;
			end
			
			mul6: begin
								Zhighout <= 1; HIin <= 1; 
								#25 Zhighout <= 0; HIin <= 0;
			end
			
			// div
			
			div3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0;
			end
			
			div4: begin
								Gra <= 1; Rout <= 1; Zin <= 1; opCode <= 4'b1010; Zlowin <= 1;
								#25 Gra <= 0; Rout <= 0; Zin <= 0; Zlowin <= 0; 
			end
			
			div5: begin
								Zlowout <= 1; LOin <= 1;
								#25 Zlowout <= 0; LOin <= 0;
			end

			div6: begin
								Zhighout <= 1; HIin <= 1;
								#25 Zhighout <= 0; HIin <= 0;
			end
			
			// neg
			
			neg3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0; 
			end
			
			neg4: begin
								Grc <= 1; Rout <= 1; Cout <= 1; Zin <= 1; opCode <= 4'b1011; Zlowin <= 1;
								#25 Grc <= 1; Rout <= 0; Cout<= 0; Zin <= 0; Zlowin <= 0;
			end	
			
			neg5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0;
			end
						
			
			// not
			
			not3: begin
								Grb <= 1; Yin <= 1; Rout <= 1; Cin <= 1;
								#25 Grb <= 0; Yin <= 0; Rout <= 0; Cin <= 0; 
			end
			
			not4: begin
								Grc <= 1; Rout <= 1; Cout <= 1; Zin <= 1; opCode <= 4'b1100; Zlowin <= 1;
								#25 Grc <= 1; Rout <= 0; Cout<= 0; Zin <= 0; Zlowin <= 0;
			end	
			
			not5: begin
								Zlowout <= 1; Gra <= 1; Rin <= 1;
								#25 Zlowout <= 0; Gra <= 1; Rin <= 0;
			end 
			
			// jr
			
			jr3: begin
								Gra <= 1; PCin <= 1; Rout <= 1; Cin <= 1;
								#25 Gra <= 0; PCin <= 0; Rout <= 0; Cin <= 0;
			end
			
			// jal
			
			jal3: begin
								Grb <=  1; PCout <= 1; Rin <= 1; // Cin <= 1;
								#25 Grb <=  0; PCout <= 0; Rin <= 0; // Cin <= 0;
			end
			
			jal4: begin
								Gra <= 1; PCin <= 1; Rout <= 1; // Cin <= 1;
								#25 Gra <= 0; PCin <= 0; Rout <= 0; // Cin <= 0;
			end
			

			
			// mfhi
			
			mfhi3: begin
								Gra <= 1; Rin <= 1; Cin <= 1; HIout <= 1; // <- uncomment for mfhi operation
								#25 Gra <= 0; Rin <= 0; Cin <= 0; HIout <= 1;
			end
			
			// mflo
			
			mflo3: begin
								Gra <= 1; LOout <= 1; Rin <= 1; Cin <= 1; // HIout <= 1; <- uncomment for mfhi operation
								#25 Gra <= 0; LOout <= 0; Rin <= 0; Cin <= 0; // HIout <= 1;
			end
			
			// nop
			
			nop3: begin
			
			
			end
			
			// halt
			
			halt3: begin
			
			
			end
			
		
			// branch
			
			br3: begin
					Gra <=1; Rout<=1; CONin <= 1; Cin <= 1;
					#25 Gra <=0; Rout<=0; CONin <= 0; Cin <= 0;
			end
			
			br4: begin
					PCout <=1; Yin <= 1;
					#25 PCout <=0; Yin <= 0;
			end
			
			br5: begin
					Cout <= 1; Gra <= 1; Zin <= 1; opCode <= 4'b0001; Zlowin <= 1; // add
					#25 Cout <= 0; Gra <=1; Zin <= 0; Zlowin <= 0;
			end
			
			br6: begin
					Zlowout <= 1; PCCON <= 1;// CON <= PCin; // unsure about logic (CON -> pcIN)
					#25 Zlowout <= 0; PCCON <= 0;//  CON <= 0;
			end
			
		endcase
	end
endmodule

		
		