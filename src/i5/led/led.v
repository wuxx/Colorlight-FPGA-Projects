module blink (
    input      clk_i,
    output     P2_3,  P2_4,  P2_5,  P2_6,
               P2_25, P2_26, P2_27, P2_28
);

localparam MAX   = 2_500_000;
localparam WIDTH = $clog2(MAX);

wire rst_s;
wire clk_s;

assign clk_s = clk_i;
//pll_12_16 pll_inst (.clki(clk_i), .clko(clk_s), .rst(rst_s));
rst_gen rst_inst (.clk_i(clk_s), .rst_i(1'b0), .rst_o(rst_s));

reg  [WIDTH-1:0] cpt_s;
wire [WIDTH-1:0] cpt_next_s = cpt_s + 1'b1;

wire             end_s = cpt_s == MAX-1;

reg [7:0] counter = 0;

assign P2_28 = !counter[7];
assign P2_27 = !counter[6];
assign P2_26 = !counter[5];
assign P2_25 = !counter[4];

assign P2_3  = !counter[3];
assign P2_4  = !counter[2];
assign P2_5  = !counter[1];
assign P2_6  = !counter[0];

always @(posedge clk_s) begin
    cpt_s <= (rst_s || end_s) ? {WIDTH{1'b0}} : cpt_next_s;

    if (rst_s)
        counter <= 1'b0;
    else if (end_s)
        counter <= counter + 1;
end
endmodule
