#!/bin/bash
username="$(whoami)"
hostname="$(echo $HOSTNAME)"
tanggal="$(date "+%d")"
bulan="$(date "+%b")"
tahun="$(date "+%y")"

current_time=$(timedatectl | grep Local | awk '{print $5}' | cut -d':' -f1)

if [[ $current_time =~ ^[0-9]+$ ]]; then
    if (( current_time >= 0 && current_time < 12 )); then
    echo "Good Morning,"
    elif (( current_time >= 12 && current_time < 15 )); then
        echo "Good Noon,"
    elif (( current_time >= 15 && current_time < 18 )); then
        echo "Good Afternoon,"
    else
        echo "Good Night,"
    fi
else
    echo "Gagal mendapatkan waktu lokal"
fi
