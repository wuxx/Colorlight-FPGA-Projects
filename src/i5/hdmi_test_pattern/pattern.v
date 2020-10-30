`default_nettype none

module pattern(input i_tmdsclk, i_pixclk, output red, grn, blu, o_rd,
	o_TMDS_red, o_TMDS_grn, o_TMDS_blu);

  wire [7:0] red, grn, blu;
  wire [23:0] pixel;
  assign red= pixel[23:16];
  assign grn= pixel[15:8];
  assign blu= pixel[7:0];

/* verilator lint_off UNUSED */
  wire o_red;
  wire o_grn;
  wire o_blu;
  wire [9:0] o_TMDS_red, o_TMDS_grn, o_TMDS_blu;
/* verilator lint_on UNUSED */
  wire o_rd, o_newline, o_newframe;

  // A reset line that goes low after 16 ticks
  reg [2:0] reset_cnt = 0;
  wire reset = ~reset_cnt[2];
  always @(posedge i_pixclk)
    if (reset) reset_cnt <= reset_cnt + 1;


  llhdmi llhdmi_instance(
    .i_tmdsclk(i_tmdsclk), .i_pixclk(i_pixclk),
    .i_reset(reset), .i_red(red), .i_grn(grn), .i_blu(blu),
    .o_rd(o_rd), .o_newline(o_newline), .o_newframe(o_newframe),
    .o_TMDS_red(o_TMDS_red), .o_TMDS_grn(o_TMDS_grn), .o_TMDS_blu(o_TMDS_blu),
    .o_red(o_red), .o_grn(o_grn), .o_blu(o_blu));

  vgatestsrc #(.BITS_PER_COLOR(8))
    vgatestsrc_instance(
      .i_pixclk(i_pixclk), .i_reset(reset),
      .i_width(640), .i_height(480),
      .i_rd(o_rd), .i_newline(o_newline), .i_newframe(o_newframe),
      .o_pixel(pixel));

endmodule
