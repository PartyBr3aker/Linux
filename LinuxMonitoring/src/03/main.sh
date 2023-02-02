#!/bin/bash
#### Description: Prints current system information with tunable colors
#### Four arguments - numbers from 1 to 6 must be used
#### 1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black

chmod +x ./input_check.sh
chmod +x ./system_status.sh
chmod +x ./color_set.sh
. ./input_check.sh
. ./system_status.sh
. ./color_set.sh

white_font="\033[97m"
red_font="\033[31m"
green_font="\033[32m"
blue_font="\033[34m"
purple_font="\033[35m"
black_font="\033[30m"

white_backgr="\033[107m"
red_backgr="\033[41m"
green_backgr="\033[42m"
blue_backgr="\033[44m"
purple_backgr="\033[45m"
black_backgr="\033[40m"
deffault="\033[0m"

bgr1=0
bgr2=0
font1=0
font2=0

check_input "$@"