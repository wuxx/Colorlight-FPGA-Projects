module rst_gen (
	input 			clk_i,
	input 			rst_i,
	output			rst_o
);

/* try to generate a reset */
reg [2:0]	rst_cpt;
always @(posedge clk_i) begin
	if (rst_i)
		rst_cpt = 3'b0;
	else begin
		if (rst_cpt == 3'b100)
			rst_cpt = rst_cpt;
		else
			rst_cpt = rst_cpt + 3'b1;
	end
end

assign rst_o = !rst_cpt[2];

endmodule
