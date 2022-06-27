`include "src/adder/adder_word.v"
`include "src/not_word.v"

module subtract(input wire [31:0] a,
		input wire [31:0] b,
		output wire [31:0] diff);

	wire [31:0] not_b;

	not_word not1(.a(b), .not_a(not_b));
	adder_word adder1(.a(a), .b(not_b), .carry_in(1'b1), .sum(diff), .carry_out());

endmodule
