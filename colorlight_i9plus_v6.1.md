# Colorlight-FPGA-Projects
- [Colorlight-FPGA-Projects](#colorlight-fpga-projects)
  - [Colorlight i9plus-v6.1](#colorlight-i9plus-v61)
  - [Ext-Board](#ext-board)
    - [Component](#component)
    - [JTAG](#jtag)
    - [Clock](#clock)
    - [LED](#led)
    - [SPI-FLASH (U12)](#spi-flash-u12)
    - [DDR2-SODIMM-200P](#ddr2-sodimm-200p)
    - [SDRAM (U6)](#sdram-u6)
    - [ETH-PHY0 (U5)](#eth-phy0-u5)
    - [ETH-PHY1 (U9)](#eth-phy1-u9)
  - [How to Build and Program](#how-to-build-and-program)
    - [Install the Toolchain](#install-the-toolchain)
    - [Compile the Bitstream](#compile-the-bitstream)
    - [Build the Openocd](#build-the-openocd)
    - [Program](#program)
  - [How to Buy](#how-to-buy)
  - [reference](#reference)

colorlight i9plus-v6.1 

## Colorlight i9plus-v6.1
![top](https://github.com/wuxx/Colorlight-FPGA-Projects/blob/master/doc/i9plus-v6.1-top.jpg)
![bottom](https://github.com/wuxx/Colorlight-FPGA-Projects/blob/master/doc/i9plus-v6.1-bottom.jpg)
## Ext-Board
![ext-board-1](https://github.com/wuxx/Colorlight-FPGA-Projects/blob/master/doc/i9plus-extboard-1.jpg)
![ext-board-2](https://github.com/wuxx/Colorlight-FPGA-Projects/blob/master/doc/i9plus-extboard-2.jpg)
![ext-board-pinout](https://github.com/wuxx/Colorlight-FPGA-Projects/blob/master/doc/i9plus-v6.1-pinout.png)

### Component
- FPGA  
XC7A50T-FGG484
- SDRAM  
M12L64322A 8MB SDRAM (512K x 32 Bit x 4 Banks)
- SPI Flash  
MX25L128 16MB
- Ethernet PHY  
1Gb Ethernet PHY Broadcom B50612D x 2

### JTAG
| Pin | Function |
|-----|----------|
| J5  | TCK      |
| J4  | TMS      |
| J3  | TDI      |
| J2  | TDO      |

### Clock
A 25Mhz clock is connected to FPGA with pin K4

### LED
| LED | FPGA Pin |
|-----|----------|
| D2  | A18      |

### SPI-FLASH (U12)
| U12 Pin | FPGA Pin |
|-----|----------|
| CS  | T19      |
| MISO| R22      |
| MOSI| P22      |
| SCK | L12      |


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
|   R2     |    41   |    42   |   P5     |
|   NC     |    43   |    44   |   T6     |
|   NC     |    45   |    46   |   U7     |
|   NC     |    47   |    48   |   U6     |
|   T3     |    49   |    50   |   U5     |
|   T4     |    51   |    52   |   V5     |
|   NC     |    53   |    54   |   U1     |
|   GND    |    55   |    56   |   GND    |
|   U2     |    57   |    58   |   H3     |
|   U3     |    59   |    60   |   J1     |
|   V2     |    61   |    62   |   K1     |
|   V3     |    63   |    64   |   L1     |
|   W1     |    65   |    66   |   M1     |
|   Y1     |    67   |    68   |   J2     |
|   AA1    |    69   |    70   |   K2     |
|   AB1    |    71   |    72   |   K3     |
|   W2     |    73   |    74   |   G3     |
|   Y2     |    75   |    76   |   J4     |
|   AB2    |    77   |    78   |   G4     |
|   AA3    |    79   |    80   |   F4     |
|   AB3    |    81   |    82   |   L4     |
|   Y3     |    83   |    84   |   R3     |
|   W4     |    85   |    86   |   M3     |
|   AA4    |    87   |    88   |   V4     |
|   Y4     |    89   |    90   |   R4     |
|   AB5    |    91   |    92   |   T5     |
|   AA5    |    93   |    94   |   J5     |
|   Y6     |    95   |    96   |   J6     |
|   AB6    |    97   |    98   |   W5     |
|   AA6    |    99   |    100  |   L5     |
|   Y7     |    101  |    102  |   L6     |
|   AB7    |    103  |    104  |   W6     |
|   GND    |    105  |    106  |   GND    |
|   GND    |    107  |    108  |   GND    |
|   AA8    |    109  |    110  |   V7     |
|   AB8    |    111  |    112  |   N13    |
|   Y8     |    113  |    114  |   N14    |
|   W7     |    115  |    116  |   P15    |
|   Y9     |    117  |    118  |   P16    |
|   V8     |    119  |    120  |   R16    |
|   W9     |    121  |    122  |   N17    |
|   V9     |    123  |    124  |   V17    |
|   R14    |    125  |    126  |   P17    |
|   P14    |    127  |    128  |   U17    |
|   W17    |    129  |    130  |   T18    |
|   Y18    |    131  |    132  |   R17    |
|   AA18   |    133  |    134  |   U18    |
|   W19    |    135  |    136  |   R18    |
|   AB18   |    137  |    138  |   N18    |
|   Y19    |    139  |    140  |   R19    |
|   AA19   |    141  |    142  |   N19    |
|   V18    |    143  |    144  |   N15    |
|   V19    |    145  |    146  |   M16    |
|   AB20   |    147  |    148  |   M15    |
|   AA20   |    149  |    150  |   L15    |
|   AA21   |    151  |    152  |   L16    |
|   AB21   |    153  |    154  |   K14    |
|   Y21    |    155  |    156  |   N22    |
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

### SDRAM (U6)
| U6 Pin | FPGA Pin |
|-----|----------|
| CLK | E14      |
| CKE | VCC      |
| CS  | GND      |
| RAS | A14      |
| CAS | D14      |
| WE  | D17      |
| DQM0| GND      |
| DQM1| GND      |
| DQM2| GND      |
| DQM3| GND      |
| BA0 | D19      |
| BA1 | B13      |
| A0  | C20      |
| A1  | C19      |
| A2  | C13      |
| A3  | F13      |
| A4  | G13      |
| A5  | G15      |
| A6  | F14      |
| A7  | F18      |
| A8  | E13      |
| A9  | E18      |
| A10 | C14      |
| DQ0 | F21      |
| DQ1 | E22      |
| DQ2 | F20      |
| DQ3 | E21      |
| DQ4 | F19      |
| DQ5 | D22      |
| DQ6 | E19      |
| DQ7 | D21      |
| DQ8 | K21      |
| DQ9 | L21      |
| DQ10| K22      |
| DQ11| M21      |
| DQ12| L20      |
| DQ13| M22      |
| DQ14| N20      |
| DQ15| M20      |
| DQ16| B18      |
| DQ17| D20      |
| DQ18| A19      |
| DQ19| A21      |
| DQ20| A20      |
| DQ21| B21      |
| DQ22| C22      |
| DQ23| B22      |
| DQ24| G21      |
| DQ25| G22      |
| DQ26| H20      |
| DQ27| H22      |
| DQ28| J20      |
| DQ29| J22      |
| DQ30| G20      |
| DQ31| J21      |

### ETH-PHY0 (U5)
| U5 Pin   | FPGA Pin |
|-------|----------|
| MDC   |    G1    |
| MDIO  |    G2    |
| RESET |    H2    |
| GTXCLK|    A1    |
| TXD[0]|    B2    |
| TXD[1]|    B1    |
| TXD[2]|    C2    |
| TXD[3]|    D2    |
| TX_EN |    D1    |
| RXC   |    H2/H4 |
| RXD[0]|    E3    |
| RXD[1]|    E2    |
| RXD[2]|    E1    |
| RXD[3]|    F3    |
| RX_DV |    F1    |

### ETH-PHY1 (U9)
| U9 Pin   | FPGA Pin |
|-------|----------|
| MDC   |    G1    |
| MDIO  |    G2    |
| RESET |    H2    |
| GTXCLK|    M6    |
| TXD[0]|    M5    |
| TXD[1]|    M2    |
| TXD[2]|    N4    |
| TXD[3]|    P4    |
| TX_EN |    N5    |
| RXC   |    L3/H2 |
| RXD[0]|    N2    |
| RXD[1]|    N3    |
| RXD[2]|    P1    |
| RXD[3]|    P2    |
| RX_DV |    R1    |

## How to Build and Program
use the [openXC7 project](https://github.com/openXC7) for compile, and the openocd for program the bitstream.

### Install the Toolchain
openXC7 provides a convenient script to install the toolchain with just one command
```
$wget -qO - https://raw.githubusercontent.com/kintex-chatter/toolchain-installer/main/toolchain-installer.sh | bash
```

### Compile the Bitstream
```
$git clone https://github.com/wuxx/demo-projects
$cd demo-projects/blinky-colorlight-i9plus
$make
```

### Build the Openocd 
WCH release the openocd patch of the CH347, they also provide a GUI tool for program the XC7 series chip, can check it [here](https://github.com/WCHSoftGroup/ch347)
```
$git clone https://github.com/openocd-org/openocd.git
$cd openocd
$git checkout 3a4f445bd92101d3daee3715178d3fbff3b7b029
$cp ~/Colorlight-FPGA-Projects/tools/openocd-patch-for-ch347/ch347.patch .
$git apply --reject --whitespace=fix ch347.patch
$./bootstrap
$./configure --enable-ch347 --disable-werror
$make -j
#make install #considering that there may be multiple openocds in your system, it is not recommended to execute the make install
```

### Program
use the openocd to program the bitstream, there are two wrapped script commands `ch347prog-sram` and `ch347prog-flash` in the tools directory, you can import scripts into the environment for use under any path.  
NOTE-1: you may need to edit the openocd path(OPENOCD_ROOT) in script.  
NOTE-2: Since the flash chip on the module is protected by default, you need to perform the unlock operation when using the module for the first time.  

```
$cd ~/Colorlight-FPGA-Projects/tools
$source env.sh
$ch347prog-sram unlock_flash_xc7a50t.bit #unlock the flash
$cd ~/demo-projects/blinky-colorlight-i9plus
$ch347prog-sram blinky.bit  (program to SRAM)
or
$ch347prog-flash blinky.bit (program to SPI-Flash)
```

## How to Buy
you can buy Colorlight i5, i9, i9plus and 5A-75B on our aliexpress store  
[Colorlight i9plus ](https://www.aliexpress.us/item/3256805434471000.html?spm=5261.ProductManageOnline.0.0.189c2ddbB6XS5T&gatewayAdapt=glo2usa4itemAdapt)  
[Colorlight i5 & i9](https://www.aliexpress.com/item/1005001686186007.html?spm=2114.12010615.8148356.1.3e035362vDqWtV)  
[Colorlight 5A-75B](https://www.aliexpress.com/item/1005001686175194.html?spm=2114.12010615.8148356.3.3e035362B6o2DO)  

## reference 
- colorlight_reverse
[https://github.com/chmousset/colorlight_reverse](https://github.com/chmousset/colorlight_reverse)
- openXC7 project
[https://github.com/openXC7/demo-projects](https://github.com/openXC7/demo-projects)
- CH347
[https://github.com/WCHSoftGroup/ch347](https://github.com/WCHSoftGroup/ch347)
- bscan_spi_bitstreams
[https://github.com/quartiq/bscan_spi_bitstreams](https://github.com/quartiq/bscan_spi_bitstreams)
