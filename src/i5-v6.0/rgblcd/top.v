module TOP
(
	//input  reset,
    input  clk25,

	output LCD_CLK,
	output LCD_HYNC,
	output LCD_SYNC,
	output LCD_DEN,
	output [4:0] LCD_R,
	output [5:0] LCD_G,
	output [4:0] LCD_B,

);

	assign PCLK = clk25;
    assign reset = 1;

	LCDC _LCDC
	(
		.rst	   (reset),

		.pclk	   (PCLK),
		.LCD_DE	   (LCD_DEN),
		.LCD_HSYNC (LCD_HYNC),
    	.LCD_VSYNC (LCD_SYNC),

		.LCD_B	   (LCD_B),
		.LCD_G	   (LCD_G),
		.LCD_R	   (LCD_R)
	);

	assign LCD_CLK = PCLK;

endmodule
