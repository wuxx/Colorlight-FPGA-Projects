#!/bin/bash

FTX_PROG=/home/pi/oss/ftx-prog/ftx_prog

${FTX_PROG} --max-bus-power 501
${FTX_PROG} --manufacturer "FTDI"
${FTX_PROG} --product "Lattice FPGA LFE5U"
${FTX_PROG} --new-serial-number 120001
${FTX_PROG} --cbus 2 TxRxLED
${FTX_PROG} --cbus 3 SLEEP
