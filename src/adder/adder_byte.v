`include "src/adder/adder_bit.v"

module adder_byte(	input wire [7:0] a,
			input wire [7:0] b,
			input wire carry_in,
			output wire [7:0] sum,
			output wire carry_out);

	wire [6:0] tmp_carry;

	adder_bit adder0(.a(a[0]), .b(b[0]), .carry_in(carry_in),
			.sum(sum[0]), .carry_out(tmp_carry[0]));
	adder_bit adder1(.a(a[1]), .b(b[1]), .carry_in(tmp_carry[0]),
			.sum(sum[1]), .carry_out(tmp_carry[1]));
	adder_bit adder2(.a(a[2]), .b(b[2]), .carry_in(tmp_carry[1]),
			.sum(sum[2]), .carry_out(tmp_carry[2]));
	adder_bit adder3(.a(a[3]), .b(b[3]), .carry_in(tmp_carry[2]),
			.sum(sum[3]), .carry_out(tmp_carry[3]));
	adder_bit adder4(.a(a[4]), .b(b[4]), .carry_in(tmp_carry[3]),
			.sum(sum[4]), .carry_out(tmp_carry[4]));
	adder_bit adder5(.a(a[5]), .b(b[5]), .carry_in(tmp_carry[4]),
			.sum(sum[5]), .carry_out(tmp_carry[5]));
	adder_bit adder6(.a(a[6]), .b(b[6]), .carry_in(tmp_carry[5]),
			.sum(sum[6]), .carry_out(tmp_carry[6]));
	adder_bit adder7(.a(a[7]), .b(b[7]), .carry_in(tmp_carry[6]),
			.sum(sum[7]), .carry_out(carry_out));

endmodule
