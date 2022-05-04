while true; do
    cpu="CPU:$(uptime | sed -e 's/^.*load average://g' -e 's/,//g')"
    memavail="MEM: $(grep MemAvailable /proc/meminfo | awk ' { print $2 " " $3 }')"
    volume="VOL: $(pactl get-sink-volume $(pactl get-default-sink) | awk 'NR==1 { print $5 }')"
    xsetroot -name " $cpu | $memavail | $volume | $(date) "
    sleep 2
done
