`timescale 1ns/1ps

`include "src/adder_bit.v"

module adder_bit_tb;

	reg a, b, c_i;
	wire y, c_o;
	reg correct_y, correct_c_o;
	reg [3:0] i;

	adder_bit dut(
		.a(a),
		.b(b),
		.carry_in(c_i),
		.sum(y),
		.carry_out(c_o)
	);

	initial begin
		`ifdef WAVE
		$dumpfile("wave.vcd");
		$dumpvars;
		`endif

		for (i = 0; i < 8; i = i+1) begin
			{a, b, c_i} = i;
			#1
			{correct_c_o, correct_y} = a + b + c_i;
			if (!(c_o === correct_c_o && y === correct_y)) begin
				$display("%m - ERROR a=%d b=%d c_i=%d", a, b, c_i);
				$display("           y=%d, correct_y=%d", y, correct_y);
				$display("           c_o=%d, correct_c_o=%d", c_o, correct_c_o);
				$finish;
			end
			
		end
		$display("%m - all tests passed");
		$finish;
	end


endmodule