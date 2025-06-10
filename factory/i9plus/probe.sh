#!/bin/bash

#ch347prog-probe >/dev/null 2>&1

lsusb | grep "1a86:55dd" >/dev/null 2>&1
