module not_word (	input wire [31:0] a,
			output wire [31:0] not_a);

	genvar i;

	generate
		for (i = 0; i < 32; i = i+1) begin
			not u(not_a[i], a[i]);
		end
	endgenerate

endmodule