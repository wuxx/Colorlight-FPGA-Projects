# Colorlight-FPGA-Projects
* [Colorlight i5-v7.0](#colorlight-i5-v70)
* [Ext Board](#ext-board)
* [Component](#component)
    * [Jtag](#jtag)
    * [Clock](#clock)
    * [LED](#led)
    * [SPI-Flash](#spi-flash-u31)
    * [DDR2 SODIMM 200P](#ddr2-sodimm-200p)
    * [SDRAM](#sdram-u18)
    * [ETH-PHY0](#eth-phy0-u28)
    * [ETH-PHY1](#eth-phy1-u29)
* [How to Buy](#how-to-buy)
* [Reference](#reference)
    
some board & modules made by Colorlight are based on Lattice ECP5 series and Xilinx XC7 series, which are supported by open source toolchain (yosys & prjtrellis & nextpnr), can be used to make very interesting project.  
current focus on Colorlight i5-v7.0 and i9-v7.2, i9plus-v6.1,  check [get-start](./get-start.md) to see how to setup the env and program the bitstream.  
the Colorlight i9-v7.2 contain a LFE5U-45F-6BG381, all GPIO already reversed, check [Colorlight i9-v7.2](colorlight_i9_v7.2.md) to see the detail.  
the Colorlight i9plus-v6.1 contain a XC7A50T-FGG484, all GPIO already reversed, check [Colorlight i9plus-v6.1](colorlight_i9plus_v6.1.md) to see the detail.

## Colorlight i5-v7.0
![top](https://github.com/wuxx/Colorlight-FPGA-Projects/blob/master/doc/i5-top.jpg)
![bottom](https://github.com/wuxx/Colorlight-FPGA-Projects/blob/master/doc/i5-bottom.jpg)
## Ext-Board
![ext-board-1](https://github.com/wuxx/Colorlight-FPGA-Projects/blob/master/doc/ext-board-1.jpg)
![ext-board-2](https://github.com/wuxx/Colorlight-FPGA-Projects/blob/master/doc/ext-board-2.jpg)
![ext-board-pinout](https://github.com/wuxx/Colorlight-FPGA-Projects/blob/master/doc/i5_extboard_v1.2_pinout.png)

### Component
- FPGA  
LFE5U-25F-6BG381C
- SDRAM  
EM638325BK-6H 8MB
- SPI Flash  
GD25Q16CSIG 2MB
- Ethernet PHY  
1Gb Ethernet PHY Broadcom B50612D x 2

### JTAG
| Pin | Function |
|-----|----------|
| J27 | TCK      |
| J31 | TMS      |
| J32 | TDI      |
| J30 | TDO      |

### Clock
A 25Mhz clock is connected to FPGA with pin P3

### LED
| Pin | Function |
|-----|----------|
| U16 | D2       |

### SPI-FLASH (U31)
| Pin | Function |
|-----|----------|
| R2  | CS       |
| V2  | MISO     |
| W2  | MOSI     |
| U3  | SCK      |


### DDR2-SODIMM-200P
| Function | Top-Pin | Bot-Pin | Function |
|----------|---------|---------|----------|
|   GND    |    1    |    2    |   5V     |
|   GND    |    3    |    4    |   5V     |
|   GND    |    5    |    6    |   5V     |
|   GND    |    7    |    8    |   5V     |
|   GND    |    9    |    10   |   5V     |
|   GND    |    11   |    12   |   5V     |
|   NC     |    13   |    14   |   NC     |
|   ETH1_1P|    15   |    16   |   ETH2_1P|
|   ETH1_1N|    17   |    18   |   ETH2_1N|
|   NC     |    19   |    20   |   NC     |
|   ETH1_2N|    21   |    22   |   ETH2_2N|
|   ETH1_2P|    23   |    24   |   ETH2_2P|
|   NC     |    25   |    26   |   NC     |
|   ETH1_3P|    27   |    28   |   ETH2_3P|
|   ETH1_3N|    29   |    30   |   ETH2_3N|
|   NC     |    31   |    32   |   NC     |
|   ETH1_4N|    33   |    34   |   ETH2_4N|
|   ETH1_4P|    35   |    36   |   ETH2_4P|
|   NC     |    37   |    38   |   NC     |
|   GND    |    39   |    40   |   GND    |
|          |         |         |          |
|          |         |         |          |
|   U16    |    41   |    42   |   R1     |
|   NC     |    43   |    44   |   T1     |
|   NC     |    45   |    46   |   U1     |
|   NC     |    47   |    48   |   Y2     |
|   K18    |    49   |    50   |   W1     |
|   C18    |    51   |    52   |   V1     |
|   NC     |    53   |    54   |   M1     |
|   GND    |    55   |    56   |   GND    |
|   T18    |    57   |    58   |   N2     |
|   R18    |    59   |    60   |   N3     |
|   R17    |    61   |    62   |   T2     |
|   P17    |    63   |    64   |   M3     |
|   M17    |    65   |    66   |   T3     |
|   T17    |    67   |    68   |   R3     |
|   U18    |    69   |    70   |   N4     |
|   U17    |    71   |    72   |   M4     |
|   P18    |    73   |    74   |   L4     |
|   N17    |    75   |    76   |   L5     |
|   N18    |    77   |    78   |   P16    |
|   M18    |    79   |    80   |   J16    |
|   L20    |    81   |    82   |   J18    |
|   L18    |    83   |    84   |   J17    |
|   K20    |    85   |    86   |   H18    |
|   K19    |    87   |    88   |   H17    |
|   J20    |    89   |    90   |   G18    |
|   J19    |    91   |    92   |   H16    |
|   H20    |    93   |    94   |   F18    |
|   G20    |    95   |    96   |   G16    |
|   G19    |    97   |    98   |   E18    |
|   F20    |    99   |    100  |   F17    |
|   F19    |    101  |    102  |   F16    |
|   E20    |    103  |    104  |   E16    |
|   GND    |    105  |    106  |   GND    |
|   GND    |    107  |    108  |   GND    |
|   E19    |    109  |    110  |   E17    |
|   D20    |    111  |    112  |   D18    |
|   D19    |    113  |    114  |   D17    |
|   C20    |    115  |    116  |   G5     |
|   B20    |    117  |    118  |   D16    |
|   B19    |    119  |    120  |   F5     |
|   B18    |    121  |    122  |   E6     |
|   A19    |    123  |    124  |   E5     |
|   C17    |    125  |    126  |   F4     |
|   A18    |    127  |    128  |   E4     |
|   D3     |    129  |    130  |   F1     |
|   C4     |    131  |    132  |   F3     |
|   B4     |    133  |    134  |   G3     |
|   C3     |    135  |    136  |   H3     |
|   E3     |    137  |    138  |   H4     |
|   A3     |    139  |    140  |   H5     |
|   C2     |    141  |    142  |   J4     |
|   B1     |    143  |    144  |   J5     |
|   C1     |    145  |    146  |   K3     |
|   D2     |    147  |    148  |   K4     |
|   D1     |    149  |    150  |   K5     |
|   E2     |    151  |    152  |   B3     |
|   E1     |    153  |    154  |   A2     |
|   F2     |    155  |    156  |   B2     |
|   GND    |    157  |    158  |   GND    |
|   NC     |    159  |    160  |   NC     |
|   NC     |    161  |    162  |   NC     |
|   NC     |    163  |    164  |   NC     |
|   NC     |    165  |    166  |   NC     |
|   NC     |    167  |    168  |   NC     |
|   NC     |    169  |    170  |   NC     |
|   NC     |    171  |    172  |   NC     |
|   NC     |    173  |    174  |   NC     |
|   NC     |    175  |    176  |   NC     |
|   NC     |    177  |    178  |   NC     |
|   NC     |    179  |    180  |   NC     |
|   NC     |    181  |    182  |   NC     |
|   NC     |    183  |    184  |   NC     |
|   NC     |    185  |    186  |   NC     |
|   NC     |    187  |    188  |   NC     |
|   NC     |    189  |    190  |   NC     |
|   NC     |    191  |    192  |   NC     |
|   NC     |    193  |    194  |   NC     |
|   NC     |    195  |    196  |   NC     |
|   NC     |    197  |    198  |   NC     |
|   GND    |    199  |    200  |   GND    |

### SDRAM (U18)
| Pin | Function |
|-----|----------|
| B9  | CLK      |
| VCC | CKE      |
| GND | CS       |
| B10 | RAS      |
| A9  | CAS      |
| A10 | WE       |
| GND | DQM0     |
| GND | DQM1     |
| GND | DQM2     |
| GND | DQM3     |
| B11 | BA0      |
|(GND on v6.0; C8 on v7.0) |  BA1    |
| B13 | A0       |
| C14 | A1       |
| A16 | A2       |
| A17 | A3       |
| B16 | A4       |
| B15 | A5       |
| A14 | A6       |
| A13 | A7       |
| A12 | A8       |
| A11 | A9       |
| B12 | A10      |
| B6  | DQ0      |
| A5  | DQ1      |
| A6  | DQ2      |
| A7  | DQ3      |
| C7  | DQ4      |
| B8  | DQ5      |
| B5  | DQ6      |
| A8  | DQ7      |
| D8  | DQ8      |
| D7  | DQ9      |
| E8  | DQ10     |
| D6  | DQ11     |
| C6  | DQ12     |
| D5  | DQ13     |
| E7  | DQ14     |
| C5  | DQ15     |
| C10 | DQ16     |
| D9  | DQ17     |
| E11 | DQ18     |
| D11 | DQ19     |
| C11 | DQ20     |
| D12 | DQ21     |
| E9  | DQ22     |
| C12 | DQ23     |
| E14 | DQ24     |
| C15 | DQ25     |
| E13 | DQ26     |
| D15 | DQ27     |
| E12 | DQ28     |
| B17 | DQ29     |
| D14 | DQ30     |
| D13 | DQ31     |

### ETH-PHY0 (U28)
| Pin   | Function |
|-------|----------|
| N5    |   MDC    |
| P5    |   MDIO   |
| P4    |   RESET  |
| U19   |   GTXCLK |
| U20   |   TXD[0] |
| T19   |   TXD[1] |
| T20   |   TXD[2] |
| R20   |   TXD[3] |
| P19   |   TX_EN  |
| L19   |   RXC    |
| P20   |   RXD[0] |
| N19   |   RXD[1] |
| N20   |   RXD[2] |
| M19   |   RXD[3] |
| M20   |   RX_DV  |

### ETH-PHY1 (U29)
| Pin   | Function |
|-------|----------|
| N5    |   MDC    |
| P5    |   MDIO   |
| P4    |   RESET  |
| G1    |   GTXCLK |
| G2    |   TXD[0] |
| H1    |   TXD[1] |
| J1    |   TXD[2] |
| J3    |   TXD[3] |
| K1    |   TX_EN  |
| H2    |   RXC    |
| K2    |   RXD[0] |
| L1    |   RXD[1] |
| N1    |   RXD[2] |
| P1    |   RXD[3] |
| P2    |   RX_DV  |

## How to Buy
you can buy Colorlight i5 and 5A-75B on our aliexpress store  
[Colorlight i5 & i9](https://www.aliexpress.com/item/1005001686186007.html?spm=2114.12010615.8148356.1.3e035362vDqWtV)  
[Colorlight i9plus](https://www.aliexpress.us/item/3256805434471000.html?spm=5261.ProductManageOnline.0.0.189c2ddbB6XS5T&gatewayAdapt=glo2usa4itemAdapt)
[Colorlight 5A-75B](https://www.aliexpress.com/item/1005001686175194.html?spm=2114.12010615.8148356.3.3e035362B6o2DO)  
## reference

- chubby75  
[https://github.com/q3k/chubby75](https://github.com/q3k/chubby75)
- Colorlight-5A-75B  
[https://github.com/kholia/Colorlight-5A-75B](https://github.com/kholia/Colorlight-5A-75B)
- colorlight-i5-tips by kazkojima  
[https://github.com/kazkojima/colorlight-i5-tips](https://github.com/kazkojima/colorlight-i5-tips)
- ulx3s_examples by lawrie  
[https://github.com/lawrie/ulx3s_examples](https://github.com/lawrie/ulx3s_examples)
- ULX3S-Blinky by DoctorWkt  
[https://github.com/DoctorWkt/ULX3S-Blinky](https://github.com/DoctorWkt/ULX3S-Blinky.git)
- litex without dram  
[https://github.com/wuxx/litexOnColorlightLab004](https://github.com/wuxx/litexOnColorlightLab004)
- litex with dram  
[https://github.com/ghent360/riscvOnColorlight-5A-75B](https://github.com/ghent360/riscvOnColorlight-5A-75B)
- litex with ethernet  
[https://github.com/enjoy-digital/colorlite](https://github.com/enjoy-digital/colorlite)
- supported in IceStudio and Apio
[https://github.com/benitoss/ColorLight_FPGA_boards](https://github.com/benitoss/ColorLight_FPGA_boards)
