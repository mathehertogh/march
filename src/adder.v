`include "src/adder_word.v"

module adder(	input wire [31:0] a,
		input wire [31:0] b,
		output wire [31:0] sum);

	adder_word adder0(.a(a), .b(b), .carry_in(1'b0), .sum(sum), .carry_out());

endmodule
