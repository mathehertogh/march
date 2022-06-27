`timescale 1ns/1ps

`include "adder.v"

module adder_tb;

	reg a, b, c_i;
	wire y, c_o;

	adder dut(
		.a(a),
		.b(b),
		.carry_in(c_i),
		.sum(y),
		.carry_out(c_o)
	);

	initial begin
		$dumpfile("adder.vcd");
		$dumpvars;

		a = 1'b0;
		b = 1'b0;
		c_i = 1'b0;
		$monitor("%m %d - a=%d b=%d c_i=%d  y=%d c_o=%d", $stime, a, b, c_i, y, c_o);
		#1 a = 1'b1;
		#1 b = 1'b1;
		#1 a = 1'b0;
		#1 c_i = 1'b1;
		#1 b = 1'b0;
		#1 a = 1'b1;
		#1 b = 1'b1;
		$finish;
	end


endmodule