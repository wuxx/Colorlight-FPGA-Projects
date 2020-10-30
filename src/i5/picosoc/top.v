module top(
    input clk_25mhz,
    output [7:0] led,
    output UART_TX,
    input UART_RX,
);

wire clk;
pll pll(
    .clki(clk_25mhz),
    .clko(clk)
);
attosoc soc(
    .clk(clk),
    .led(led),
    .uart_tx(UART_TX),
    .uart_rx(UART_RX)
);
endmodule
