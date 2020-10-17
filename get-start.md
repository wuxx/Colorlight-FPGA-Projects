# Get Start

The breakout board has a ARMMbed DAPLink debugger which support JTAG and a CDC serial port, we need to use openocd to program the bitstream.
assume that you have install the yosys & prjtrellis & nextpnr, if no, please check these links.
- [https://github.com/cliffordwolf/yosys](https://github.com/cliffordwolf/yosys)
- [https://github.com/YosysHQ/prjtrellis](https://github.com/YosysHQ/prjtrellis)
- [https://github.com/YosysHQ/nextpnr](https://github.com/YosysHQ/nextpnr)

## openocd
`$git clone https://github.com/ntfreak/openocd.git`  
`$cd openocd`  
`$./bootstrap`  
`$./configure --enable-cmsis-dap`  
`$make -j`  
`$sudo make install`  

## setup
after openocd installed, a shell script `dapprog` is written for convenient, export the path of dapprog, then we can use it everywhere, because the openocd can only support svf file, so the bit file is first convert to svf file with a little modified urjtag, then use openocd command svf to process it. in addition, the svf file is program to sram and the bit file is program to the flash.  
`$cd tools`  
`$source env.sh`  
`$dapprog xxx.svf or xxx.bit`  
