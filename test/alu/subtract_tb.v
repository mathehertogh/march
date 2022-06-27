`timescale 1ns/1ps

`include "src/subtract.v"

module not_word_tb;

	reg [31:0] a, b;
	wire [31:0] diff;
	reg [31:0] correct_diff, i;

	subtract dut(
		.a(a),
		.b(b),
		.diff(diff)
	);

	initial begin
		`ifdef WAVE
		$dumpfile("wave.vcd");
		$dumpvars;
		`endif

		for (i = 0; i < 1024; i = i+1) begin
			a = $random;
			b = $random;
			correct_diff = a - b;
			#1
			if (!diff === correct_diff) begin
				$display("%m - ERROR a=%d b=%d", a, b);
				$display("           diff=%d, correct_diff=%d", diff, correct_diff);
				$finish;
			end
		end
		$display("%m - all tests passed");
		$finish;
	end


endmodule