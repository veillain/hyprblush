status=$(upower -d | grep "percentage" | grep -P -o '[0-9]+(?=%)' | head -n 1)

if [ "$status" -gt 99 ]; then
    echo 100
else
    echo ${status}%
fi
