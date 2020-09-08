`include "uart_tx.v"

/* baudrate: 500K */
/* Top level module for keypad + UART demo */
module top (
    // input hardware clock (25 MHz)
    clk_i, 
    // UART lines
    TX, 
    );

    /* Clock input */
    input clk_i;

    /* FTDI I/O */
    output TX;

    /* 500K Hz clock generation (from 25 MHz) */
    reg clk_500k = 0;
    reg [31:0] cntr_500k = 32'b0;
    parameter period_500k = 25;

    /* 1 Hz clock generation (from 25 MHz) */
    reg clk_1 = 0;
    reg [31:0] cntr_1 = 32'b0;
    parameter period_1 = 12500000;

    // Note: could also use "0" or "9" below, but I wanted to
    // be clear about what the actual binary value is.
    parameter ASCII_0 = 8'd48;
    parameter ASCII_9 = 8'd57;

    /* UART registers */
    reg [7:0] uart_txbyte = ASCII_0;
    reg uart_send = 1'b1;
    wire uart_txed;

    /* LED register */
    reg ledval = 0;

    /* UART transmitter module designed for
       8 bits, no parity, 1 stop bit. 
    */
    uart_tx_8n1 transmitter (
        // 9600 baud rate clock
        .clk (clk_500k),
        // byte to be transmitted
        .txbyte (uart_txbyte),
        // trigger a UART transmit on baud clock
        .senddata (uart_send),
        // input: tx is finished
        .txdone (uart_txed),
        // output UART tx pin
        .tx (TX),
    );

    /* Wiring */
    assign LED=ledval;
    
    /* Low speed clock generation */
    always @ (posedge clk_i) begin
        /* generate 500K Hz clock */
        cntr_500k <= cntr_500k + 1;
        if (cntr_500k == period_500k) begin
            clk_500k <= ~clk_500k;
            cntr_500k <= 32'b0;
        end

        /* generate 1 Hz clock */
        cntr_1 <= cntr_1 + 1;
        if (cntr_1 == period_1) begin
            clk_1 <= ~clk_1;
            cntr_1 <= 32'b0;
        end
    end

    /* Increment ASCII digit and blink LED */
    always @ (posedge clk_1 ) begin
        ledval <= ~ledval;
        if (uart_txbyte == ASCII_9) begin
            uart_txbyte <= ASCII_0;
        end else begin
            uart_txbyte <= uart_txbyte + 1;
        end
    end

endmodule
