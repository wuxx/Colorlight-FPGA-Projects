#!/bin/bash


trap 'onCtrlC' INT
function onCtrlC () {
    echo 'exit'
    exit 0
}


succ_count=0
fail_count=0

target_image=/home/pi/oss/colorlight/Colorlight-FPGA-Projects/demo/i9plus/blinky_10.bit

while [ 1 ]; do
    ./probe.sh
    if [ $? -eq 0 ]; then

        ch347prog-sram ${target_image}
            
        if [ $? -eq 0 ]; then
            succ_count=$(($succ_count+1))  
            echo -e "\033[32m---------- SUCC [$succ_count] ----------\033[0m"
            buzzer_succ

        else
            fail_count=$(($fail_count+1))  
            echo -e "\033[31m---------- FAIL [$fail_count] ----------\033[0m"
            buzzer_fail

        fi

        while [ 1 ]; do
            ./probe.sh
            if [ $? -eq 1 ]; then
                break;
            else
                echo -e "\033[32m wait detach >>> \033[0m"
                sleep 0.1
            fi
        done

    else
        echo -e "\033[31m wait attach <<< [SUCC:$succ_count; FAIL:$fail_count] \033[0m"

        sleep 0.1

    fi

done
