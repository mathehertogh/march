`timescale 1ns/1ps

`include "src/not_word.v"

module not_word_tb;

	reg [31:0] a;
	wire [31:0] not_a;
	reg [31:0] correct_not_a, i;


	not_word dut(
		.a(a),
		.not_a(not_a)
	);

	initial begin
		`ifdef WAVE
		$dumpfile("wave.vcd");
		$dumpvars;
		`endif

		for (i = 0; i < 1024; i = i+1) begin
			a = $random;
			correct_not_a = ~a;
			#1
			if (!not_a === correct_not_a) begin
				$display("%m - ERROR a=%d", a);
				$display("           not_a=%d, correct_not_a=%d", not_a, correct_not_a);
				$finish;
			end
		end
		$display("%m - all tests passed");
		$finish;
	end


endmodule