#!/bin/bash

FTX_PROG="sudo /home/pi/oss/ftx-prog/ftx_prog"

${FTX_PROG} --max-bus-power 500
${FTX_PROG} --manufacturer "FER-RADIONA-EMARD"
${FTX_PROG} --product "ULX3S FPGA 85K v3.0.3"
${FTX_PROG} --new-serial-number 120001
${FTX_PROG} --cbus 2 TxRxLED
${FTX_PROG} --cbus 3 SLEEP
