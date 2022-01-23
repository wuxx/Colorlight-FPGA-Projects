# Colorlight-FPGA-Projects
* [Colorlight i9-v7.2](#colorlight-i9-v72)
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

i9-v7.2 GPIO layout is almost the same as i5, except for differences below:
- SODIMM-Pin-41 change from U16 to L20
- LED D2 change from U16 to L20

## Colorlight i9-v7.2
![top](https://github.com/wuxx/Colorlight-FPGA-Projects/blob/master/doc/i9-v7.2-top.jpg)
![bottom](https://github.com/wuxx/Colorlight-FPGA-Projects/blob/master/doc/i9-v7.2-bottom.jpg)
## Ext-Board
![ext-board-pinout](https://github.com/wuxx/Colorlight-FPGA-Projects/blob/master/doc/i9-v7.2-2.jpg)

### Component
- FPGA  
LFE5U-45F-6BG381C
- SDRAM  
M12L64322A 8MB SDRAM (512K x 32 Bit x 4 Banks)
- SPI Flash  
W25Q64JVSIQ 8MB
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
| D2  | L2       |

### SPI-FLASH (U31)
| Pin | Function |
|-----|----------|
| CS  | R2       |
| MISO| V2       |
| MOSI| W2       |
| SCK | U3       |


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
|   L20    |    41   |    42   |   R1     |
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
| CLK | B9       |
| CKE | VCC      |
| CS  | GND      |
| RAS | B10      |
| CAS | A9       |
| WE  | A10      |
| DQM0| GND      |
| DQM1| GND      |
| DQM2| GND      |
| DQM3| GND      |
| BA0 | B11      |
| BA1 | C8       |
| A0  | B13      |
| A1  | C14      |
| A2  | A16      |
| A3  | A17      |
| A4  | B16      |
| A5  | B15      |
| A6  | A14      |
| A7  | A13      |
| A8  | A12      |
| A9  | A11      |
| A10 | B12      |
| DQ0 | B6       |
| DQ1 | A5       |
| DQ2 | A6       |
| DQ3 | A7       |
| DQ4 | C7       |
| DQ5 | B8       |
| DQ6 | B5       |
| DQ7 | A8       |
| DQ8 | D8       |
| DQ9 | D7       |
| DQ10| E8       |
| DQ11| D6       |
| DQ12| C6       |
| DQ13| D5       |
| DQ14| E7       |
| DQ15| C5       |
| DQ16| C10      |
| DQ17| D9       |
| DQ18| E11      |
| DQ19| D11      |
| DQ20| C11      |
| DQ21| D12      |
| DQ22| E9       |
| DQ23| C12      |
| DQ24| E14      |
| DQ25| C15      |
| DQ26| E13      |
| DQ27| D15      |
| DQ28| E12      |
| DQ29| B17      |
| DQ30| D14      |
| DQ31| D13      |

### ETH-PHY0 (U29)
| Pin   | Function |
|-------|----------|
| MDC   |    N5    |
| MDIO  |    P5    |
| RESET |    P4    |
| GTXCLK|    U19   |
| TXD[0]|    U20   |
| TXD[1]|    T19   |
| TXD[2]|    T20   |
| TXD[3]|    R20   |
| TX_EN |    P19   |
| RXC   |    L19   |
| RXD[0]|    P20   |
| RXD[1]|    N19   |
| RXD[2]|    N20   |
| RXD[3]|    M19   |
| RX_DV |    M20   |

### ETH-PHY1 (U30)
| Pin   | Function |
|-------|----------|
| MDC   |    N5    |
| MDIO  |    P5    |
| RESET |    P4    |
| GTXCLK|    G1    |
| TXD[0]|    G2    |
| TXD[1]|    H1    |
| TXD[2]|    J1    |
| TXD[3]|    J3    |
| TX_EN |    K1    |
| RXC   |    H2    |
| RXD[0]|    K2    |
| RXD[1]|    L1    |
| RXD[2]|    N1    |
| RXD[3]|    P1    |
| RX_DV |    P2    |

## How to Buy
you can buy Colorlight i5, i9 and 5A-75B on our aliexpress store  
[Colorlight i5 & i9](https://www.aliexpress.com/item/1005001686186007.html?spm=2114.12010615.8148356.1.3e035362vDqWtV)  
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
