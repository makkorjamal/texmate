#!/bin/sh

touch /root/.Xauthority
export XAUTHORITY=/root/.Xauthority

vncserver :1 &
websockify -D --web /usr/share/novnc/ 6080 localhost:5901 &
wait

