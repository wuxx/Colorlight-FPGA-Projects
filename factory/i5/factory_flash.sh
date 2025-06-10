#!/bin/bash


trap 'onCtrlC' INT
function onCtrlC () {
    echo 'exit'
    exit 0
}


succ_count=0
fail_count=0

#target_image=/home/pi/oss/colorlight/Colorlight-FPGA-Projects/demo/i9/blink.svf
#target_image=/home/pi/oss/Colorlight-FPGA-Projects/demo/i5/blink.bit
target_image=/home/pi/oss/colorlight/Colorlight-FPGA-Projects/demo/i5/colorlight_i5.svf

while [ 1 ]; do
    ./probe.sh
    if [ $? -eq 0 ]; then

        ./unlock.sh
        dapprog ${target_image}
        #ecpdap flash write --freq 5000 ${target_image}
            
        if [ $? -eq 0 ]; then
            succ_count=$(($succ_count+1))  
            buzzer_succ
            echo -e "\033[32m---------- SUCC [$succ_count] ----------\033[0m"

        else
            fail_count=$(($fail_count+1))  
            buzzer_fail
            echo -e "\033[31m---------- FAIL [$fail_count] ----------\033[0m"

        fi

        while [ 1 ]; do
            ./probe.sh
            if [ $? -eq 1 ]; then
                break;
            else
                echo "wait detach >>> [$(lsusb | grep "0d28:0204")]"
                sleep 0.1
            fi
        done

    else
        echo "wait attach <<< [$(lsusb | grep "0d28:0204")]"

        sleep 0.1

    fi

done
