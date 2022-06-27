`include "src/adder/adder_byte.v"

module adder_word(	input wire [31:0] a,
			input wire [31:0] b,
			input wire carry_in,
			output wire [31:0] sum,
			output wire carry_out);

	wire [2:0] tmp_carry;

	adder_byte adder0(.a(a[7:0]), .b(b[7:0]), .carry_in(carry_in),
			.sum(sum[7:0]), .carry_out(tmp_carry[0]));
	adder_byte adder1(.a(a[15:8]), .b(b[15:8]), .carry_in(tmp_carry[0]),
			.sum(sum[15:8]), .carry_out(tmp_carry[1]));
	adder_byte adder2(.a(a[23:16]), .b(b[23:16]), .carry_in(tmp_carry[1]),
			.sum(sum[23:16]), .carry_out(tmp_carry[2]));
	adder_byte adder3(.a(a[31:24]), .b(b[31:24]), .carry_in(tmp_carry[2]),
			.sum(sum[31:24]), .carry_out(carry_out));

endmodule
