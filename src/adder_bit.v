module adder_bit(	input a,
			input b,
			input carry_in,
			output sum,
			output carry_out);

	wire m, ab, ac, bc;

	xor xor1(m, a, b);
	xor xor2(sum, m, carry_in);

	and and1(ab, a, b);
	and and2(ac, a, carry_in);
	and and3(bc, b, carry_in);
	or or1(carry_out, ab, ac, bc);

endmodule
