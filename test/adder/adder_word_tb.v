`timescale 1ns/1ps

`include "src/adder/adder_word.v"

module adder_word_tb;

	reg [31:0] a, b;
	reg c_i;
	wire [31:0] sum;
	wire c_o;
	reg [31:0] correct_sum;
	reg correct_c_o;
	reg [31:0] i;

	adder_word dut(
		.a(a),
		.b(b),
		.carry_in(c_i),
		.sum(sum),
		.carry_out(c_o)
	);

	initial begin
		`ifdef WAVE
		$dumpfile("wave.vcd");
		$dumpvars;
		`endif

		for (i = 0; i < 1024; i = i+1) begin
			a = $random;
			b = $random;
			c_i = $random;
			{correct_c_o, correct_sum} = a + b + c_i;
			#1
			if (!(c_o === correct_c_o && sum === correct_sum)) begin
				$display("%m - ERROR a=%d b=%d c_i=%d", a, b, c_i);
				$display("           sum=%d, correct_sum=%d", sum, correct_sum);
				$display("           c_o=%d, correct_c_o=%d", c_o, correct_c_o);
				$finish;
			end
		end
		$display("%m - all tests passed");
		$finish;
	end


endmodule