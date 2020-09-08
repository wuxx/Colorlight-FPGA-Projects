module blink (
    input      clk_i,
    output reg led_o
);
localparam MAX = 2_500_000;
localparam WIDTH = $clog2(MAX);

wire rst_s;
wire clk_s;

assign clk_s = clk_i;
//pll_12_16 pll_inst (.clki(clk_i), .clko(clk_s), .rst(rst_s));
rst_gen rst_inst (.clk_i(clk_s), .rst_i(1'b0), .rst_o(rst_s));

reg  [WIDTH-1:0] cpt_s;
wire [WIDTH-1:0] cpt_next_s = cpt_s + 1'b1;

wire             end_s = cpt_s == MAX-1;

always @(posedge clk_s) begin
    cpt_s <= (rst_s || end_s) ? {WIDTH{1'b0}} : cpt_next_s;

    if (rst_s)
        led_o <= 1'b0;
    else if (end_s)
        led_o <= ~led_o;
end
endmodule
