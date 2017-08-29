#!/bin/bash

xautolock -time 1 -locker "i3lock -c 272d2d  && sleep 1" -notify 20 -notifier 'xset dpms force off' &
#xautolock -time 7 -locker "systemctl suspend" &
