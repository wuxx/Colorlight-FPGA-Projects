`default_nettype none
//
module llhdmi(
  i_tmdsclk, i_pixclk,
  i_reset, i_red, i_grn, i_blu,
  o_rd, o_newline, o_newframe,
`ifdef VERILATOR
  o_TMDS_red, o_TMDS_grn, o_TMDS_blu,
`endif
  o_red, o_grn, o_blu);

  input wire i_tmdsclk;		// TMDS clock
  input wire i_pixclk;		// Pixel clock, 10 times slower than i_tmdsclk
  input wire i_reset;		// Reset this module when strobed high
  input wire [7:0] i_red;	// Red green and blue colour values
  input wire [7:0] i_grn;	// for each pixel
  input wire [7:0] i_blu;
  output wire o_rd;		// True when we can accept pixel data
  output reg o_newline;		// True on last pixel of each line
  output reg o_newframe;	// True on last pixel of each frame
  output wire o_red;		// Red TMDS pixel stream
  output wire o_grn;		// Green TMDS pixel stream
  output wire o_blu;		// Blue TMDS pixel stream
`ifdef VERILATOR
  output wire [9:0] o_TMDS_red, o_TMDS_grn, o_TMDS_blu;
  assign o_TMDS_red= TMDS_red;
  assign o_TMDS_grn= TMDS_grn;
  assign o_TMDS_blu= TMDS_blu;
`endif

  reg [9:0] CounterX, CounterY;
  reg hSync, vSync, DrawArea;

  // Keep track of the current X/Y pixel position
  always @(posedge i_pixclk)
    if (i_reset)
      CounterX <= 0;
    else
      CounterX <= (CounterX==799) ? 0 : CounterX+1;

  always @(posedge i_pixclk)
    if (i_reset)
      CounterY <= 0;
    else if (CounterX==799) begin
      CounterY <= (CounterY==524) ? 0 : CounterY+1;
    end

  // Signal end of line, end of frame
  always @(posedge i_pixclk) begin
    o_newline  <= (CounterX==639) ? 1 : 0;
    o_newframe <= (CounterX==639) && (CounterY==479) ? 1 : 0;
  end

  // Determine when we are in a drawable area
  always @(posedge i_pixclk)
    DrawArea <= (CounterX<640) && (CounterY<480);

  assign o_rd= ~i_reset & DrawArea;

  // Generate horizontal and vertical sync pulses
  always @(posedge i_pixclk)
    hSync <= (CounterX>=656) && (CounterX<752);

  always @(posedge i_pixclk)
    vSync <= (CounterY>=490) && (CounterY<492);

  // Convert the 8-bit colours into 10-bit TMDS values
  wire [9:0] TMDS_red, TMDS_grn, TMDS_blu;
  TMDS_encoder encode_R(.clk(i_pixclk), .VD(i_red), .CD(2'b00),
                                        .VDE(DrawArea), .TMDS(TMDS_red));
  TMDS_encoder encode_G(.clk(i_pixclk), .VD(i_grn), .CD(2'b00),
                                        .VDE(DrawArea), .TMDS(TMDS_grn));
  TMDS_encoder encode_B(.clk(i_pixclk), .VD(i_blu), .CD({vSync,hSync}),
                                        .VDE(DrawArea), .TMDS(TMDS_blu));

  // Strobe the TMDS_shift_load once every 10 i_tmdsclks
  // i.e. at the start of new pixel data
  reg [3:0] TMDS_mod10=0;
  reg TMDS_shift_load=0;
  always @(posedge i_tmdsclk) begin
    if (i_reset) begin
      TMDS_mod10 <= 0;
      TMDS_shift_load <= 0;
    end else begin
      TMDS_mod10 <= (TMDS_mod10==4'd9) ? 4'd0 : TMDS_mod10+4'd1;
      TMDS_shift_load <= (TMDS_mod10==4'd9);
    end
  end

  // Latch the TMDS colour values into three shift registers
  // at the start of the pixel, then shift them one bit each i_tmdsclk.
  // We will then output the LSB on each i_tmdsclk.
  reg [9:0] TMDS_shift_red=0, TMDS_shift_grn=0, TMDS_shift_blu=0;
  always @(posedge i_tmdsclk) begin
    if (i_reset) begin
      TMDS_shift_red <= 0;
      TMDS_shift_grn <= 0;
      TMDS_shift_blu <= 0;
    end else begin
      TMDS_shift_red <= TMDS_shift_load ? TMDS_red: {1'b0, TMDS_shift_red[9:1]};
      TMDS_shift_grn <= TMDS_shift_load ? TMDS_grn: {1'b0, TMDS_shift_grn[9:1]};
      TMDS_shift_blu <= TMDS_shift_load ? TMDS_blu: {1'b0, TMDS_shift_blu[9:1]};
    end
  end

  // Finally output the LSB of each color bitstream
  assign o_red= TMDS_shift_red[0];
  assign o_grn= TMDS_shift_grn[0];
  assign o_blu= TMDS_shift_blu[0];

endmodule
