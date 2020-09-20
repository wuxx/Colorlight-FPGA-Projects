module top_checkered (
    input  wire clk_25mhz,
    output wire oled_csn,
    output wire oled_clk,
    output wire oled_mosi,
    output wire oled_dc,
    output wire oled_resn
);
    //                  checkered      red   green   blue     red     green blue
    wire [15:0] color = x[3] ^ y[3] ? {5'd0, x[6:1], 5'd0} : {y[5:1], 6'd0, 5'd0};
    wire [6:0] x, y;
    
    oled_video #(
        .C_init_file("oled_init_16bit.mem"),
        .C_init_size(44)
    ) oled_video_inst (
        .clk(clk_25mhz),
        .x(x),
        .y(y),
        .color(color),
        .oled_csn(oled_csn),
        .oled_clk(oled_clk),
        .oled_mosi(oled_mosi),
        .oled_dc(oled_dc),
        .oled_resn(oled_resn)
    );

endmodule
