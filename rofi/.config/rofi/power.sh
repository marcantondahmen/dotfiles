#!/bin/bash

chosen=$(printf "Lock\nSleep\nReboot\nShutdown\nLog Out" | rofi -dmenu -i)

case "$chosen" in
"Lock") bash ~/.config/i3/lock.sh ;;
"Sleep") systemctl suspend ;;
"Reboot") reboot ;;
"Shutdown") poweroff ;;
"Log Out") i3-msg exit ;;
*) exit 1 ;;
esac
