#!/bin/bash

while [ 1 ]; do
    if [ -e /dev/ttyACM0 ]; then

        picocom -b 115200 /dev/ttyACM0

    else
        echo "wait ttyACM0..."
        sleep 0.5

    fi

done
