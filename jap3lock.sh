#!/bin/bash

# https://github.com/hallgat89/jap3lock
# Depends on: i3lock, fonts-vlgothic, imagemagick

BG='/tmp/lock.png'
BGCOLOR='000000'
SCREENSIZE='1920x1080'
FONT='VL-Gothic-regular'
X=0
Y=0

gen_background() {
    ips='Hello'
    daynum=`date "+%u"`
	case $daynum in
		1)
			ips='月曜日'
		;;
		2)
			ips='火曜日'
		;;
		3)
			ips='水曜日'
		;;
		4)
			ips='木曜日'
		;;
		5)
			ips='金曜日'
		;;
		6)
			ips='土曜日'
		;;
		7)
			ips='日曜日'
		;;
	esac
	
    convert -size $SCREENSIZE xc:#"$BGCOLOR" -gravity center  -font "$FONT" -pointsize 72 \
        -channel RGB -fill white -strokewidth 2 \
        -draw "text $X,$Y '${ips}'" "$BG" 
}

# Lock now
#i3lock -c 000000

# Start making the background
gen_background

# "Unlock"
pkill i3lock

# Lock again with the new background
i3lock -c $BGCOLOR -i $BG
#SCREENSIZE is the size of the image, if you set it smaller, you can tile it with -t
