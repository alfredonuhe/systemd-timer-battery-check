#!/bin/bash

# This script notifies user is battery level is below a threshold and it is discharging. 

# write to log when script is called
printf 'Script started. Checking battery.' | systemd-cat -t check-battery
BATTERY_THRESHOLD=20
BATTERY_CAPACITY=`cat /sys/class/power_supply/BAT1/capacity`
BATTERY_STATUS=`cat /sys/class/power_supply/BAT1/status`
if [[ $BATTERY_CAPACITY -le $BATTERY_THRESHOLD && $BATTERY_STATUS="Discharging" ]] ; then
	# write to log if condition is true
	printf 'Battery below threshold. Running notification.' | systemd-cat -t check-battery
	notify-send -u low "Battery Low!" "Battery is at $BATTERY_CAPACITY%. Please connect charger." --icon=dialog-warning
fi


