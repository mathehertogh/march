`timescale 1ns/1ps

`include "src/adder.v"

module adder_tb;

	reg [31:0] a, b;
	wire [31:0] sum;
	reg [31:0] correct_sum;
	reg [31:0] i;

	adder dut(
		.a(a),
		.b(b),
		.sum(sum)
	);

	initial begin
		`ifdef WAVE
		$dumpfile("wave.vcd");
		$dumpvars;
		`endif

		for (i = 0; i < 1024; i = i+1) begin
			a = $random;
			b = $random;
			correct_sum = a + b;
			#1
			if (!sum === correct_sum) begin
				$display("%m - ERROR a=%d b=%d", a, b);
				$display("           sum=%d, correct_sum=%d", sum, correct_sum);
				$finish;
			end
		end
		$display("%m - all tests passed");
		$finish;
	end


endmodule