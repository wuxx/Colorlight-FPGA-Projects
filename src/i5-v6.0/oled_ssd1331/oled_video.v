// SPI OLED SSD1331 display video XY scan core
// AUTHORS=EMARD,MMICKO
// LICENSE=BSD

module oled_video #(
  // file name is relative to directory path in which verilog compiler is running
  // screen can be also XY flipped and/or rotated from this init file
  parameter C_init_file = "oled_init_16bit.mem",
  parameter C_init_size = 0, // bytes in init file
) (
  input  wire clk, // SPI display clock rate will be half of this clock rate
  
  output reg  [C_x_bits-1:0] x,
  output reg  [C_y_bits-1:0] y,
  output reg  next_pixel, // 1 when x/y changes
  input  wire [C_color_bits-1:0] color, 

  output wire oled_csn,
  output wire oled_clk,
  output wire oled_mosi,
  output wire oled_dc,
  output wire oled_resn
);
  localparam C_color_bits = 16;
  localparam C_x_size = 96;  // pixel X screen size
  localparam C_y_size = 64;  // pixel Y screen size
  localparam C_x_bits = $clog2(C_x_size); 
  localparam C_y_bits = $clog2(C_y_size);

  reg [7:0] C_oled_init[0:C_init_size-1];
  initial begin
    $readmemh(C_init_file, C_oled_init);
  end

  reg [1:0] reset_cnt;
  reg [9:0] init_cnt;
  reg [7:0] data;
  reg dc;
  reg byte; // alternates data byte for 16-bit mode
  
  assign oled_resn = ~reset_cnt[0];
  assign oled_csn = reset_cnt[0]; 
  assign oled_dc = dc;
  assign oled_clk = ~init_cnt[0];
  assign oled_mosi = data[7];

  always @(posedge clk) begin
        if (reset_cnt != 2) begin
            reset_cnt <= reset_cnt+1;
            data <= C_oled_init[0];
        end else if (init_cnt[9:4] != C_init_size) begin
            init_cnt <= init_cnt + 1;
            if (init_cnt[3:0] == 0) begin
                if (dc == 0) data <= C_oled_init[init_cnt[9:4]];
                else begin
                    byte <= ~byte;
		    data <= byte ? color[7:0] : color[15:8];
                    if(byte == 0) begin
                      next_pixel <= 1;
                      if (x == C_x_size-1) begin
                        x <= 0;
                        y <= y + 1;
                      end else x <= x + 1;
                    end
                end
            end else begin
              next_pixel <= 0;
              if (init_cnt[0] == 0) data <= { data[6:0], 1'b0 };
            end
	end else begin 
            dc <= 1;
            init_cnt[9:4] <= C_init_size - 1;
        end
  end

endmodule
